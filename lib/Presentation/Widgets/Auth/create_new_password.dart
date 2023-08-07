import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hbk/Data/DataSource/Static/assets.dart';
import 'package:hbk/Data/DataSource/Static/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Static/strings.dart';
import 'package:hbk/Data/DataSource/Static/text_styles.dart';
import 'package:hbk/Presentation/Common/app_buttons.dart';
import 'package:hbk/Presentation/Common/app_text.dart';
import 'package:hbk/Presentation/Common/custom_textfield_with_on_tap.dart';
import 'package:hbk/Presentation/Common/dialog.dart';
import 'package:hbk/Presentation/Common/image_widgets.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 1.sw,
        height: 1.sh,
        child: Padding(
          padding: EdgeInsets.all(20.r),
          child: Stack(
            children: [
              Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: AssetImageWidget(
                          url: Assets.appLogo,
                          color: AppColors.primaryColor,
                          height: 150.h,
                          width: 150.w,
                        ),
                      ),
                      AppText(
                        AppStrings.createNewAccount,
                        style: Styles.circularStdBold(context, fontSize: 24.sp),
                      ),
                      AppText(
                        AppStrings.setNewPasswordNote,
                        style: Styles.circularStdMedium(context),
                        maxLine: 2,
                      ),
                      CustomTextFieldWithOnTap(
                        controller: TextEditingController(),
                        hintText: AppStrings.newPassword,
                        textInputType: TextInputType.visiblePassword,
                        titleTextColor: Colors.black,
                        prefixIcon: const Icon(Icons.lock),
                        obscureText: true,
                        suffixIcon: IconButton(
                            onPressed: () {}, icon: const Icon(Icons
                            .remove_red_eye)),
                        isBorderRequired: false,
                        isShadowRequired: true,
                      ),
                      CustomTextFieldWithOnTap(
                        controller: TextEditingController(),
                        hintText: AppStrings.confirmPassword,
                        textInputType: TextInputType.visiblePassword,
                        titleTextColor: Colors.black,
                        prefixIcon: const Icon(Icons.lock),
                        obscureText: true,
                        suffixIcon: IconButton(
                            onPressed: () {}, icon: const Icon(Icons
                            .remove_red_eye)),
                        isBorderRequired: false,
                        isShadowRequired: true,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: CustomButton(onTap: () {
                    CustomDialog.successDialog(
                        context, title: AppStrings.passwordChangeSuccessFull,
                        message: 'Awesome! you’ve successfully change your password');

                  }, text: AppStrings.createNewPassword,))
            ],
          ),
        ),
      ),
    );
  }
}
