import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Resources/sized_box.dart';
import 'package:hbk/Data/DataSource/Resources/strings.dart';
import 'package:hbk/Presentation/Common/app_buttons.dart';
import 'package:hbk/Presentation/Common/custom_appbar_with_back_button.dart';
import 'package:hbk/Presentation/Common/custom_textfield_with_on_tap.dart';

class Feedback extends StatefulWidget {
  const Feedback({Key? key}) : super(key: key);

  @override
  State<Feedback> createState() => _FeedbackState();
}

class _FeedbackState extends State<Feedback> {
  final nameController = TextEditingController();
  final subjectController = TextEditingController();
  final feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWithBackButton(
        title: AppStrings.feedback,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomTextFieldWithOnTap(
                      controller: nameController,
                      hintText: 'Name',
                      textInputType: TextInputType.text,
                      isBorderRequired: false,
                      isShadowRequired: true,
                      hintTextColor: AppColors.blackColor,
                    ),
                    CustomTextFieldWithOnTap(
                      controller: subjectController,
                      hintText: 'Subject/title',
                      textInputType: TextInputType.text,
                      isBorderRequired: false,
                      isShadowRequired: true,
                      hintTextColor: AppColors.blackColor,
                    ),
                    CustomTextFieldWithOnTap(
                      controller: feedbackController,
                      hintText: 'Write your feedback',
                      textInputType: TextInputType.text,
                      isBorderRequired: false,
                      isShadowRequired: true,
                      hintTextColor: AppColors.blackColor,
                      maxline: 8,
                    ),
                  ],
                ),
              ),
            ),
            CustomButton(onTap: () {}, text: 'submit'),
          ],
        ),
      ),
    );
  }
}
