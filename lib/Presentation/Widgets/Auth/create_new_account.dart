import 'package:hbk/Data/DataSource/Resources/imports.dart';

class CreateNewAccountScreen extends StatefulWidget {
  const CreateNewAccountScreen({Key? key}) : super(key: key);

  @override
  State<CreateNewAccountScreen> createState() => _CreateNewAccountScreenState();
}

class _CreateNewAccountScreenState extends State<CreateNewAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomSizedBox.height(80.h),
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
              CustomSizedBox.height(5.h),
              AppText(
                AppStrings.setNewPasswordNote,
                style: Styles.circularStdMedium(context),
                maxLine: 2,
              ),
              CustomSizedBox.height(10.h),
              CustomTextFieldWithOnTap(
                controller: TextEditingController(),
                hintText: AppStrings.newPassword,
                textInputType: TextInputType.visiblePassword,
                titleTextColor: Colors.black,
                borderRadius: 30.r,
                prefixIcon: const Icon(Icons.lock),
                obscureText: true,
                suffixIcon: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.remove_red_eye)),
                isBorderRequired: false,
                isShadowRequired: true,
              ),
              CustomTextFieldWithOnTap(
                controller: TextEditingController(),
                hintText: AppStrings.confirmPassword,
                textInputType: TextInputType.visiblePassword,
                titleTextColor: Colors.black,
                borderRadius: 30.r,
                prefixIcon: const Icon(Icons.lock),
                obscureText: true,
                suffixIcon: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.remove_red_eye)),
                isBorderRequired: false,
                isShadowRequired: true,
              ),
              CustomSizedBox.height(130.h),
              CustomButton(
                borderRadius: 30.r,
                onTap: () {
                  CustomDialog.successDialog(context,
                      title: 'Password changed successfully',
                      message:
                          'Awesome! you’ve successfully change your password',
                      messageFontSize: 16.sp,
                      titleFontSize: 22.sp);

                  Future.delayed(const Duration(seconds: 2),(){
                    Navigator.of(context).pop(true);
                    Navigate.toReplace(context, const LoginScreen());
                  });

                },
                text: AppStrings.createNewPassword,
              )
            ],
          ),
        ),
      ),
    );
  }
}
