import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Resources/text_styles.dart';
import 'package:hbk/Presentation/Common/app_text.dart';
import 'package:hbk/Presentation/Widgets/CustomerSurvery/customer_survey_steps.dart';

class CustomRadioSelectionTile extends StatelessWidget {
  final String title;
  final CustomerSurveySelection value;
  final CustomerSurveySelection groupValue;
  final Function(CustomerSurveySelection?) onChanged;

  const CustomRadioSelectionTile({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Material(
          borderRadius: BorderRadius.circular(10.r),
          elevation: 2,
          child: Container(
            width: 1.sw,
            height: 50.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                color: value == groupValue
                    ? AppColors.primaryColor
                    : Colors.transparent,
              ),
            ),
            child: Row(
              children: [
                Radio<CustomerSurveySelection>(
                  activeColor: AppColors.primaryColor,
                  value: value,
                  groupValue: groupValue,
                  onChanged: onChanged,
                ),
                AppText(title,
                    style: Styles.circularStdBold(context,
                        color: value == groupValue
                            ? AppColors.primaryColor
                            : AppColors.blackColor)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
