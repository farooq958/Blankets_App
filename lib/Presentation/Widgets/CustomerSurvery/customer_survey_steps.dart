import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hbk/Data/AppData/app_preferences.dart';
import 'package:hbk/Data/DataSource/Resources/imports.dart';
import 'package:hbk/Data/DataSource/Resources/validator.dart';
import 'package:hbk/Domain/Models/CustomerSurvey/customer_survey.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/BottomNavigationScreen/bottom_navigation_screen.dart';

import '../../Common/Dialogs/loading_dialog.dart';
import 'Controller/add_survey_cubit.dart';
import 'customer_survery.dart';

enum CustomerSurveySelectionStep1 {
  excellent,
  good,
  average,
  belowAverage,
  poor
}

enum CustomerSurveySelectionStep2 {
  generalProduct,
  babyBlanket,
  flannel,
  bedCover,
  doubleOrSingleBedBlanket
}

enum CustomerSurveySelectionStep3 {
  multipleTimeAWeek,
  onceAWeek,
  aFewTimeAMonth,
  onceAMonth,
  rarely
}

enum CustomerSurveySelectionStep4 {
  veryDifficult,
  difficult,
  average,
  easy,
  veryEasy
}

class CustomerSurveySteps extends StatefulWidget {
  List<CustomerSurvey>? customerSurveyData;
  bool feedBackAdded;

  CustomerSurveySteps(
      {super.key,
      required this.customerSurveyData,
      required this.feedBackAdded});

  @override
  _CustomerSurveyStepsState createState() => _CustomerSurveyStepsState();
}

class _CustomerSurveyStepsState extends State<CustomerSurveySteps> {
  final ValueNotifier<int> currentPageNotifier = ValueNotifier<int>(0);
  List<bool> stepCompletion = [false, false, false, false, false];
  final pageController = PageController();
  final suggestionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  CustomerSurveySelectionStep1 step1Selection =
      CustomerSurveySelectionStep1.excellent;
  CustomerSurveySelectionStep2 step2Selection =
      CustomerSurveySelectionStep2.generalProduct;
  CustomerSurveySelectionStep3 step3Selection =
      CustomerSurveySelectionStep3.multipleTimeAWeek;
  CustomerSurveySelectionStep4 step4Selection =
      CustomerSurveySelectionStep4.veryDifficult;

  List<Map<String, String>> listData = [];

  Map<String, String> map1 = {};
  Map<String, String> map2 = {};
  Map<String, String> map3 = {};
  Map<String, String> map4 = {};
  Map<String, String> map5 = {};

