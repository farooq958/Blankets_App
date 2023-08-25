
import 'package:hbk/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:hbk/Data/DataSource/Resources/imports.dart';
import 'package:hbk/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:hbk/Presentation/Widgets/Auth/reset_password_screen.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/BottomNavigationScreen/bottom_navigation_screen.dart';




class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    print('Text Scale ${MediaQuery.of(context).textScaleFactor}');
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomSizedBox.height(80.h),
               Center(
                child: AssetImageWidget(
                  url: 'assets/images/applogo.png',
                  height: 150.h,
                  width: 150.w,
                  color: AppColors.primaryColor,
                ),
              ),

              CustomSizedBox.height(20.h),

              AppText(AppStrings.login,
                  style: Styles.circularStdBold(context, fontSize: 16.sp)),
              CustomSizedBox.height(20.h),
              CustomTextFieldWithOnTap(
                controller: TextEditingController(),
                hintText: 'Card Code',
                textInputType: TextInputType.number,
                titleTextColor: Colors.black,
                prefixIcon: const Icon(Icons.email),
                isShadowRequired: true,
                isBorderRequired: false,
                borderRadius: 30.r,
              ),
              CustomTextFieldWithOnTap(
                controller: TextEditingController(),
                hintText: 'Password',
                textInputType: TextInputType.visiblePassword,
                titleTextColor: Colors.black,
                prefixIcon: const Icon(Icons.lock),
                obscureText: true,
                borderRadius: 30.r,
                suffixIcon: const Icon(Icons.remove_red_eye),
                isShadowRequired: true,
                isBorderRequired: false,

              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     CustomButton(
              //       onTap: () {
              //         Navigate.to(context, const ResetPasswordScreen());
              //       },
              //       text: 'Forgot password?',
              //       isBorder: false,
              //       borderColor: Colors.transparent,
              //       bgColor: Colors.transparent,
              //       textColor: AppColors.primaryColor,
              //     ),
              //   ],
              // ),

              80.y,
              Column(
                children: [
                  CustomButton(
                    borderRadius: 30.r,
                      onTap: () {
                    //  LoadingDialog.showLoadingDialog(context);
                   Navigate.to(context, const BottomNavigationScreen(isGuest: false,));
                  // BottomNotifier.bottomNavigationNotifier.value=0;

                  }, text: 'Login'),
                  CustomSizedBox.height(10.h),
                  CustomButton(
                    onTap: () {
                      Navigate.to(context, const BottomNavigationScreen(isGuest: true,));
                   //   BottomNotifier.bottomNavigationNotifier.value=0;
                    },
                    text: 'Login as guest',
                    bgColor: Colors.transparent,
                    borderColor: Colors.transparent,
                    textColor: AppColors.primaryColor,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
