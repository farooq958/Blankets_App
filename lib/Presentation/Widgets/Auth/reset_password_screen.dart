import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hbk/Data/DataSource/Static/assets.dart';
import 'package:hbk/Data/DataSource/Static/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Static/sized_box.dart';
import 'package:hbk/Data/DataSource/Static/text_styles.dart';
import 'package:hbk/Presentation/Common/app_text.dart';
import 'package:hbk/Presentation/Common/custom_textfield_with_on_tap.dart';
import 'package:hbk/Presentation/Common/image_widgets.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const AssetImageWidget(
                url: 'assets/images/applogo.png',
                height: 130,
                width: 130,
                color: AppColors.primaryColor,
              ),
              CustomSizedBox.height(16.h),
              AppText('Can\'t Sign In', style: Styles.circularStdBold(context,fontSize: 25.sp)),
              CustomSizedBox.height(8.h),
              AppText('Enter your email to reset password', style: Styles.circularStdMedium(context)),
              CustomSizedBox.height(8.h),
              CustomTextFieldWithOnTap(controller: TextEditingController(), hintText: 'Email', textInputType: TextInputType.emailAddress),

            ],
          ),
        ),
      ),
    );
  }
}

class CircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  CircleIconButton({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      // height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(icon, size: 25),
        onPressed: onPressed,
      ),
    );
  }
}
