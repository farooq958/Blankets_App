import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hbk/Data/AppData/app_preferences.dart';
import 'package:hbk/Data/DataSource/Resources/imports.dart';
import 'package:hbk/Presentation/Common/Dialogs/loading_dialog.dart';

import 'package:hbk/Presentation/Widgets/Dashboard/CartScreen/Components/cart_item_tile.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/CartScreen/Components/empty_cart_screen.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/CartScreen/Controller/cart_cubit.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/CartScreen/Controller/cart_grand_total_map_cubit.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/CartScreen/SqDb/cart_db.dart';
import 'Checkout/check_out_screen.dart';
import 'Controller/notifier.dart';

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
    context.read<CartGrandTotalMapCubit>().setGetMap(0,'1', {});
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
                              child: ListView.separated(
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
                                            double.parse(context.read<CartGrandTotalMapCubit>().state[index]!));

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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppText('Total ctn',
                                    style: Styles.circularStdMedium(context)),
                                AppText(
                                    '07',
                                    style: Styles.circularStdMedium(context)),
                              ],
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
                            CustomButton(
                                borderRadius: 30.r,
                                onTap: () {
                                  // Navigate.to(
                                  //     context,
                                  //     CheckOutScreen(
                                  //       totalCtn: '07',
                                  //       totalPayment: Utils.cartItems[0].price!,
                                  //       pageController: widget.pageController,
                                  //     ));
                                },
                                text: AppStrings.placeOrder),


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
  }
}
// EmptyCartScreen(
// pageController: widget.pageController,
// )