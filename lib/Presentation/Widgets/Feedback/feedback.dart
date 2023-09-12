import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hbk/Data/DataSource/Resources/imports.dart';
import 'package:hbk/Data/DataSource/Resources/validator.dart';
import 'package:hbk/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:hbk/Presentation/Widgets/Feedback/Controller/feedback_cubit.dart';
import 'package:hbk/Presentation/Widgets/Feedback/State/feedback_state.dart';

class Feedback extends StatefulWidget {
  const Feedback({Key? key}) : super(key: key);

  @override
  State<Feedback> createState() => _FeedbackState();
}

class _FeedbackState extends State<Feedback> {
  final nameController = TextEditingController();
  final subjectController = TextEditingController();
  final feedbackController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithBackButton(
        iconSize: 15.sp,
        title: AppStrings.feedback,
        exceptional: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.r),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextFieldWithOnTap(
                  controller: subjectController,
                  hintText: 'Subject/title',
                  textInputType: TextInputType.text,
                  isBorderRequired: false,
                  isShadowRequired: true,
                  hintTextColor: AppColors.blackColor,
                  validator: Validate.feedBackTitle,
                ),
                CustomTextFieldWithOnTap(
                  controller: feedbackController,
                  hintText: 'Write your feedback',
                  textInputType: TextInputType.text,
                  isBorderRequired: false,
                  isShadowRequired: true,
                  hintTextColor: AppColors.blackColor,
                  maxline: 8,
                  validator: Validate.feedbackNotes,
                ),
                CustomSizedBox.height(60.h),
                BlocConsumer<FeedBackCubit, FeedBackState>(
                  listener: (context, state) {
                    // TODO: implement listener

                    if (state is FeedBackLoading) {
                      LoadingDialog.showLoadingDialog(context);
                    }
                    if (state is FeedBackError) {
                      Navigator.of(context).pop(true);

                      WidgetFunctions.instance.snackBar(context,
                          text: state.error, bgColor: AppColors.primaryColor);
                    }
                    if (state is FeedBackSuccess) {
                      Navigator.of(context).pop(true);
                      CustomDialog.successDialog(context,
                          title: "Thank You for Your Valuable Feedback!",
                          message:
                              "We sincerely appreciate you taking the time to participate in our customer survey.",
                          image: "assets/images/feedback.png");
                      feedbackController.clear();
                      subjectController.clear();
                      Future.delayed(const Duration(seconds: 2), () {
                        Navigator.of(context).pop(true);
                      });
                    }
                  },
                  builder: (context, state) {
                    return CustomButton(
                        borderRadius: 30.r,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            Map<String, dynamic> feedBackData = {
                              "feedback": feedbackController.text,
                              "title": subjectController.text,
                            };
                            context
                                .read<FeedBackCubit>()
                                .postFeedBack(feedBackData);
                          }
                        },
                        text: 'submit');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
