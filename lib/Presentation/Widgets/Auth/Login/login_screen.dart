
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hbk/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:hbk/Data/DataSource/Resources/imports.dart';
import 'package:hbk/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:hbk/Presentation/Widgets/Auth/Controller/login_cubit.dart';
import 'package:hbk/Presentation/Widgets/Auth/reset_password_screen.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/BottomNavigationScreen/bottom_navigation_screen.dart';




class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController cardCodeController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();
  static String? validatorPassword(v) {
    if (v.trim().isEmpty) {
      return "Please provide password";
    }

    return null;
  }
  static String? validatorCard(v) {
    if (v.trim().isEmpty) {
      return "Please provide card code";
    }

    return null;
  }
  final formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    print('Text Scale ${MediaQuery.of(context).textScaleFactor}');
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
  listener: (context, state) {
    if(state is LoginLoading)
      {
        LoadingDialog.showLoadingDialog(context);
      }
    if(state is LoginSuccess)
      {
        Navigate.pop(context);
        WidgetFunctions.instance.snackBar(context,text:'Login Successfully!',bgColor: AppColors.primaryColor);

        Navigate.to(context, const BottomNavigationScreen(isGuest: false,));


      }
    if(state is LoginError)
      {
        Navigate.pop(context);
        WidgetFunctions.instance.snackBar(context,text:state.error,bgColor: AppColors.primaryColor);
      //  CustomDialog.dialog(context, Center(child: AppText(state.error,style: Styles.circularStdRegular(context,color: AppColors.blackColor),),));
      }

    // TODO: implement listener
  },
  builder: (context, state) {
    return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key:formKey ,
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
                  controller: cardCodeController,
                  hintText: 'Card Code',
                validator: validatorCard,
                 // validateText: 'required card code',
                  textInputType: TextInputType.text,
                  titleTextColor: Colors.black,
                  prefixIcon: const Icon(Icons.email),
                  isShadowRequired: true,
                  isBorderRequired: false,
                  borderRadius: 30.r,
                ),
                CustomTextFieldWithOnTap(

                  controller: passwordController,
                  //validateText: 'required password',
                  hintText: 'Password',
                  textInputType: TextInputType.visiblePassword,
                  titleTextColor: Colors.black,
                  prefixIcon: const Icon(Icons.lock),
                  obscureText: true,
                  borderRadius: 30.r,
                  suffixIcon: const Icon(Icons.remove_red_eye),
                  isShadowRequired: true,
                  isBorderRequired: false,
                  validator: validatorPassword,

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
                          if (formKey.currentState!.validate()) {
                          context.read<LoginCubit>().loginTheUser(cardCodeController.text,passwordController.text );
                        }
                          else{



                          }
                      //  LoadingDialog.showLoadingDialog(context);
                    // Navigate.to(context, const BottomNavigationScreen(isGuest: false,));
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
  },
),
    );
  }
}