  @override
  void initState() {
    ///Assign a default answer to the questions if the user doesn't click on any answer.
    /// The default value will be the first answer, which is answer number 1.

    map1 = {
      'sno': '${widget.customerSurveyData![0].sno}',
      'ansvalue': 1.toString()
    };
    map2 = {
      'sno': '${widget.customerSurveyData![1].sno}',
      'ansvalue': 1.toString()
    };
    map3 = {
      'sno': '${widget.customerSurveyData![2].sno}',
      'ansvalue': 1.toString()
    };
    map4 = {
      'sno': '${widget.customerSurveyData![3].sno}',
      'ansvalue': 1.toString()
    };
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    currentPageNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWithBackButton(
        title: 'Customer survey',
        exceptional: true,
      ),
      body: widget.feedBackAdded == false
          ? BlocConsumer<AddSurveyCubit, AddSurveyState>(
              listener: (context, state) {
              if (state is AddSurveyLoaded) {
                SharedPrefs.setSurveyDate(
                    survey: DateTime.now().toIso8601String());

                CustomDialog.successDialog(context,
                    title: 'Thank You for Your Valuable Feedback!',
                    message:
                        'We sincerely appreciate you taking the time to participate in our customer survey.',
                    image: Assets.customerSurveySuccess);
                Future.delayed(const Duration(seconds: 1), () {
                  Navigate.toReplaceAll(
                      context,
                      const BottomNavigationScreen(
                        isGuest: false,
                      ));
                });
              } else if (state is AddSurveyError) {
                WidgetFunctions.instance.snackBar(context, text: state.error);
              }
              // TODO: implement listener
            }, builder: (context, state) {
              if (state is AddSurveyLoading) {
                return Center(child: LoadingDialog.loadingWidget());
              } else {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ValueListenableBuilder<int>(
                            valueListenable: currentPageNotifier,
                            builder: (context, currentPage, child) {
                              return AppText('${currentPage + 1}/5',
                                  style: Styles.circularStdBold(context,
                                      fontSize: 16.sp));
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
                          return index == 4
                              ? Form(
                                  key: _formKey,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.w, vertical: 30.h),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          AppText(
                                            widget
                                                .customerSurveyData![4].question
                                                .toString(),
                                            style: Styles.circularStdMedium(
                                                context,
                                                fontSize: 16.sp),
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
                                      padding: EdgeInsets.only(
                                          left: 20.w, right: 5.w),
                                      child: AppText(
                                        // 'How would you rate the overall user interface of the app?',
                                        widget
                                            .customerSurveyData![index].question
                                            .toString(),
                                        style:
                                            Styles.circularStdMedium(context),
                                        maxLine: 3,
                                      ),
                                    ),
                                    CustomRadioSelectionTile(
                                      title: "Likely",
                                      value: CustomerSurveySelectionStep1
                                          .excellent,
                                      groupValue: step1Selection,
                                      number: "1",
                                      onChanged: (value) {
                                        setState(() {
                                          step1Selection = value!;
                                          addDataToMap(index, '1');
                                        });
                                      },
                                    ),
                                    CustomRadioSelectionTile(
                                      title: "",
                                      number: "2",
                                      value: CustomerSurveySelectionStep1.good,
                                      groupValue: step1Selection,
                                      onChanged: (value) {
                                        setState(() {
                                          step1Selection = value!;
                                          addDataToMap(index, '2');
                                        });
                                      },
                                    ),
                                    CustomRadioSelectionTile(
                                      title: "",
                                      number: "3",
                                      value:
                                          CustomerSurveySelectionStep1.average,
                                      groupValue: step1Selection,
                                      onChanged: (value) {
                                        setState(() {
                                          step1Selection = value!;
                                        });
                                        addDataToMap(index, '3');
                                      },
                                    ),
                                    CustomRadioSelectionTile(
                                      title: "",
                                      number: "4",
                                      value: CustomerSurveySelectionStep1
                                          .belowAverage,
                                      groupValue: step1Selection,
                                      onChanged: (value) {
                                        setState(() {
                                          step1Selection = value!;
                                          addDataToMap(index, '4');
                                        });
                                      },
                                    ),
                                    CustomRadioSelectionTile(
                                      title: "UnLikely",
                                      number: "5",
                                      value: CustomerSurveySelectionStep1.poor,
                                      groupValue: step1Selection,
                                      onChanged: (value) {
                                        setState(() {
                                          step1Selection = value!;
                                          addDataToMap(index, '4');
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
                                addToList(currentPage);
                                pageController
                                    .jumpToPage(currentPageNotifier.value + 1);
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
                              /// map 5 is

                              map5 = {
                                'sno': '${widget.customerSurveyData![4].sno}',
                                'ansvalue': suggestionController.text.trim()
                              };

                              if (_formKey.currentState!.validate()) {
                                listData.add(map5);
                                context
                                    .read<AddSurveyCubit>()
                                    .addSurvey(listData);
                              }
                            },
                            text: 'Submit',
                            horizontalMargin: 20.w,
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                );
              }
            })
          : Center(
              child: AppText('Survey Already Submitted',
                  style: Styles.circularStdMedium(context,
                      color: AppColors.blackColor, fontSize: 16)),
            ),
    );
  }

  addToList(int index) {
    /// The function is use to add a specific answer and value in the list which is map

    print(index);
    index == 0
        ? listData.add(map1)
        : index == 1
            ? listData.add(map2)
            : index == 2
                ? listData.add(map3)
                : index == 3
                    ? listData.add(map4)
                    : index == 4
                        ? listData.add(map5)
                        : null;
  }

  addDataToMap(int index, String ansVal) {
    /// The function is use to add answer in the map of the specific question
    index == 0
        ? map1 = {
            'sno': '${widget.customerSurveyData![index].sno}',
            'ansvalue': ansVal,
          }
        : index == 1
            ? map2 = {
                'sno': '${widget.customerSurveyData![index].sno}',
                'ansvalue': ansVal,
              }
            : index == 2
                ? map3 = {
                    'sno': '${widget.customerSurveyData![index].sno}',
                    'ansvalue': ansVal,
                  }
                : index == 3
                    ? map4 = {
                        'sno': '${widget.customerSurveyData![index].sno}',
                        'ansvalue': ansVal,
                      }
                    : null;
  }
}
