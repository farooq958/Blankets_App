import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hbk/Data/AppData/app_preferences.dart';
import 'package:hbk/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:hbk/Data/DataSource/Resources/imports.dart';
import 'package:hbk/Domain/Models/Auth/user_data.dart';
import 'package:hbk/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:hbk/Presentation/Widgets/CustomerSurvery/Controller/customer_survey_cubit.dart';
import 'package:hbk/Presentation/Widgets/CustomerSurvery/State/customer_survey_state.dart';
import 'package:hbk/Presentation/Widgets/CustomerSurvery/customer_survey_steps.dart';

import 'package:shared_preferences/shared_preferences.dart';

class CustomerSurveyScreen extends StatefulWidget {
  const CustomerSurveyScreen({Key? key}) : super(key: key);

  @override
  State<CustomerSurveyScreen> createState() => _CustomerSurveyScreenState();
}

class _CustomerSurveyScreenState extends State<CustomerSurveyScreen> {
  UserDetails? userDetails;

  @override
  void initState() {
    // TODO: implement initState

    userDetails = SharedPrefs.userData;

    context
        .read<CustomerSurveyQuestionCubit>()
        .getCustomerSurveyQuestions(userDetails?.cardCode);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWithBackButton(
        title: AppStrings.customerSurvey,
      ),
      body: BlocConsumer<CustomerSurveyQuestionCubit, CustomerSurveyState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is CustomerSurveyLoading) {
            LoadingDialog.showLoadingDialog(context);
          }
          if (state is CustomerSurveyLoaded) {
            Navigator.of(context).pop(true);
          }
          if (state is CustomerSurveyError) {
            Navigator.of(context).pop(true);
            WidgetFunctions.instance.snackBar(context,
                text: state.error, bgColor: AppColors.primaryColor);
          }
        },
        builder: (context, state) {
          print("State of survey is $state");
          if (state is CustomerSurveyLoaded) {
            return Padding(
              padding: EdgeInsets.all(20.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSizedBox.height(40.h),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Center(
                            child: SvgPicture.asset(
                          Assets.customerSurvey,
                          color: AppColors.primaryColor,
                          width: 1.sw,
                          height: 150.h,
                        )),
                        CustomSizedBox.height(20.h),
                        AppText(
                          state.questionsData[0].title.toString(),
                          style:
                              Styles.circularStdBold(context, fontSize: 18.sp),
                          textAlign: TextAlign.end,
                        ),
                        CustomSizedBox.height(10.h),
                        AppText(
                          state.questionsData[0].titleDetail.toString(),
                          style: Styles.circularStdMedium(context,
                              fontSize: 14.sp),
                          maxLine: 5,
                          textAlign: TextAlign.end,
                        ),
                      ],
                    ),
                  ),
                  CustomButton(
                      borderRadius: 30.r,
                      onTap: () {
                        String? sharedDate = SharedPrefs.getSurvey();
                        bool value = Utils.todayCheck(date: sharedDate);

                        Navigate.to(
                            context,
                            CustomerSurveySteps(
                              customerSurveyData: state.questionsData,
                              feedBackAdded: value,
                            ));
                      },
                      text: 'Submit'),
                  10.y,
                  CustomButton(
                      borderRadius: 30.r,
                      bgColor: Colors.white,
                      textColor: AppColors.blackColor,
                      isBorder: false,
                      onTap: () {
                        Navigate.pop(context);
                      },
                      text: 'Cancel')
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
