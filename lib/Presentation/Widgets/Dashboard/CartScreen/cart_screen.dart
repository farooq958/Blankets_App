import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hbk/Data/AppData/app_preferences.dart';
import 'package:hbk/Data/DataSource/Resources/imports.dart';
import 'package:hbk/Domain/Models/Cart/cart_model.dart';
import 'package:hbk/Presentation/Common/Dialogs/loading_dialog.dart';

import 'package:hbk/Presentation/Widgets/Dashboard/CartScreen/Components/cart_item_tile.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/CartScreen/Components/empty_cart_screen.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/CartScreen/Controller/cart_cubit.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/CartScreen/Controller/cart_grand_total_map_cubit.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/CartScreen/SqDb/cart_db.dart';
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

TextEditingController instructionController=TextEditingController();

  @override
  void initState() {
    // TODO: implement initState

    if (widget.isGuest == true) {
      CustomDialog.dialog(context, const Column());
    }
    CartNotifier.grandSumTotalNotifier.value = 0.0;
    getGrandTotalFromDb();
    context.read<CartCubit>().getAllCartItems();
    context.read<CartGrandTotalMapCubit>().setGetMap(0,'1', {},fromRemove: true);
    super.initState();
  }

  ValueNotifier<double> grandTotal = ValueNotifier(0.0);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
        child:
        BlocBuilder<CartGrandTotalMapCubit, Map<int,String>>(
          builder: (context, quantityMapState) {
            return SingleChildScrollView(
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
                                style: Styles.circularStdBold(
                                    context, fontSize: 16.sp)),
                            TextSpan(
                                text: SharedPrefs.userData!.balance.toString(),
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
                      print(quantityMapState);
                      if (state is CartLoaded) {
                        return Column(
                          children: [
                            SizedBox(
                              width: 1.sw,
                              height: 1.sh / 2.3,
                              child: state.cartData.isEmpty? EmptyCartScreen(
                                pageController: widget.pageController,
                              ): ListView.separated(
                                //  shrinkWrap: true,
                                  itemBuilder: (context, index) {

                                    return CartItemTile(
                                      cartItem: null,
                                      getCurrentValue: (total) async {
                                        print(total);
                                      },

                                      cartDto: state.cartData[index],
                                      index: index,
                                      onRemove: (notiValue) async {
                                        // context.read<CartCubit>().getAllCartItems();

                                       // print(quantityMapState[index]! + "quantityyyy");
                                        CartNotifier.grandSumTotalNotifier
                                            .value -=
                                        (double.parse(
                                            state.cartData[index].productPrice
                                                .toString()) *
                                            double.parse(quantityMapState[index]!));

                                        CartNotifier.grandCtnNotifier.value -=   double.parse(quantityMapState[index]!);
                                      //  context.read<CartGrandTotalMapCubit>().setGetMap(index, quantityMapState[index]!, quantityMapState);

                                        int val = await CartDatabase
                                            .cartDatabaseInstance.deleteCart(
                                            state.cartData[index].productId
                                                .toString());
                                        state.cartData.removeAt(index);
                                        if (val != 0) {
                                          //
                                        }


                                        setState(() {
                                          context.read<CartCubit>()
                                              .getAllCartItems();
                                        });
                                      },
                                      mapQuantity: quantityMapState,

                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                      height: 4.h,
                                    );
                                  },
                                  itemCount: state.cartData.length),
                            ),
                            // CustomSizedBox.height(30.h),
                            CustomTextFieldWithOnTap(
                              controller: instructionController,
                              hintText: 'Write any instruction',
                              textInputType: TextInputType.text,
                              isBorderRequired: false,
                              isShadowRequired: true,
                              maxline: 2,
                            ),
                            ValueListenableBuilder(
                              builder: (context,ctnState,ch) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppText('Total ctn',
                                        style: Styles.circularStdMedium(context)),
                                    AppText(
                                        ctnState.toString(),
                                        style: Styles.circularStdMedium(context)),
                                  ],
                                );
                              }, valueListenable: CartNotifier.grandCtnNotifier,
                            ),
                            CustomSizedBox.height(10.h),

                            ValueListenableBuilder(
                              builder: (context, state, ch) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    AppText('Total amount',
                                        style: Styles.circularStdBold(context,
                                            fontSize: 18.sp)),
                                    AppText(state.toString(),
                                        style: Styles.circularStdBold(context,
                                            fontSize: 18.sp)),
                                  ],
                                );
                              },
                              valueListenable: CartNotifier.grandSumTotalNotifier,
                            ),
                            BlocListener<PostOrderCubit, PostOrderState>(
  listener: (context, state) {
    // TODO: implement listener
    if(state is PostOrderLoading)
      {
        LoadingDialog.showLoadingDialog(context);
      }
    if(state is PostOrderSuccess)
      {
        SharedPrefs.setOrderDate(survey: DateTime.now().toIso8601String());
        Navigate.pop(context);
        CustomDialog.successDialog(context,
            title: 'Success! Your order has been Placed',
            message:
            'We sincerely appreciate you taking the time.',
            image: Assets.customerSurveySuccess);

      }
  },
  child: CustomButton(
                                borderRadius: 30.r,
                                onTap: () async {
                                  List<Map<String,dynamic>> toSendCartData=[];
                                  List<CartModel> dbList=await CartDatabase.cartDatabaseInstance.getAllCartItems();

                                  for(var i in dbList)
                                    {
                                      print(i.productQuantity);
                                      toSendCartData.add({
                                        "ItemCode": i.productId.toString(),
                                        "UomCode": i.pcsCtn.toString(),
                                        "Quantity":
                                        double.parse(i.multiplier.toString()) * double.parse(i.productQuantity.toString()),
                                        "WhsCode": "PEW-410",


                                      });

                                    }
                                  final data = {
                                    'SONumMblapp': 'TEST',
                                    'CardCode': SharedPrefs.userData!.cardCode.toString(),
                                    'DocDate': DateTime.now().toString(),
                                    'DocDueDate': DateTime.now().toString(),
                                    'GridData': jsonEncode(toSendCartData),
                                    'Remarks': instructionController.text
                                  };
                          bool check= await hasUserGivenOrderToday();
                      if(check == false) {
                        context.read<PostOrderCubit>().postOrder(data);
                      }
                      else
                        {

                          WidgetFunctions.instance.snackBar(context,text: 'Already have posted order Today',textStyle: Styles.circularStdMedium(context,color: AppColors.whiteColor),bgColor: AppColors.primaryColor);
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
                        );
                      }
                      else {
                        return LoadingDialog.loadingWidget();
                      }
                    },
                  )

                ],
              ),
            );
          },
        )

    );
  }

  Future<void> getGrandTotalFromDb() async {
    var grandT = await CartDatabase.cartDatabaseInstance.calculateGrandTotal();
    CartNotifier.grandSumTotalNotifier.value = double.parse(grandT.toString());
    var grandCtn=await CartDatabase.cartDatabaseInstance.getTotalQuantity();
    CartNotifier.grandCtnNotifier.value = double.parse(grandCtn.toString());
  }

  Future<bool> hasUserGivenOrderToday() async {
    // Get the last feedback date from shared preferences
    String? lastFeedbackDate = SharedPrefs.getOrderDate();

    if (lastFeedbackDate != null) {
      DateTime lastDate = DateTime.parse(lastFeedbackDate);
      print(lastDate);
      // Get the current date
      DateTime currentDate = DateTime.now();

      // Check if the last feedback date is the same as the current date
      return lastDate.year == currentDate.year &&
          lastDate.month == currentDate.month &&
          lastDate.day == currentDate.day;
      // No feedback has been given before
      return false;
    } else {
      print('false');
      return false;
    }

    // Parse the last feedback date string into a DateTime object
  }
}
