import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hbk/Data/DataSource/Resources/assets.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Resources/sized_box.dart';
import 'package:hbk/Data/DataSource/Resources/text_styles.dart';
import 'package:hbk/Presentation/Common/app_buttons.dart';
import 'package:hbk/Presentation/Common/app_text.dart';
import 'package:hbk/Presentation/Common/image_widgets.dart';

class SuccessFulDialog {
  static Widget show(
      {required BuildContext context,
      required String? title,
      required String? message,
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
              Assets.passwordSuccessFull,
              height: 85.sp,
              width: 85.sp,
            ),
          ),
          SizedBox(
            height: 10.sp,
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
          AppText(
            message!,
            style: Styles.circularStdRegular(context, fontSize: 12.sp),
            maxLine: 2,
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
      double? height,
      double? width}) {
    return Container(
      height: height ?? 260.sp,
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
            height: 20.sp,
          ),
          Center(
            child: Image.asset(
              Assets.passwordSuccessFull,
              height: 85.sp,
              width: 85.sp,
            ),
          ),
          SizedBox(
            height: 10.sp,
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
          AppText(
            message!,
            style: Styles.circularStdRegular(context, fontSize: 16.sp),
            maxLine: 2,
            textAlign: TextAlign.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                onTap: () {
                  Navigator.of(context).pop(true);
                },
                text: 'Cancel',
                bgColor: AppColors.whiteColor,
                textColor: AppColors.greyColor,
                borderColor: Colors.transparent,
                verticalPadding: 10.h,
                horizontalPadding: 30.w,
              ),
              CustomButton(onTap: () { Navigator.of(context).pop(true);}, text: 'Confirm'),
            ],
          )
        ],
      ),
    );
  }
}
