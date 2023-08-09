import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hbk/Application/Services/Navigation/navigation.dart';
import 'package:hbk/Data/DataSource/Resources/assets.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Resources/sized_box.dart';
import 'package:hbk/Data/DataSource/Resources/strings.dart';
import 'package:hbk/Data/DataSource/Resources/text_styles.dart';
import 'package:hbk/Presentation/Common/app_buttons.dart';
import 'package:hbk/Presentation/Common/app_shadow.dart';
import 'package:hbk/Presentation/Common/app_text.dart';
import 'package:hbk/Presentation/Common/custom_textfield_with_on_tap.dart';
import 'package:hbk/Presentation/Common/image_widgets.dart';
import 'package:hbk/Presentation/Widgets/Auth/Components/pinput_example.dart';
import 'package:hbk/Presentation/Widgets/Auth/create_new_password.dart';
import 'package:pinput/pinput.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            width: 1.sw,
            height: 1.sh,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 100.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.center,
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
                        AppStrings.almostThere,
                        style: Styles.circularStdBold(context, fontSize: 24.sp),
                      ),
                      AppText(
                        AppStrings.verificationCodeNote,
                        style: Styles.circularStdMedium(context),
                        maxLine: 2,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: const PinputExample(),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    bottom: 40.h,
                    right: 0,
                    left: 0,
                    child: CustomButton(
                        onTap: () {
                          Navigate.to(context, const CreateNewPasswordScreen());
                        },
                        text: AppStrings.verify)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
