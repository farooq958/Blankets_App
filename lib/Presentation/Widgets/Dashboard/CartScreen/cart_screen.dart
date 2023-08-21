


import 'package:hbk/Data/DataSource/Resources/imports.dart';

import 'package:hbk/Presentation/Widgets/Dashboard/CartScreen/Checkout/check_out_screen.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/CartScreen/Components/cart_item_tile.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/CartScreen/Components/empty_cart_screen.dart';

class CartScreen extends StatefulWidget {
  final PageController? pageController;
  final bool? isGuest;

  const CartScreen({super.key, this.pageController,this.isGuest});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  void initState() {
    // TODO: implement initState
    if(widget.isGuest==true) {
      CustomDialog.dialog(context, const Column());
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
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
                    style: Styles.circularStdBold(context, fontSize: 16.sp)),
                TextSpan(
                    text: '50,490 ',
                    style: Styles.circularStdBold(context,
                        fontWeight: FontWeight.w900, fontSize: 20)),
              ]))
            ],
          ),
          Utils.cartItems.isNotEmpty
              ? Column(
                  children: [
                    SizedBox(
                      width: 1.sw,
                      height: 1.sh / 2,
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            final cartItem = CartItem(
                                Random().nextInt(100).toString(),
                                Utils.cartItems[index].image,
                                Utils.cartItems[index].title,
                                Utils.cartItems[index].pcsAvailable,
                                Utils.cartItems[index].price,
                                Utils.cartItems[index].quantity);
                            return CartItemTile(
                              cartItem: cartItem,
                              onRemove: () {
                                Utils.cartItems.removeAt(index);
                                setState(() {});
                              },
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 10.h,
                            );
                          },
                          itemCount: Utils.cartItems.length),
                    ),
                    CustomSizedBox.height(30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText('Total ctn',
                            style: Styles.circularStdMedium(context)),
                        AppText('07', style: Styles.circularStdMedium(context)),
                      ],
                    ),
                    CustomSizedBox.height(10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText('Total amount',
                            style: Styles.circularStdBold(context,
                                fontSize: 18.sp)),
                        AppText('50,790',
                            style: Styles.circularStdBold(context,
                                fontSize: 18.sp)),
                      ],
                    ),
                    CustomSizedBox.height(10.h),
                    CustomButton(
                      borderRadius: 30.r,
                        onTap: () {
                      Navigate.to(context,  CheckOutScreen(totalCtn: '07',totalPayment: Utils.cartItems[0].price!,pageController: widget.pageController,));
                    }, text: AppStrings.checkOut),
                  ],
                )
              : EmptyCartScreen(
                  pageController: widget.pageController,
                )
        ],
      ),
    );
  }
}
