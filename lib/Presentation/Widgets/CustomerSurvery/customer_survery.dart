
import 'package:hbk/Data/DataSource/Resources/imports.dart';
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
              Navigate.to(context, const CustomerSurveySteps());
            }, text: 'Submit')
          ],
        ),
      ),
    );
  }
}
