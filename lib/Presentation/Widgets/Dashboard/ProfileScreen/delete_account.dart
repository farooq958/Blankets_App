
import 'package:hbk/Data/DataSource/Resources/imports.dart';

class DeleteAccount extends StatelessWidget {
  const DeleteAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWithBackButton(
        title: AppStrings.deleteAccount,
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 25.w),
            child: Column(
              children: [
                AppText(
                  AppStrings.deleteAccountNote,
                  style: Styles.circularStdMedium(context, fontSize: 18.sp),
                  overflow: TextOverflow.ellipsis,
                  maxLine: 7,
                ),
                AppText(
                  'Before proceeding, we want to make sure you are fully informed about the consequences of account deletion:',
                  style: Styles.circularStdMedium(context, fontSize: 18.sp),
                  maxLine: 3,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText('1. ',
                        style:
                            Styles.circularStdMedium(context, fontSize: 18.sp)),
                    Expanded(
                      child: AppText(
                        'Loss of Access: Deleting your account means you will no longer have access to your profile information, order history and Wishlist.',
                        style:
                            Styles.circularStdMedium(context, fontSize: 18.sp),
                        maxLine: 5,
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText('2. ',
                        style:
                            Styles.circularStdMedium(context, fontSize: 18.sp)),
                    Expanded(
                      child: AppText(
                        'No Recovery: Once the account is deleted, we cannot retrieve any of your account data or restore access to your account.',
                        style:
                            Styles.circularStdMedium(context, fontSize: 18.sp),
                        maxLine: 5,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 20.h,
              left: 10.w,
              right: 10.w,
              child: CustomButton(
                text: AppStrings.deleteAccount,

                onTap: () {
                  CustomDialog.successConfirmDialog(
                    context,
                    title: 'Confirm delete account',
                    message:
                        'We\'re sorry to see you go, but we understand that circumstances may change. If you wish to delete your account, please be aware that this action is irreversible.',
                    assetImage: Assets.delete,
                    button1Text: 'Cancel',
                    button2Text: 'Delete',
                    button1Tap: () {
                      Navigator.of(context).pop(true);
                    },
                    button2Tap: () {
                      Navigator.of(context).pop(true);
                      CustomDialog.successDialog(context,
                          title: 'Account deleted successfully',
                          message:
                              'You’ve successfully delete your account and will longer be able to access it.',
                          image: Assets.delete,
                          imageColor: AppColors.primaryColor);
                    },
                    imageColor: AppColors.redColor,
                    height: 320.h,
                    width: 300.h,
                    button2BgColor: AppColors.redColor,
                  );
                },
                bgColor: Colors.white,
                textColor: AppColors.redColor,
                borderColor: AppColors.redColor,
              )),
        ],
      ),
    );
  }
}
