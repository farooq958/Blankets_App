import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hbk/Data/DataSource/Resources/assets.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Resources/sized_box.dart';
import 'package:hbk/Data/DataSource/Resources/text_styles.dart';
import 'package:hbk/Presentation/Common/app_buttons.dart';
import 'package:hbk/Presentation/Common/app_text.dart';
import 'package:hbk/Presentation/Common/custom_radio_tile.dart';
import 'package:hbk/Presentation/Common/custom_textfield_with_on_tap.dart';
import 'package:hbk/Presentation/Common/dialog.dart';

enum CustomerSurveySelection { excellent, good, average, belowAverage, poor }

class CustomerSurveySteps extends StatefulWidget {
  const CustomerSurveySteps({super.key});

  @override
  _CustomerSurveyStepsState createState() => _CustomerSurveyStepsState();
}

class _CustomerSurveyStepsState extends State<CustomerSurveySteps> {
  final ValueNotifier<int> currentPageNotifier = ValueNotifier<int>(0);
  List<bool> stepCompletion = [false, false, false, false, false];
  final pageController = PageController();
  final suggestionController = TextEditingController();

  CustomerSurveySelection selection = CustomerSurveySelection.excellent;

  @override
  void dispose() {
    currentPageNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Survey'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ValueListenableBuilder<int>(
                  valueListenable: currentPageNotifier,
                  builder: (context, currentPage, child) {
                    return Text(
                      '${currentPage + 1}/5',
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.bold),
                    );
                  },
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
              (index) => Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10.h,
                  horizontal: 10.w,
                ),
                child: ValueListenableBuilder<int>(
                  valueListenable: currentPageNotifier,
                  builder: (context, currentPage, child) {
                    return Container(
                      width: 50.w,
                      height: 5.h,
                      decoration: BoxDecoration(
                        color: (index <= currentPage)
                            ? AppColors.primaryColor
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: pageController,
              onPageChanged: (index) {
                currentPageNotifier.value = index;
              },
              itemCount: 5,
              itemBuilder: (context, index) {
                return _buildStepContent(index);
              },
            ),
          ),
          const SizedBox(height: 20),
          ValueListenableBuilder<int>(
            valueListenable: currentPageNotifier,
            builder: (context, currentPage, child) {
              if (currentPage < 4) {
                return CustomButton(
                  onTap: () {
                    if (currentPage < 4) {
                      pageController.jumpToPage(currentPageNotifier.value + 1);
                      currentPageNotifier.value = currentPage + 1;
                    }
                  },
                  text: 'Next',
                  horizontalMargin: 20.w,
                );
              } else {
                return CustomButton(
                  onTap: () {
                    CustomDialog.successDialog(context,
                        title: 'Thank You for Your Valuable Feedback!',
                        message:
                            'We sincerely appreciate you taking the time to participate in our customer survey.',
                        image: Assets.customerSurveySuccess);
                  },
                  text: 'Submit',
                  horizontalMargin: 20.w,
                );
              }
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildStepContent(int step) {
    switch (step) {
      case 0:
        return Column(
          children: [
            CustomSizedBox.height(30.h),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppText(
                'How would you rate the overall user interface and navigation of our app?',
                style: Styles.circularStdMedium(context),
                maxLine: 3,
              ),
            ),
            CustomRadioSelectionTile(
              title: "Excellent",
              value: CustomerSurveySelection.excellent,
              groupValue: selection,
              onChanged: (CustomerSurveySelection? value) {
                setState(() {
                  selection = value!;
                  print(selection);
                });
              },
            ),
            CustomRadioSelectionTile(
              title: "Good",
              value: CustomerSurveySelection.good,
              groupValue: selection,
              onChanged: (CustomerSurveySelection? value) {
                setState(() {
                  selection = value!;
                  print(selection);
                });
              },
            ),
            CustomRadioSelectionTile(
              title: "Average",
              value: CustomerSurveySelection.average,
              groupValue: selection,
              onChanged: (CustomerSurveySelection? value) {
                setState(() {
                  selection = value!;
                  print(selection);
                });
              },
            ),
            CustomRadioSelectionTile(
              title: "Below Average",
              value: CustomerSurveySelection.belowAverage,
              groupValue: selection,
              onChanged: (CustomerSurveySelection? value) {
                setState(() {
                  selection = value!;
                  print(selection);
                });
              },
            ),
            CustomRadioSelectionTile(
              title: "Poor",
              value: CustomerSurveySelection.poor,
              groupValue: selection,
              onChanged: (CustomerSurveySelection? value) {
                setState(() {
                  selection = value!;
                  print(selection);
                });
              },
            ),
          ],
        );
      case 1:
        return const Center(child: Text('Step 2 content'));
      case 2:
        return const Center(child: Text('Step 3 content'));
      case 3:
        return const Center(child: Text('Step 4 content'));
      case 4:
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppText(
                  'Do you have any additional suggestions or ideas to enhance your product experience with our app?',
                  style: Styles.circularStdMedium(context, fontSize: 16.sp),
                  maxLine: 3,
                ),
                AppText(
                  'Feel free to share your thoughts below. Your feedback matters to us!',
                  style: Styles.circularStdMedium(context, fontSize: 16.sp),
                  maxLine: 2,
                ),
                CustomTextFieldWithOnTap(
                  controller: suggestionController,
                  hintText: 'Write your suggestion',
                  hintTextColor: AppColors.blackColor,
                  textInputType: TextInputType.text,
                  maxline: 8,
                  isBorderRequired: false,
                  borderRadius: 20.r,
                  isShadowRequired: true,
                ),
              ],
            ),
          ),
        );
      default:
        return Container();
    }
  }
}
