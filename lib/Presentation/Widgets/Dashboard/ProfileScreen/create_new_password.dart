
import 'package:hbk/Data/DataSource/Resources/imports.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWithBackButton(
        title: AppStrings.createNewPassword,
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.h, left: 15.w, right: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(AppStrings.oldPassword,
                    style: Styles.circularStdMedium(context, fontSize: 18.sp)),
                CustomTextFieldWithOnTap(
                  controller: oldPasswordController,
                  hintText: AppStrings.oldPassword,
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
                CustomSizedBox.height(25.h),
                AppText(AppStrings.newPassword,
                    style: Styles.circularStdMedium(context, fontSize: 18.sp)),
                CustomTextFieldWithOnTap(
                  controller: newPasswordController,
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
                  controller: confirmPasswordController,
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
              ],
            ),
          ),
          Positioned(
              bottom: 20.h,
              left: 10.w,
              right: 10.w,
              child: CustomButton(
                text: AppStrings.update,
                onTap: () {},
              )),
        ],
      ),
    );
  }
}
