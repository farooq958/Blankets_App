import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hbk/Application/Services/Navigation/navigation.dart';
import 'package:hbk/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:hbk/Data/DataSource/Resources/assets.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Resources/sized_box.dart';
import 'package:hbk/Data/DataSource/Resources/text_styles.dart';
import 'package:hbk/Presentation/Common/app_buttons.dart';
import 'package:hbk/Presentation/Common/app_text.dart';
import 'package:hbk/Presentation/Common/image_widgets.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/CartScreen/Checkout/order_successfull.dart';

class SuccessFulDialog {
  static Widget show(
      {required BuildContext context,
      required String? title,
      required String? message,
      required Color? imageColor,
      required String? image,
      required double? messageFontSize,
      required double? titleFontSize,
      double? height,
      double? width}) {
    return Container(
      height: height ?? 240.sp,
      width: width ?? 290.sp,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 30.sp),
        children: <Widget>[
          SizedBox(
            height: 30.sp,
          ),
          Center(
            child: Image.asset(
              image ?? Assets.passwordSuccessFull,
              height: 85.sp,
              width: 85.sp,
              color: imageColor ?? AppColors.primaryColor,
            ),
          ),
          SizedBox(
            height: 10.sp,
          ),
          Center(
              child: FittedBox(
            child: AppText(
              title!,
              maxLine: 2,
              style: Styles.circularStdBold(context,
                  fontSize: titleFontSize ?? 22.sp),
            ),
          )),
          SizedBox(
            height: 10.sp,
          ),
          AppText(
            message!,
            style: Styles.circularStdRegular(context,
                fontSize: messageFontSize ?? 16.sp),
            maxLine: 3,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  static Widget showConfirmDialog(
      {required BuildContext context,
      required String? title,
      required String? message,
      required String? imageAsset,
      required String? buttonText1,
      required String? buttonText2,
      required VoidCallback? button1Tap,
      required VoidCallback? button2Tap,
      required Color? imageColor,
      final bool? isSvg,
      Color? button1BgColor,
      Color? button2BgColor,
        bool? button2LeadingImageIcon,
        String? button2LeadingIcon,
      double? height,
      double? width}) {
    return Container(
      alignment: Alignment.center,
      height: height ?? 300.sp,
      width: width ?? 290.sp,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 30.sp),
        children: <Widget>[
          SizedBox(
            height: 10.sp,
          ),
          Center(
            child: isSvg != null
                ? SvgPicture.asset(
                    imageAsset!,
                    height: 85.h,
                    width: 85.w,
                  )
                : Image.asset(
                    imageAsset!,
                    height: 85.sp,
                    width: 85.sp,
                    color: imageColor??AppColors.primaryColor,
                  ),
          ),
          SizedBox(
            height: 20.sp,
          ),
          Center(
              child: FittedBox(
                  child: AppText(
            title!,
            style: Styles.circularStdBold(context, fontSize: 22.sp),
          ))),
          SizedBox(
            height: 10.sp,
          ),
          Align(
            alignment: Alignment.center,
            child: AppText(
              message!,
              style: Styles.circularStdRegular(context, fontSize: 16.sp),
              maxLine: 6,
              // textAlign: TextAlign.center,
            ),
          ),

          CustomSizedBox.height(20.h),
          Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomButton(


                  onTap: button1Tap!,
                  text: buttonText1!,
                  bgColor: button1BgColor ?? AppColors.whiteColor,
                  textColor: AppColors.greyColor,
                  borderColor: Colors.transparent,
                  verticalPadding: 10.h,
                  horizontalPadding: 20.w,width: 120.w,
                  isBorder: false,
                ),
              ),
              10.x,
              Expanded(
                child: CustomButton(
                  onTap: button2Tap!,
                  leadingIcon: button2LeadingIcon,
                  leadingSvgIcon: button2LeadingImageIcon,
                  text: buttonText2!,
                  verticalPadding: 5.h,
                  horizontalPadding: 20.w,
                  borderRadius: 30.r,
                  isBorder: false,
                  width: 120.w,
                  bgColor: button2BgColor ?? AppColors.primaryColor,
                ),
              ),

            ],
          ),
          CustomSizedBox.height(10.h)
        ],
      ),
    );
  }
}
