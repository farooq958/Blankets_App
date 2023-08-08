import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hbk/Data/DataSource/Static/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Static/sized_box.dart';
import 'package:hbk/Data/DataSource/Static/text_styles.dart';
import 'package:hbk/Data/DataSource/Static/utils.dart';
import 'package:hbk/Domain/Models/HomeScreen/product_model.dart';
import 'package:hbk/Presentation/Common/app_buttons.dart';
import 'package:hbk/Presentation/Common/app_text.dart';
import 'package:hbk/Presentation/Common/image_widgets.dart';

class NewArrivalProduct extends StatelessWidget {
 final ProductModel? dummyProduct;
 final VoidCallback onAddToCardTap;
  const NewArrivalProduct({super.key, this.dummyProduct, required this.onAddToCardTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 169.w,
      height: 240.h,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 12,
            offset: Offset(0, 6),
            spreadRadius: 0,
          )
        ],
      ),

      child: Center(
        child: Column(

          children: [
            CustomSizedBox.height(15),
            AssetImageWidget(url:dummyProduct!.productImage.toString(),radius: 40.sp,width: 120.w,height: 100.h,),
            CustomSizedBox.height(15),
            AppText(dummyProduct!.productDescription.toString(),
                maxLine: 3,
                style: Styles.circularStdBold(context,fontWeight: FontWeight.w500)

            ),
            CustomSizedBox.height(15),
            Row(
              children: [
                AppText( "RS",
                    maxLine: 1,
                    style: Styles.circularStdBold(context,fontWeight: FontWeight.w500,)

                ),
                CustomSizedBox.width(2),
                AppText( "${dummyProduct!.productPrice}",
                    maxLine: 1,
                    style: Styles.circularStdBold(context,fontWeight: FontWeight.w500,color: AppColors.primaryColor)

                ),
              ],
            ),
            CustomSizedBox.height(10),
            GestureDetector(
              onTap: onAddToCardTap,
              child: Container(
                width: 150.sp,
                height: 32,
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 4),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 1.33),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 15,
                                height: 13.33,
                                child: SvgPicture.asset('assets/images/bagIcon.svg'),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 2),
                        AppText("Add to cart", style: Styles.circularStdBold(context,fontWeight: FontWeight.w500,fontSize: 13.sp,color: AppColors.whiteColor))
                      ],
                    ),
                  ],
                ),
              ),
            )

          ],

        ),
      ),
    );
  }
}
