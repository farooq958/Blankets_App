import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hbk/Data/DataSource/Resources/imports.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/ProfileScreen/Controller/create_new_password_cubit.dart';

import '../../../Common/Dialogs/loading_dialog.dart';

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

  final formKey = GlobalKey<FormState>();

  static String? oldPassword(v) {
    if (v.trim().isEmpty) {
      return "Please enter old password";
    }
  }

  static String? newPassword(v) {
    if (v.trim().isEmpty) {
      return "Please enter new password";
    }
  }

  static String? confirmPassword(v) {
    if (v.trim().isEmpty) {
      return "Please enter enter confirm password";
    }
  }

  bool vOldPassword = true;
  bool vNewPassword = true;
  bool vConfPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWithBackButton(
        title: AppStrings.createNewPassword,
      ),
      body: Stack(
        children: [
          BlocConsumer<CreateNewPasswordCubit, CreateNewPasswordState>(
            listener: (context, state) {
              if (state is CreateNewPasswordError) {
                WidgetFunctions.instance.snackBar(context,
                    text: state.error,
                    bgColor: AppColors.primaryColor,
                    textStyle: Styles.circularStdMedium(context,
                        fontSize: 16, color: AppColors.whiteColor));
              } else if (state is CreateNewPasswordLoaded) {
                if (state.message == '"Password Updated Successfully."') {
                  CustomDialog.successDialog(context,
                      barrierDismissible: true,
                      title: "Password Change Successfully",
                      message:
                          "Awesome! you’ve successfully change your password");
                  Future.delayed(const Duration(seconds: 2), () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  });
                } else {
                  WidgetFunctions.instance.snackBar(context,
                      text: state.message,
                      bgColor: AppColors.primaryColor,
                      textStyle: Styles.circularStdMedium(context,
                          fontSize: 16, color: AppColors.whiteColor));
                }
              }
              // TODO: implement listener
            },
            builder: (context, state) {
              if (state is CreateNewPasswordLoading) {
                return Center(child: LoadingDialog.loadingWidget());
              } else {
                return Padding(
                  padding: EdgeInsets.only(top: 20.h, left: 15.w, right: 15.w),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(AppStrings.oldPassword,
                            style: Styles.circularStdMedium(context,
                                fontSize: 18.sp)),
                        CustomTextFieldWithOnTap(
                          controller: oldPasswordController,
                          hintText: AppStrings.oldPassword,
                          textInputType: TextInputType.visiblePassword,
                          titleTextColor: Colors.black,
                          borderRadius: 30.r,
                          prefixIcon: const Icon(Icons.lock),
                          obscureText: vOldPassword,
                          suffixIcon: IconButton(
                              onPressed: () {
                                vOldPassword = !vOldPassword;
                                setState(() {});
                              },
                              icon: Icon(vOldPassword == true
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                          isBorderRequired: false,
                          isShadowRequired: true,
                          validator: oldPassword,
                        ),
                        CustomSizedBox.height(25.h),
                        AppText(AppStrings.newPassword,
                            style: Styles.circularStdMedium(context,
                                fontSize: 18.sp)),
                        CustomTextFieldWithOnTap(
                          controller: newPasswordController,
                          hintText: AppStrings.newPassword,
                          textInputType: TextInputType.visiblePassword,
                          titleTextColor: Colors.black,
                          borderRadius: 30.r,
                          prefixIcon: const Icon(Icons.lock),
                          obscureText: vNewPassword,
                          suffixIcon: IconButton(
                              onPressed: () {
                                vNewPassword = !vNewPassword;
                                setState(() {});
                              },
                              icon: Icon(vNewPassword == true
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                          isBorderRequired: false,
                          isShadowRequired: true,
                          validator: newPassword,
                        ),
                        CustomTextFieldWithOnTap(
                          controller: confirmPasswordController,
                          hintText: AppStrings.confirmPassword,
                          textInputType: TextInputType.visiblePassword,
                          titleTextColor: Colors.black,
                          borderRadius: 30.r,
                          prefixIcon: const Icon(Icons.lock),
                          obscureText: vConfPassword,
                          suffixIcon: IconButton(
                              onPressed: () {
                                vConfPassword = !vConfPassword;
                                setState(() {});
                              },
                              icon: Icon(vConfPassword == true
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                          isBorderRequired: false,
                          isShadowRequired: true,
                          validator: confirmPassword,
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
          Positioned(
              bottom: 20.h,
              left: 10.w,
              right: 10.w,
              child: CustomButton(
                borderRadius: 30.r,
                text: AppStrings.update,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    if (confirmPasswordController.text.trim() ==
                        newPasswordController.text.trim()) {
                      context.read<CreateNewPasswordCubit>().updatePassword(
                          oldPasswordController.text.trim(),
                          newPasswordController.text.trim());
                    } else {
                      WidgetFunctions.instance.snackBar(context,
                          text: 'New password and confirm password is not same',
                          bgColor: AppColors.primaryColor,
                          textStyle: Styles.circularStdMedium(context,
                              fontSize: 16, color: AppColors.whiteColor));
                    }
                  }
                },
              )),
        ],
      ),
    );
  }
}
