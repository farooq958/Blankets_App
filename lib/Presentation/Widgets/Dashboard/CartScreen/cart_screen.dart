import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hbk/Data/DataSource/Static/text_styles.dart';
import 'package:hbk/Data/DataSource/Static/utils.dart';
import 'package:hbk/Presentation/Common/app_text.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/CartScreen/Components/cart_item_tile.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/CartScreen/Components/empty_cart_screen.dart';

class CartScreen extends StatefulWidget {
  final PageController? pageController;

  const CartScreen({super.key, this.pageController});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
              ? Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return CartItemTile(
                          imageUrl: Utils.cartItems[index].image,
                          title: Utils.cartItems[index].title,
                          pcsAvailable: Utils.cartItems[index].pcsAvailable,
                          price: Utils.cartItems[index].price,
                          quantity: Utils.cartItems[index].quantity,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 10.h,
                        );
                      },
                      itemCount: Utils.cartItems.length),
                )
              : EmptyCartScreen(
                  pageController: widget.pageController,
                )
        ],
      ),
    );
  }
}
