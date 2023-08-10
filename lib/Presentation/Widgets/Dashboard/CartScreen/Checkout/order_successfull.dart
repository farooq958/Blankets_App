import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hbk/Data/DataSource/Resources/assets.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Resources/sized_box.dart';
import 'package:hbk/Data/DataSource/Resources/strings.dart';
import 'package:hbk/Data/DataSource/Resources/text_styles.dart';
import 'package:hbk/Presentation/Common/app_buttons.dart';
import 'package:hbk/Presentation/Common/app_text.dart';

class OrderSuccessFull extends StatelessWidget {
  const OrderSuccessFull({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(Assets.orderSuccessFull),
            CustomSizedBox.height(10.h),
            AppText(AppStrings.orderSuccessFull,
                style: Styles.circularStdBold(context, fontSize: 22.sp)),
            Padding(
              padding: EdgeInsets.all(10.r),
              child: AppText(
                AppStrings.orderSuccessFullNote,
                style: Styles.circularStdMedium(context, fontSize: 16.sp),
                maxLine: 2,
                textAlign: TextAlign.center,
              ),
            ),
            CustomSizedBox.height(20.h),
            CustomButton(
              onTap: () {},
              text: 'Explore more products',
              leadingIcon: Assets.shoppingCart,
              bgColor: AppColors.whiteColor,
              textColor: AppColors.primaryColor,
              horizontalMargin: 15.w,
            ),
          ],
        ),
      ),
    );
  }
}
