
import 'package:hbk/Data/DataSource/Resources/imports.dart';

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
