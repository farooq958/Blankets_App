import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hbk/Data/AppData/app_preferences.dart';
import 'package:hbk/Data/DataSource/Resources/imports.dart';
import 'package:hbk/Data/Repository/Orders/orders_repo.dart';
import 'package:hbk/Domain/Models/Cart/cart_model.dart';
import 'package:hbk/Presentation/Common/Dialogs/loading_dialog.dart';

import 'package:hbk/Presentation/Widgets/Dashboard/CartScreen/Components/cart_item_tile.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/CartScreen/Components/empty_cart_screen.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/CartScreen/Controller/cart_cubit.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/CartScreen/Controller/cart_grand_total_map_cubit.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/CartScreen/SqDb/cart_db.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/CartScreen/SqDb/post_order_db.dart';
import 'Checkout/check_out_screen.dart';
import 'Controller/notifier.dart';
import 'Controller/post_order_cubit.dart';

class CartScreen extends StatefulWidget {
  final PageController? pageController;
  final bool? isGuest;

  const CartScreen({super.key, this.pageController, this.isGuest});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Map<int, String> grandMap = {};
  List<ValueNotifier<int>> listNotifier = [];
  TextEditingController instructionController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState

    if (widget.isGuest == true) {
      CustomDialog.dialog(context, const Column());
    }
    CartNotifier.grandSumTotalNotifier.value = 0.0;
    CartNotifier.grandCtnNotifier.value = 0.0;
    getGrandTotalFromDb();

    context.read<CartCubit>().getAllCartItems();
    context
        .read<CartGrandTotalMapCubit>()
        .setGetMap(0, '1', {}, fromRemove: true);

    readMap(context);

