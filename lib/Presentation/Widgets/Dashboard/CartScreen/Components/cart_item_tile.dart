import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Resources/sized_box.dart';
import 'package:hbk/Data/DataSource/Resources/text_styles.dart';
import 'package:hbk/Data/DataSource/Resources/utils.dart';
import 'package:hbk/Domain/Models/Cart/cart_item.dart';
import 'package:hbk/Presentation/Common/app_text.dart';
import 'package:hbk/Presentation/Common/circle_icon_button.dart';
import 'package:hbk/Presentation/Common/image_widgets.dart';

class CartItemTile extends StatefulWidget {
  final CartItem? cartItem;
  final VoidCallback? onRemove;

  const CartItemTile({Key? key, required this.cartItem, this.onRemove})
      : super(key: key);

  @override
  State<CartItemTile> createState() => _CartItemTileState();
}

class _CartItemTileState extends State<CartItemTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.h),
      child: Card(
        elevation: 4.0,
        child: Padding(
          padding: EdgeInsets.only(top: 5.h, left: 10.w, bottom: 10.h),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AssetImageWidget(
                    url: widget.cartItem!.image!,
                    color: widget.cartItem!.image!.contains('appLogo.png')
                        ? AppColors.primaryColor
                        : null,
                    width: 80.w,
                    height: 80.h,
                  ),
                  CustomSizedBox.width(5.w),
                  SizedBox(
                    width: 130.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          widget.cartItem!.title!,
                          style: Styles.circularStdMedium(context),
                          maxLine: 3,
                        ),
                        AppText(
                          'Pcs/Ctn : ${widget.cartItem!.pcsAvailable}',
                          style: Styles.circularStdMedium(context),
                          maxLine: 2,
                        ),
                        CustomSizedBox.height(5.h),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: 'Rs ',
                                  style: Styles.circularStdBold(context,
                                      fontSize: 16.sp)),
                              TextSpan(
                                  text: '${widget.cartItem!.price}',
                                  style: Styles.circularStdBold(context,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20,
                                      color: AppColors.primaryColor)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.h, left: 20.w),
                    child: CircleIconButton(
                      icon: Icons.close,
                      onPressed: () {
                        if(widget.onRemove != null){
                          widget.onRemove!();
                        }
                      },
                      width: 30.w,
                      height: 30.h,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: 'Total',
                      style: Styles.circularStdMedium(context, fontSize: 16.sp),
                    ),
                    TextSpan(
                        text: ' Rs ',
                        style:
                            Styles.circularStdBold(context, fontSize: 16.sp)),
                    TextSpan(
                        text: '${widget.cartItem!.price}',
                        style: Styles.circularStdBold(context,
                            fontWeight: FontWeight.w900, fontSize: 20.sp)),
                  ])),
                  Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleIconButton(
                          icon: Icons.remove,
                          onPressed: (){},
                          width: 25.w,
                          height: 25.h,
                        ),
                        CustomSizedBox.width(10.w),
                        AppText(widget.cartItem!.quantity.toString(),
                            style: Styles.circularStdMedium(context)),
                        CustomSizedBox.width(10.w),
                        CircleIconButton(
                          icon: Icons.add,
                          onPressed: () {},
                          width: 25.w,
                          height: 25.h,
                          color: AppColors.primaryColor,
                          iconColor: AppColors.whiteColor,
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}