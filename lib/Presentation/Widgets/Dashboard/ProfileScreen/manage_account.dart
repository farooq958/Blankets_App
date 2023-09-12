import 'package:hbk/Data/DataSource/Resources/imports.dart';

import 'package:hbk/Presentation/Widgets/Dashboard/ProfileScreen/create_new_password.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/ProfileScreen/delete_account.dart';

class ManageAccount extends StatelessWidget {
  const ManageAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWithBackButton(
        title: AppStrings.manageAccount,
        exceptional: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSizedBox.height(20.h),
            Material(
              borderRadius: BorderRadius.circular(10.r),
              elevation: 2,
              child: CustomButton(
                onTap: () {
                  Navigate.to(context, const CreateNewPasswordScreen());
                },
                text: AppStrings.changePassword,
                bgColor: AppColors.whiteColor,
                isBorder: false,
                textColor: AppColors.blackColor,
                leadingIcon: Assets.unLock,
                leadingSvgIcon: true,
                // borderRadius: 15,
                height: 55.h,
                iconColor: AppColors.blackColor,
                gapWidth: 15.w,
                isButtonAlignLeft: true,
              ),
            ),
            CustomSizedBox.height(20.h),
            Material(
              borderRadius: BorderRadius.circular(10.r),
              elevation: 2,
              child: CustomButton(
                onTap: () {
                  Navigate.to(context, const DeleteAccount());
                },
                text: AppStrings.deleteAccount,
                bgColor: AppColors.whiteColor,
                isBorder: false,
                height: 55.h,
                textColor: AppColors.blackColor,
                leadingIcon: Assets.delete,
                leadingSvgIcon: true,
                isButtonAlignLeft: true,
                gapWidth: 15.w,
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
