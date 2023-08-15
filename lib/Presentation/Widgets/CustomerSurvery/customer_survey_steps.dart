// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
// import 'package:hbk/Presentation/Common/app_buttons.dart';
//
// class CustomerSurveySteps extends StatefulWidget {
//   const CustomerSurveySteps({super.key});
//
//   @override
//   _CustomerSurveyStepsState createState() => _CustomerSurveyStepsState();
// }
//
// class _CustomerSurveyStepsState extends State<CustomerSurveySteps> {
//   int currentStep = 0;
//   List<bool> stepCompletion = [false, false, false, false, false];
//
//   void _goToNextStep() {
//     setState(() {
//       if (currentStep <= 4) {
//         stepCompletion[currentStep] = true;
//         currentStep++;
//       }
//     });
//   }
//
//   void _goToPreviousStep() {
//     setState(() {
//       if (currentStep > 0) {
//         currentStep--;
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Customer Survey'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Text('${currentStep + 1}/5'),
//               ],
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: List.generate(
//                 5,
//                 (index) => Padding(
//                       padding: EdgeInsets.symmetric(
//                           vertical: 10.h, horizontal: 10.w),
//                       child: Container(
//                         width: 50.w,
//                         height: 5.h,
//                         decoration: BoxDecoration(
//                             color: stepCompletion[index]
//                                 ? AppColors.primaryColor
//                                 : Colors.grey,
//                             borderRadius: BorderRadius.circular(20.r)),
//                       ),
//                     )),
//           ),
//           Expanded(
//             child: _buildStepContent(currentStep),
//           ),
//            SizedBox(height: 20.h),
//           if (currentStep < 4)
//             CustomButton(
//               onTap: _goToNextStep,
//               text: 'Next',
//               horizontalMargin: 20.w,
//             ),
//           if (currentStep == 4)
//             CustomButton(
//               onTap: () {},
//               text: 'Submit',
//               horizontalMargin: 20.w,
//             ),
//           const SizedBox(height: 20),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildStepContent(int step) {
//     switch (step) {
//       case 0:
//         return Center(child: Text('Step 1 content'));
//       case 1:
//         return Center(child: Text('Step 2 content'));
//       case 2:
//         return Center(child: Text('Step 3 content'));
//       case 3:
//         return Center(child: Text('Step 4 content'));
//       case 4:
//         return Center(child: Text('Step 5 content'));
//       default:
//         return Container();
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Resources/sized_box.dart';
import 'package:hbk/Data/DataSource/Resources/text_styles.dart';
import 'package:hbk/Presentation/Common/app_buttons.dart';
import 'package:hbk/Presentation/Common/app_text.dart';

class CustomerSurveySteps extends StatefulWidget {
  const CustomerSurveySteps({super.key});

  @override
  _CustomerSurveyStepsState createState() => _CustomerSurveyStepsState();
}

class _CustomerSurveyStepsState extends State<CustomerSurveySteps> {
  final ValueNotifier<int> currentPageNotifier = ValueNotifier<int>(0);
  List<bool> stepCompletion = [false, false, false, false, false];

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
                      currentPageNotifier.value = currentPage + 1;
                    }
                  },
                  text: 'Next',
                  horizontalMargin: 20.w,
                );
              } else {
                return CustomButton(
                  onTap: () {},
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
            _buildRadioRow(true),
            _buildRadioRow(false),
            _buildRadioRow(false),
            _buildRadioRow(false),
            _buildRadioRow(false),

          ],
        );
      case 1:
        return Center(child: Text('Step 2 content'));
      case 2:
        return Center(child: Text('Step 3 content'));
      case 3:
        return Center(child: Text('Step 4 content'));
      case 4:
        return Center(child: Text('Step 5 content'));
      default:
        return Container();
    }
  }

  Widget _buildRadioRow(bool selected) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 2,
        child: Container(
          width: 1.sw,
          height: 50.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: selected == true? AppColors.primaryColor : Colors.transparent),
          ),
          child: Row(
            children: [
              Radio(
                activeColor: AppColors.primaryColor,
                value: 0,
                groupValue: 0,
                onChanged: (value) {},
              ),
              AppText('Excellent',
                  style: Styles.circularStdBold(context)),
            ],
          ),
        ),
      ),
    );
  }
}
