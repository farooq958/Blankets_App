import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hbk/Data/DataSource/Resources/assets.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Resources/sized_box.dart';
import 'package:hbk/Data/DataSource/Resources/text_styles.dart';
import 'package:hbk/Presentation/Common/app_buttons.dart';
import 'package:hbk/Presentation/Common/app_text.dart';
import 'package:hbk/Presentation/Common/circle_icon_button.dart';
import 'package:hbk/Presentation/Common/custom_textfield_with_on_tap.dart';
import 'package:hbk/Presentation/Common/image_widgets.dart';
import 'package:hbk/Presentation/Widgets/Auth/verification_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleIconButton(
                    icon: Icons.arrow_back,
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
                CustomSizedBox.height(40.h),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Center(
                      child: AssetImageWidget(
                        url: 'assets/images/applogo.png',
                        height: 150.h,
                        width: 150.w,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    CustomSizedBox.height(16.h),
                    AppText('Can\'t Sign In',
                        style:
                            Styles.circularStdBold(context, fontSize: 25.sp)),
                    CustomSizedBox.height(8.h),
                    AppText('Enter your email to reset password',
                        style: Styles.circularStdMedium(context)),
                    CustomSizedBox.height(8.h),
                    CustomTextFieldWithOnTap(
                      controller: TextEditingController(),
                      hintText: 'example@gmail.com',
hintTextColor: AppColors.primaryColor,
                      textInputType: TextInputType.emailAddress,
                      isBorderRequired: false,
                      isShadowRequired: true,
                      borderRadius: 30.r,
                      prefixIcon: const AssetImageWidget(
                        url: Assets.emailIcon,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    // Add a spacer to push the button to the bottom
                    CustomSizedBox.height(180.h),
                    CustomButton(
                        onTap: () {
                          // Navigate.to(context, const VerificationScreen());
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  const VerificationScreen()));
                        },
                        text: 'Reset password'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


