import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hbk/Application/Services/Navigation/navigation.dart';
import 'package:hbk/Data/DataSource/Resources/assets.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Resources/sized_box.dart';
import 'package:hbk/Data/DataSource/Resources/strings.dart';
import 'package:hbk/Presentation/Common/app_buttons.dart';
import 'package:hbk/Presentation/Common/custom_appbar_with_back_button.dart';
import 'package:hbk/Presentation/Common/image_widgets.dart';
import 'package:hbk/Presentation/Widgets/Auth/create_new_account.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/ProfileScreen/create_new_password.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/ProfileScreen/delete_account.dart';

class ManageAccount extends StatelessWidget {
  const ManageAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWithBackButton(
        title: AppStrings.manageAccount,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0.r),
        child: Column(
          children: [
            CustomSizedBox.height(20.h),
            Material(
              borderRadius: BorderRadius.circular(20.r),
              elevation: 2,
              child: CustomButton(
                onTap: () {
                  Navigate.to(context, const CreateNewPasswordScreen());
                },
                text: AppStrings.changePassword,
                bgColor: AppColors.whiteColor,
                isBorder: false,
                textColor: AppColors.blackColor,
                leadingIcon: Assets.passwordIcon,
                // borderRadius: 15,
                iconColor: AppColors.blackColor,
              ),
            ),
            CustomSizedBox.height(20.h),
            Material(
              borderRadius: BorderRadius.circular(20.r),
              elevation: 2,
              child: CustomButton(
                onTap: () {
                  Navigate.to(context, const DeleteAccount());
                },
                text: AppStrings.deleteAccount,
                bgColor: AppColors.whiteColor,
                isBorder: false,
                textColor: AppColors.blackColor,
                leadingIcon: Assets.deleteAccount,
                // borderRadius: 15,
                iconColor: AppColors.blackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