    super.initState();
  }

  ValueNotifier<double> grandTotal = ValueNotifier(0.0);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  AppText(
                    'Account credit limit',
                    style: Styles.circularStdRegular(context,
                        fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: 'Rs ',
                        style:
                            Styles.circularStdBold(context, fontSize: 16.sp)),
                    TextSpan(
                        text: Utils.getAvailableLimit(
                            SharedPrefs.userData!.creditLimit.toString(),
                            SharedPrefs.userData!.tolerance.toString(),
                            SharedPrefs.userData!.balance.toString(),
                            SharedPrefs.userData!.ordersBal.toString(),
                            SharedPrefs.userData!.specialDeal.toString()),
                        style: Styles.circularStdBold(context,
                            fontWeight: FontWeight.w900, fontSize: 20)),
                  ]))
                ],
              ),
              BlocConsumer<CartCubit, CartState>(
                listener: (context, state) {
                  print(state);
                  if (state is CartLoading) {
                    print('loadig called');
                    LoadingDialog.showLoadingDialog(context);
                  }
                  if (state is CartLoaded) {
                    Navigate.pop(context);
                  }
                  // TODO: implement listener
                },
                builder: (context, state) {
                  //print(quantityMapState);
                  if (state is CartLoaded) {
                    print('listdatalenth');
                    print(listNotifier.length);
                    Map<int, String> mapQ = {};
                    for (int i = 0; i < state.cartData.length; i++) {
                      if (mapQ.containsKey(i)) {
                        mapQ.update(
                            i,
                            (value) =>
                                state.cartData[i].productQuantity.toString());
                      } else {
                        mapQ.addAll(
                            {i: state.cartData[i].productQuantity.toString()});
                      }
                    }
                    context
                        .read<CartGrandTotalMapCubit>()
                        .setGetMap(1, '1', mapQ, frominitial: true);
                    return Column(
                      children: [
                        SizedBox(
                          width: 1.sw,
                          height: 1.sh / 2.3,
                          child: state.cartData.isEmpty
                              ? EmptyCartScreen(
                                  pageController: widget.pageController,
                                )
                              : BlocBuilder<CartGrandTotalMapCubit,
                                  Map<int, String>>(
                                  builder: (context, quantityMapState) {
                                    return ListView.separated(
                                        //  shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return CartItemTile(
                                            //   cartItem: null,
                                            // getCurrentValue: (total) async {
                                            //   print(total);
                                            // },
                                            cartDto: state.cartData[index],
                                            index: index,
                                            //qNotifier: listNotifier,
                                            onRemove: (notiValue) async {
                                              // context.read<CartCubit>().getAllCartItems();
                                              print('specific total');
                                              print(notiValue);
                                              CartNotifier.grandSumTotalNotifier
                                                      .value -=
                                                  double.parse(notiValue);
                                              // print(quantityMapState[index]! + "quantityyyy");
                                              // CartNotifier.grandSumTotalNotifier
                                              //     .value -= ((double.parse(state
                                              //             .cartData[index]
                                              //             .productPrice
                                              //             .toString()) *
                                              //         double.parse(
                                              //             quantityMapState[
                                              //                 index]!)) *
                                              //     double.parse(state
                                              //         .cartData[index].pcsCtn
                                              //         .toString()
                                              //         .split(' ')
                                              //         .first));

                                              CartNotifier
                                                      .grandCtnNotifier.value -=
                                                  double.parse(
                                                      quantityMapState[index]!);
                                              // quantityMapState.remove(index);
                                              print(
                                                  'quantity map remove $quantityMapState');

                                              int val = await CartDatabase
                                                  .cartDatabaseInstance
                                                  .deleteCart(state
                                                      .cartData[index].productId
                                                      .toString());
                                              // state.cartData.removeAt(index);
                                              if (val != 0) {
                                                //
                                              }
                                              context
                                                  .read<CartCubit>()
                                                  .getAllCartItems();
                                              // context
                                              //     .read<
                                              //     CartGrandTotalMapCubit>()
                                              //     .setGetMap(
                                              //     index,
                                              //     quantityMapState[index]!,
                                              //     quantityMapState,
                                              //     frominitial: true);
                                              // setState(() {
                                              //
                                              // });
                                            },
                                            mapQuantity: quantityMapState,
                                          );
                                        },
                                        separatorBuilder: (context, index) {
                                          return SizedBox(
                                            height: 4.h,
                                          );
                                        },
                                        itemCount: state.cartData.length);
                                  },
                                ),
                        ),
                        // CustomSizedBox.height(30.h),
                      ],
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
              BlocConsumer<CartCubit, CartState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, visibilityState) {
                  if (visibilityState is CartLoaded) {
                    return visibilityState.cartData.isEmpty
                        ? SizedBox(
                            height: 80.sp,
                          )
                        : CustomTextFieldWithOnTap(
                            controller: instructionController,
                            hintText: 'Write any instruction',
                            textInputType: TextInputType.text,
                            isBorderRequired: false,
                            isShadowRequired: true,
                            maxline: 2,
                          );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
              ValueListenableBuilder(
                builder: (context, ctnState, ch) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText('Total ctn',
                          style: Styles.circularStdMedium(context)),
                      AppText(
                          CartNotifier.grandCtnNotifier.value < 0
                              ? '0'
                              : ctnState.toString(),
                          style: Styles.circularStdMedium(context)),
                    ],
                  );
                },
                valueListenable: CartNotifier.grandCtnNotifier,
              ),
              CustomSizedBox.height(10.h),
              ValueListenableBuilder(
                builder: (context, state, ch) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText('Total amount',
                          style:
                              Styles.circularStdBold(context, fontSize: 18.sp)),
                      AppText(
                          CartNotifier.grandSumTotalNotifier.value < 0
                              ? '0.0'
                              : CartNotifier.grandSumTotalNotifier.value
                                  .toString(),
                          style:
                              Styles.circularStdBold(context, fontSize: 18.sp)),
                    ],
                  );
                },
                valueListenable: CartNotifier.grandSumTotalNotifier,
              ),
              BlocListener<PostOrderCubit, PostOrderState>(
                listener: (context, state) async {
                  // TODO: implement listener
                  if (state is PostOrderLoading) {
                    LoadingDialog.showLoadingDialog(context);
                  }
                  if (state is PostOrderSuccess) {
                    SharedPrefs.setOrderDate(
                        survey: DateTime.now().toIso8601String());
                    Navigate.pop(context);
                    instructionController.clear();
                    CustomDialog.successDialog(context,
                        title: 'Success! Your order has been Placed',
                        message: 'We sincerely appreciate you taking the time.',
                        image: Assets.customerSurveySuccess);

                    await CartDatabase.cartDatabaseInstance.clearCart();
                    CartNotifier.grandSumTotalNotifier.value = 0.0;
                    CartNotifier.grandCtnNotifier.value = 0.0;
                    context.read<CartCubit>().getAllCartItems();
                    context
                        .read<CartGrandTotalMapCubit>()
                        .setGetMap(0, '1', {}, fromRemove: true);
                  }
                },
                child: CustomButton(
                    borderRadius: 30.r,
                    onTap: () async {
                      List<Map<String, dynamic>> toSendCartData = [];
                      List<CartModel> dbList = await CartDatabase
                          .cartDatabaseInstance
                          .getAllCartItems();
                      if (dbList.isEmpty) {
                        WidgetFunctions.instance.snackBar(context,
                            text: 'Cart is empty please add items',
                            textStyle: Styles.circularStdMedium(context,
                                color: AppColors.whiteColor),
                            bgColor: AppColors.primaryColor);
                      } else {
                        String whCode = 'PEW-410';
                        String statusCode = '';
                        var wareHouseCode = await OrdersRepo.getWareHouseCode();
                        if (wareHouseCode.runtimeType != int) {
                          whCode = wareHouseCode;
                        }
                        print(whCode + "from ui ware house");
                        for (var i in dbList) {
                          print(i.productQuantity);
                          statusCode = await PostOrderDb.orderDatabaseInstance
                              .updateOrInsertProduct(
                                  DateTime.now(),
                                  i.productId.toString(),
                                  i.productName.toString(),
                                  i.productQuantity.toString());
                          print("$statusCode------statusCode");
                          if (statusCode == '1') {
                            toSendCartData.add({
                              "ItemCode": i.productId.toString(),
                              "UomCode": i.pcsCtn.toString(),
                              "Quantity": double.parse(
                                      i.multiplier.toString()) *
                                  double.parse(i.productQuantity.toString()),
                              "WhsCode": whCode,
                            });
                          } else {
                            break;
                          }
                        }
                        final data = {
                          'SONumMblapp': 'TEST',
                          'CardCode': SharedPrefs.userData!.cardCode.toString(),
                          'DocDate': DateTime.now().toString(),
                          'DocDueDate': DateTime.now().toString(),
                          'GridData': jsonEncode(toSendCartData),
                          'Remarks': instructionController.text,
                          "WhsCode": whCode,
                        };
                        bool check = checkUserTotal();
                        if (check) {
                          if (statusCode == '1') {
                            context.read<PostOrderCubit>().postOrder(data);
                          } else {
                            WidgetFunctions.instance.snackBar(context,
                                text: statusCode,
                                textStyle: Styles.circularStdMedium(context,
                                    color: AppColors.whiteColor),
                                bgColor: AppColors.primaryColor);
                          }
                        } else {
                          WidgetFunctions.instance.snackBar(context,
                              text: 'Total Amount Exceeded Available Balance',
                              textStyle: Styles.circularStdMedium(context,
                                  color: AppColors.whiteColor),
                              bgColor: AppColors.primaryColor);
                        }
                      }
                      // print(toSendCartData);
                      // Navigate.to(
                      //     context,
                      //     CheckOutScreen(
                      //       totalCtn: '07',
                      //       totalPayment: Utils.cartItems[0].price!,
                      //       pageController: widget.pageController,
                      //     ));
                    },
                    text: AppStrings.placeOrder),
              ),
            ],
          ),
        ));
  }

  Future<void> getGrandTotalFromDb() async {
    var grandT = await CartDatabase.cartDatabaseInstance.calculateGrandTotal();
    CartNotifier.grandSumTotalNotifier.value = double.parse(grandT.toString());
    var grandCtn = await CartDatabase.cartDatabaseInstance.getTotalQuantity();
    CartNotifier.grandCtnNotifier.value = double.parse(grandCtn.toString());
  }

  bool checkUserTotal() {
    // Get the last feedback date from shared preferences
    // String? lastFeedbackDate = SharedPrefs.getOrderDate();
    //
    // if (lastFeedbackDate != null) {
    //   DateTime lastDate = DateTime.parse(lastFeedbackDate);
    //   print(lastDate);
    //   // Get the current date
    //   DateTime currentDate = DateTime.now();
    //
    //   // Check if the last feedback date is the same as the current date
    //   return lastDate.year == currentDate.year &&
    //       lastDate.month == currentDate.month &&
    //       lastDate.day == currentDate.day;
    //   // No feedback has been given before
    //   return false;
    // } else {
    //   print('false');
    //   return false;
    // }

    // Parse the last feedback date string into a DateTime object
    double availableLimit = double.parse(Utils.getAvailableLimit(
        SharedPrefs.userData!.creditLimit.toString(),
        SharedPrefs.userData!.tolerance.toString(),
        SharedPrefs.userData!.balance.toString(),
        SharedPrefs.userData!.ordersBal.toString(),
        SharedPrefs.userData!.specialDeal.toString()));
    double valueGrand = CartNotifier.grandSumTotalNotifier.value;
    if (valueGrand <= availableLimit) {
      return true;
    } else {
      return false;
    }
  }

  List<ValueNotifier<int>> generateValueNotifier(List<CartModel> cartData) {
    return List.generate(
      cartData.length,
      (index) {
        //String valueName=''
        //ValueNotifier<int>
        // Calculate the grand total for the cart item at the current index

        // Create a ValueNotifier with the initial value
        return ValueNotifier<int>(1);
      },
    );
  }

  void readMap(BuildContext context) async {
    var state = await CartDatabase.cartDatabaseInstance.getAllCartItems();
    Map<int, String> mapQ = {};
    for (int i = 0; i < state.length; i++) {
      if (mapQ.containsKey(i)) {
        mapQ.update(i, (value) => state[i].productQuantity.toString());
      } else {
        mapQ.addAll({i: state[i].productQuantity.toString()});
      }
    }
    context
        .read<CartGrandTotalMapCubit>()
        .setGetMap(1, '1', mapQ, frominitial: true);
  }
}
