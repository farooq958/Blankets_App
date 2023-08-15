
import 'package:hbk/Data/DataSource/Resources/imports.dart';

class CreateNewAccountScreen extends StatefulWidget {
  const CreateNewAccountScreen({Key? key}) : super(key: key);

  @override
  State<CreateNewAccountScreen> createState() =>
      _CreateNewAccountScreenState();
}

class _CreateNewAccountScreenState extends State<CreateNewAccountScreen> {
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
              SingleChildScrollView(
                child: Padding(
                  padding:  EdgeInsets.only(top: 100.h),
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
                        borderRadius: 30.r,
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
                  bottom: 10.h,
                  right: 0,
                  left: 0,
                  child: CustomButton(onTap: () {
                    // CustomDialog.successDialog(
                    //     context, title: AppStrings.passwordChangeSuccessFull,
                    //     message: 'Awesome! you’ve successfully change your password');
                    Navigate.toReplace(context, const LoginScreen());

                  }, text: AppStrings.createNewPassword,))
            ],
          ),
        ),
      ),
    );
  }
}
