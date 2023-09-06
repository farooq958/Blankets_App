import 'package:flutter/material.dart';
import 'package:hbk/Data/DataSource/Resources/imports.dart';
import 'package:hbk/Data/DataSource/Resources/strings.dart';
import 'package:hbk/Presentation/Common/custom_appbar_with_back_button.dart';

class PrivacyPolice extends StatelessWidget {
  const PrivacyPolice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWithBackButton(
        title: AppStrings.privacyPolicy,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20.sp, right: 20.sp, top: 20.sp),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                AppStrings.privacyPoliceDesc1,
                style: Styles.circularStdRegular(context, fontSize: 16),
                maxLine: 7,
              ),
              SizedBox(
                height: 15.sp,
              ),
              AppText(
                "Use of Personal Information:",
                style: Styles.circularStdRegular(context, fontSize: 16),
                maxLine: 7,
              ),
              SizedBox(
                height: 10.h,
              ),
              textRow(context, AppStrings.privacyPoliceDesc2),
              SizedBox(
                height: 15.sp,
              ),
              AppText(
                "Sharing of Personal Information:",
                style: Styles.circularStdRegular(context, fontSize: 16),
                maxLine: 7,
              ),
              SizedBox(
                height: 10.h,
              ),
              textRow(context, AppStrings.privacyPoliceDesc3),
              SizedBox(
                height: 15.sp,
              ),
              AppText(
                "Data Security:",
                style: Styles.circularStdRegular(context, fontSize: 16),
                maxLine: 7,
              ),
              SizedBox(
                height: 10.h,
              ),
              textRow(context, AppStrings.privacyPoliceDesc4),
              textRow(context, AppStrings.privacyPoliceDesc5),
              SizedBox(
                height: 15.sp,
              ),
              AppText(
                "Your Choices:",
                style: Styles.circularStdRegular(context, fontSize: 16),
                maxLine: 7,
              ),
              SizedBox(
                height: 10.h,
              ),
              textRow(context, AppStrings.privacyPoliceDesc6),
              textRow(context, AppStrings.privacyPoliceDesc7),
              SizedBox(
                height: 15.sp,
              ),
              AppText(
                "Changes to Privacy Policy:",
                style: Styles.circularStdRegular(context, fontSize: 16),
                maxLine: 7,
              ),
              SizedBox(
                height: 10.h,
              ),
              textRow(context, AppStrings.privacyPoliceDesc8),
              SizedBox(
                height: 15.sp,
              ),
              AppText(
                "Contact Us:",
                style: Styles.circularStdRegular(context, fontSize: 16),
                maxLine: 7,
              ),
              SizedBox(
                height: 10.h,
              ),
              textRow(context, AppStrings.privacyPoliceDesc9),
              SizedBox(
                height: 15.sp,
              ),
              AppText(
                AppStrings.privacyPoliceDesc10,
                style: Styles.circularStdRegular(context, fontSize: 16),
                maxLine: 7,
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  textRow(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 5.0.sp),
            child: Container(
              padding: EdgeInsets.only(top: 10.sp),
              width: 8.0,
              height: 8.0,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.black),
            ),
          ),
          SizedBox(
            width: 7.sp,
          ),
          Expanded(
            child: AppText(
              text,
              style: Styles.circularStdRegular(context, fontSize: 16),
              maxLine: 7,
            ),
          ),
        ],
      ),
    );
  }
}
