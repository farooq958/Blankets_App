import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hbk/Data/DataSource/Resources/assets.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Resources/sized_box.dart';
import 'package:hbk/Data/DataSource/Resources/strings.dart';
import 'package:hbk/Data/DataSource/Resources/text_styles.dart';
import 'package:hbk/Presentation/Common/app_buttons.dart';
import 'package:hbk/Presentation/Common/app_text.dart';
import 'package:hbk/Presentation/Common/custom_appbar_with_back_button.dart';
import 'package:hbk/Presentation/Common/image_widgets.dart';

class SalesPolicy extends StatelessWidget {
  const SalesPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWithBackButton(
        title: AppStrings.salesPolicy,
      ),
      body: Padding(
        padding:  EdgeInsets.all(15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSizedBox.height(20.h),
            _button(context, () {},'Rebate policy',Assets.rebatePolicy),
            CustomSizedBox.height(20.h),
            _button(context, () {},'Loyal policy',Assets.loyalPolicy),
            CustomSizedBox.height(20.h),
            _button(context, () {},'Transport policy',Assets.transportPolicy),
          ],
        ),
      ),
    );
  }

  Widget _button(
      BuildContext context, VoidCallback onTap, String title,String imageUrl) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        borderRadius: BorderRadius.circular(10.r),
        elevation: 4,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          width: 1.sw,
          height: 50.h,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  AssetImageWidget(url: imageUrl),
                  CustomSizedBox.width(10.w),
                  AppText(title, style: Styles.circularStdBold(context)),
                ],
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.primaryColor,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
