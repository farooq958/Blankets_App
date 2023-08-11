import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hbk/Application/Services/Navigation/navigation.dart';
import 'package:hbk/Data/DataSource/Resources/assets.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Resources/sized_box.dart';
import 'package:hbk/Data/DataSource/Resources/strings.dart';
import 'package:hbk/Data/DataSource/Resources/text_styles.dart';
import 'package:hbk/Presentation/Common/app_buttons.dart';
import 'package:hbk/Presentation/Common/app_text.dart';
import 'package:hbk/Presentation/Common/custom_appbar_with_back_button.dart';
import 'package:hbk/Presentation/Widgets/CustomerSurvery/customer_survey_steps.dart';

class CustomerSurvey extends StatefulWidget {
  const CustomerSurvey({Key? key}) : super(key: key);

  @override
  State<CustomerSurvey> createState() => _CustomerSurveyState();
}

class _CustomerSurveyState extends State<CustomerSurvey> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWithBackButton(
        title: AppStrings.customerSurvey,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSizedBox.height(40.h),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: SvgPicture.asset(
                    Assets.customerSurvey,
                    color: AppColors.primaryColor,
                    width: 1.sw,
                    height: 150.h,
                  )),
                  CustomSizedBox.height(20.h),
                  AppText('Customer Experience Survey',
                      style: Styles.circularStdBold(context, fontSize: 18.sp)),
                  CustomSizedBox.height(10.h),
                  AppText(
                    'Help Us Improve Your Experience: Take our short customer survey and share your valuable feedback about our e-commerce app. Your input will shape our efforts to provide you with an even better shopping journey.',
                    style: Styles.circularStdMedium(context, fontSize: 14.sp),
                    maxLine: 5,
                  ),
                ],
              ),
            ),
            CustomButton(onTap: () {
              Navigate.to(context, CustomerSurveySteps());
            }, text: 'Submit')
          ],
        ),
      ),
    );
  }
}
