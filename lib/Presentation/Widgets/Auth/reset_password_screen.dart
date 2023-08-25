import 'package:hbk/Data/DataSource/Resources/imports.dart';

import 'package:hbk/Presentation/Widgets/Auth/verification_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _focusNode = FocusNode();

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
                  // isSvg: true,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  width: 46.w,
                  height: 46.h,
                ),
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
                      hintTextColor: _focusNode.hasFocus ? AppColors.primaryColor : AppColors.greyColor,
                      textInputType: TextInputType.emailAddress,
                      isBorderRequired: false,
                      isShadowRequired: true,
                      borderRadius: 30.r,
                      prefixIcon: SvgPicture.asset(Assets.emailIconSvg,color: _focusNode.hasFocus ? AppColors.primaryColor : AppColors.greyColor,),
                      focusNode: _focusNode,
                      onTap: (){
                        FocusScope.of(context).requestFocus(_focusNode);
                      },
                    ),
                    // Add a spacer to push the button to the bottom
                    CustomSizedBox.height(180.h),
                    CustomButton(
                        borderRadius: 30.r,
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
