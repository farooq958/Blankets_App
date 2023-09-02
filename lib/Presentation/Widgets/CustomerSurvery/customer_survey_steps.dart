
import 'package:hbk/Data/DataSource/Resources/imports.dart';
import 'package:hbk/Data/DataSource/Resources/validator.dart';
import 'package:hbk/Domain/Models/CustomerSurvey/customer_survey.dart';


enum CustomerSurveySelectionStep1 { excellent, good, average, belowAverage, poor }
enum CustomerSurveySelectionStep2 { generalProduct, babyBlanket, flannel, bedCover, doubleOrSingleBedBlanket }
enum CustomerSurveySelectionStep3 { multipleTimeAWeek, onceAWeek, aFewTimeAMonth, onceAMonth, rarely }
enum CustomerSurveySelectionStep4 { veryDifficult, difficult, average, easy, veryEasy }


class CustomerSurveySteps extends StatefulWidget {

  List<CustomerSurvey>? customerSurveyData;
   CustomerSurveySteps({super.key,required this.customerSurveyData});

  @override
  _CustomerSurveyStepsState createState() => _CustomerSurveyStepsState();
}

class _CustomerSurveyStepsState extends State<CustomerSurveySteps> {
  final ValueNotifier<int> currentPageNotifier = ValueNotifier<int>(0);
  List<bool> stepCompletion = [false, false, false, false, false];
  final pageController = PageController();
  final suggestionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  CustomerSurveySelectionStep1 step1Selection = CustomerSurveySelectionStep1.excellent;
  CustomerSurveySelectionStep2  step2Selection = CustomerSurveySelectionStep2.generalProduct;
  CustomerSurveySelectionStep3  step3Selection = CustomerSurveySelectionStep3.multipleTimeAWeek;
  CustomerSurveySelectionStep4  step4Selection = CustomerSurveySelectionStep4.veryDifficult;

