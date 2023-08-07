import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hbk/Application/NavigationService/navigation.dart';
import 'package:hbk/Data/DataSource/Static/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Static/sized_box.dart';
import 'package:hbk/Data/DataSource/Static/strings.dart';
import 'package:hbk/Data/DataSource/Static/text_styles.dart';
import 'package:hbk/Presentation/Common/app_buttons.dart';
import 'package:hbk/Presentation/Common/app_text.dart';
import 'package:hbk/Presentation/Common/custom_textfield_with_on_tap.dart';
import 'package:hbk/Presentation/Common/image_widgets.dart';
import 'package:hbk/Presentation/Widgets/Auth/reset_password_screen.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/BottomNavigationScreen/bottom_navigation_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomSizedBox.height(100.h),
              const Center(
                child: AssetImageWidget(
                  url: 'assets/images/applogo.png',
                  height: 130,
                  width: 130,
                  color: AppColors.primaryColor,
                ),
              ),
              CustomSizedBox.height(20.h),
              AppText(AppStrings.login,
                  style: Styles.circularStdBold(context, fontSize: 16.sp)),
              CustomSizedBox.height(20.h),
              CustomTextFieldWithOnTap(
                controller: TextEditingController(),
                hintText: 'Card Code',
                textInputType: TextInputType.number,
                titleTextColor: Colors.black,
                prefixIcon: const Icon(Icons.email),
                isShadowRequired: true,
                isBorderRequired: false,
                borderRadius: 30.r,
              ),
              CustomTextFieldWithOnTap(
                controller: TextEditingController(),
                hintText: 'Password',
                textInputType: TextInputType.visiblePassword,
                titleTextColor: Colors.black,
                prefixIcon: const Icon(Icons.lock),
                obscureText: true,
                borderRadius: 30.r,
                suffixIcon: const Icon(Icons.remove_red_eye),
                isShadowRequired: true,
                isBorderRequired: false,

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                    onTap: () {
                      Navigate.to(context, const ResetPasswordScreen());
                    },
                    text: 'Forgot password?',
                    isBorder: false,
                    borderColor: Colors.transparent,
                    bgColor: Colors.transparent,
                    textColor: AppColors.primaryColor,
                  ),
                ],
              ),
              CustomSizedBox.height(80.h),
              Column(
                children: [
                  CustomButton(onTap: () {
                 //   Navigate.to(context, const BottomNavigationScreen());

                  }, text: 'Login'),
                  CustomSizedBox.height(10.h),
                  CustomButton(
                    onTap: () {},
                    text: 'Login as guest',
                    bgColor: Colors.transparent,
                    borderColor: Colors.transparent,
                    textColor: AppColors.primaryColor,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