  @override
  void dispose() {
    currentPageNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWithBackButton(title: 'Customer survey',),
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
                    return AppText(
                      '${currentPage + 1}/5',
                      style:Styles.circularStdBold(context,fontSize: 16.sp)
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
              itemCount: widget.customerSurveyData!.length,
              itemBuilder: (context, index) {
                return index==4 ?  Form(
                          key: _formKey,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  AppText(
                                    widget.customerSurveyData![4].question.toString(),
                                    style: Styles.circularStdMedium(context, fontSize: 16.sp),
                                    maxLine: 3,
                                  ),

                                  CustomTextFieldWithOnTap(
                                    controller: suggestionController,
                                    hintText: 'Write your suggestion',
                                    hintTextColor: AppColors.blackColor,
                                    textInputType: TextInputType.text,
                                    validator: Validate.activityNotes,
                                    maxline: 8,
                                    isBorderRequired: false,
                                    borderRadius: 20.r,
                                    isShadowRequired: true,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                        : Column(
                  children: [
                    CustomSizedBox.height(30.h),
                    Padding(
                      padding:  EdgeInsets.only(left: 20.w,right: 5.w),
                      child: AppText(
                        // 'How would you rate the overall user interface of the app?',
                        widget.customerSurveyData![index].question.toString(),
                        style: Styles.circularStdMedium(context),
                        maxLine: 3,
                      ),
                    ),
                    CustomRadioSelectionTile(
                      title: "Likely",
                      value: CustomerSurveySelectionStep1.excellent,
                      groupValue: step1Selection,
                      number:"1",
                      onChanged: (value) {
                        setState(() {
                          step1Selection = value!;
                        });
                      },
                    ),
                    CustomRadioSelectionTile(
                      title: "",
                      number:"2",
                      value: CustomerSurveySelectionStep1.good,
                      groupValue: step1Selection,
                      onChanged: (value) {
                        setState(() {
                          step1Selection = value!;
                        });
                      },
                    ),
                    CustomRadioSelectionTile(
                      title: "",
                      number:"3",
                      value: CustomerSurveySelectionStep1.average,
                      groupValue: step1Selection,
                      onChanged: (value) {
                        setState(() {
                          step1Selection = value!;
                        });
                      },
                    ),
                    CustomRadioSelectionTile(
                      title: "",
                      number:"4",
                      value: CustomerSurveySelectionStep1.belowAverage,
                      groupValue: step1Selection,
                      onChanged: (value) {
                        setState(() {
                          step1Selection = value!;
                        });
                      },
                    ),
                    CustomRadioSelectionTile(
                      title: "UnLikely",
                      number:"5",
                      value: CustomerSurveySelectionStep1.poor,
                      groupValue: step1Selection,
                      onChanged: (value) {
                        setState(() {
                          step1Selection = value!;
                        });
                      },
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          ValueListenableBuilder<int>(
            valueListenable: currentPageNotifier,
            builder: (context, currentPage, child) {
              if (currentPage < 4) {
                return CustomButton(
                  borderRadius: 30.r,
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
                  borderRadius: 30.r,
                  onTap: () {
                   if(_formKey.currentState!.validate()){CustomDialog.successDialog(context,
                       title: 'Thank You for Your Valuable Feedback!',
                       message:
                       'We sincerely appreciate you taking the time to participate in our customer survey.',
                       image: Assets.customerSurveySuccess);}
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

  // Widget _buildStepContent(int step) {
  //   switch (step) {
  //     case 0:
  //       return Column(
  //         children: [
  //           CustomSizedBox.height(30.h),
  //           Padding(
  //             padding:  EdgeInsets.only(left: 20.w,right: 5.w),
  //             child: AppText(
  //               // 'How would you rate the overall user interface of the app?',
  //               widget.customerSurveyData![0].question.toString(),
  //               style: Styles.circularStdMedium(context),
  //               maxLine: 3,
  //             ),
  //           ),
  //           CustomRadioSelectionTile(
  //             title: "Excellent",
  //             value: CustomerSurveySelectionStep1.excellent,
  //             groupValue: step1Selection,
  //             onChanged: (value) {
  //               setState(() {
  //                 step1Selection = value!;
  //               });
  //             },
  //           ),
  //           CustomRadioSelectionTile(
  //             title: "Good",
  //             value: CustomerSurveySelectionStep1.good,
  //             groupValue: step1Selection,
  //             onChanged: (value) {
  //               setState(() {
  //                 step1Selection = value!;
  //               });
  //             },
  //           ),
  //           CustomRadioSelectionTile(
  //             title: "Average",
  //             value: CustomerSurveySelectionStep1.average,
  //             groupValue: step1Selection,
  //             onChanged: (value) {
  //               setState(() {
  //                 step1Selection = value!;
  //               });
  //             },
  //           ),
  //           CustomRadioSelectionTile(
  //             title: "Below Average",
  //             value: CustomerSurveySelectionStep1.belowAverage,
  //             groupValue: step1Selection,
  //             onChanged: (value) {
  //               setState(() {
  //                 step1Selection = value!;
  //               });
  //             },
  //           ),
  //           CustomRadioSelectionTile(
  //             title: "Poor",
  //             value: CustomerSurveySelectionStep1.poor,
  //             groupValue: step1Selection,
  //             onChanged: (value) {
  //               setState(() {
  //                 step1Selection = value!;
  //               });
  //             },
  //           ),
  //         ],
  //       );
  //     case 1:
  //       return Column(
  //         children: [
  //           CustomSizedBox.height(30.h),
  //           Padding(
  //             padding:  EdgeInsets.only(left: 20.w,right: 5.w),
  //             child: AppText(
  //               'Which types of products are you most interested in purchasing from our app?',
  //               style: Styles.circularStdMedium(context),
  //               maxLine: 3,
  //             ),
  //           ),
  //           CustomRadioSelectionTile(
  //             title: "General product",
  //             value: CustomerSurveySelectionStep2.generalProduct,
  //             groupValue: step2Selection,
  //             onChanged: (value) {
  //               setState(() {
  //                 step2Selection = value!;
  //               });
  //             },
  //           ),
  //           CustomRadioSelectionTile(
  //             title: "Baby blanket",
  //             value: CustomerSurveySelectionStep2.babyBlanket,
  //             groupValue: step2Selection,
  //             onChanged: (value) {
  //               setState(() {
  //                 step2Selection = value!;
  //               });
  //             },
  //           ),
  //           CustomRadioSelectionTile(
  //             title: "Flannel",
  //             value: CustomerSurveySelectionStep2.flannel,
  //             groupValue: step2Selection,
  //             onChanged: (value) {
  //               setState(() {
  //                 step2Selection = value!;
  //               });
  //             },
  //           ),
  //           CustomRadioSelectionTile(
  //             title: "Bed cover",
  //             value: CustomerSurveySelectionStep2.bedCover,
  //             groupValue: step2Selection,
  //             onChanged: (value) {
  //               setState(() {
  //                 step2Selection = value!;
  //               });
  //             },
  //           ),
  //           CustomRadioSelectionTile(
  //             title: "Double or single bed blanket",
  //             value: CustomerSurveySelectionStep2.doubleOrSingleBedBlanket,
  //             groupValue: step2Selection,
  //             onChanged: (value) {
  //               setState(() {
  //                 step2Selection = value!;
  //               });
  //             },
  //           ),
  //         ],
  //       );
  //     case 2:
  //       return Column(
  //         children: [
  //           CustomSizedBox.height(30.h),
  //           Padding(
  //             padding:  EdgeInsets.only(left: 20.w,right: 5.w),
  //             child: AppText(
  //               'How often do you typically make online purchases?',
  //               style: Styles.circularStdMedium(context),
  //               maxLine: 3,
  //             ),
  //           ),
  //           CustomRadioSelectionTile(
  //             title: "Multiple times a week",
  //             value: CustomerSurveySelectionStep3.multipleTimeAWeek,
  //             groupValue: step3Selection,
  //             onChanged: (value) {
  //               setState(() {
  //                 step3Selection = value!;
  //               });
  //             },
  //           ),
  //           CustomRadioSelectionTile(
  //             title: "Once a week",
  //             value: CustomerSurveySelectionStep3.onceAWeek,
  //             groupValue: step3Selection,
  //             onChanged: (value) {
  //               setState(() {
  //                 step3Selection = value!;
  //               });
  //             },
  //           ),
  //           CustomRadioSelectionTile(
  //             title: "A few times a month",
  //             value: CustomerSurveySelectionStep3.aFewTimeAMonth,
  //             groupValue: step3Selection,
  //             onChanged: (value) {
  //               setState(() {
  //                 step3Selection = value!;
  //               });
  //             },
  //           ),
  //           CustomRadioSelectionTile(
  //             title: "Once a month",
  //             value: CustomerSurveySelectionStep3.onceAMonth,
  //             groupValue: step3Selection,
  //             onChanged: (value) {
  //               setState(() {
  //                 step3Selection = value!;
  //               });
  //             },
  //           ),
  //           CustomRadioSelectionTile(
  //             title: "Rarely",
  //             value: CustomerSurveySelectionStep3.rarely,
  //             groupValue: step3Selection,
  //             onChanged: (value) {
  //               setState(() {
  //                 step3Selection = value!;
  //               });
  //             },
  //           ),
  //         ],
  //       );
  //     case 3:
  //       return Column(
  //         children: [
  //           CustomSizedBox.height(30.h),
  //           Padding(
  //             padding:  EdgeInsets.only(left: 20.w,right: 5.w),
  //             child: AppText(
  //               'On a scale of 1 to 5, how easy is it for you to navigate and find products on our app?',
  //               style: Styles.circularStdMedium(context),
  //               maxLine: 3,
  //             ),
  //           ),
  //           CustomRadioSelectionTile(
  //             title: "(Very Difficult)",
  //             value: CustomerSurveySelectionStep4.veryDifficult,
  //             groupValue: step4Selection,
  //             onChanged: (value) {
  //               setState(() {
  //                 step4Selection = value!;
  //               });
  //             },
  //           ),
  //           CustomRadioSelectionTile(
  //             title: "(Difficult)",
  //             value: CustomerSurveySelectionStep4.difficult,
  //             groupValue: step4Selection,
  //             onChanged: (value) {
  //               setState(() {
  //                 step4Selection = value!;
  //               });
  //             },
  //           ),
  //           CustomRadioSelectionTile(
  //             title: "(Average)",
  //             value: CustomerSurveySelectionStep4.average,
  //             groupValue: step4Selection,
  //             onChanged: ( value) {
  //               setState(() {
  //                 step4Selection = value!;
  //               });
  //             },
  //           ),
  //           CustomRadioSelectionTile(
  //             title: "(Easy)",
  //             value: CustomerSurveySelectionStep4.easy,
  //             groupValue: step4Selection,
  //             onChanged: (value) {
  //               setState(() {
  //                 step4Selection = value!;
  //               });
  //             },
  //           ),
  //           CustomRadioSelectionTile(
  //             title: "(Very Easy)",
  //             value: CustomerSurveySelectionStep4.veryEasy,
  //             groupValue: step1Selection,
  //             onChanged: (value) {
  //               setState(() {
  //                 step4Selection = value!;
  //               });
  //             },
  //           ),
  //         ],
  //       );
  //     case 4:
  //       return Form(
  //         key: _formKey,
  //         child: Padding(
  //           padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
  //           child: SingleChildScrollView(
  //             child: Column(
  //               children: [
  //                 AppText(
  //                   'Is there anything you would like to see improved or added to our app\'s shopping experience?',
  //                   style: Styles.circularStdMedium(context, fontSize: 16.sp),
  //                   maxLine: 3,
  //                 ),
  //                 // AppText(
  //                 //   'Feel free to share your thoughts below. Your feedback matters to us!',
  //                 //   style: Styles.circularStdMedium(context, fontSize: 16.sp),
  //                 //   maxLine: 2,
  //                 // ),
  //                 CustomTextFieldWithOnTap(
  //                   controller: suggestionController,
  //                   hintText: 'Write your suggestion',
  //                   hintTextColor: AppColors.blackColor,
  //                   textInputType: TextInputType.text,
  //                   validator: Validate.activityNotes,
  //                   maxline: 8,
  //                   isBorderRequired: false,
  //                   borderRadius: 20.r,
  //                   isShadowRequired: true,
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       );
  //     default:
  //       return Container();
  //   }
  // }
}
