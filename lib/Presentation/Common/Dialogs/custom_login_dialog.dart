

import 'package:hbk/Data/AppData/app_preferences.dart';
import 'package:hbk/Data/DataSource/Resources/imports.dart';

void showLoginDialog(BuildContext context,{bool? fromSession}){
  CustomDialog.dialog(
      context,
     willPop:fromSession!=null?false:true,
     // barrierDismissible:fromSession!=null?true:false,
      SizedBox(
          width: 1.sw,
          height: 250.h,
          child: Center(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment:
              MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  Assets.logout,
                  width: 50.w,
                  height: 50.h,
                ),
                CustomSizedBox.height(10.h),
                AppText( fromSession!= null ? 'Please Login First':'Please login first',
                    style: Styles.circularStdBold(
                        context,
                        fontSize: 22.sp)),
                CustomSizedBox.height(10.h),
                AppText(  fromSession!= null ?'Session Expired':'Please login first',
                    style: Styles.circularStdBold(
                        context,
                        fontSize: 16.sp)),
                CustomSizedBox.height(10.h),

                CustomButton(
                  onTap: () {
                    Navigator.of(context).pop(true);
                    Navigate.toReplaceAll(context, const LoginScreen());
                    if(fromSession!= null )
                      {
                        SharedPrefs.clearPref();
                      }
                  },
                  text: 'Login',
                  width: 1.sw,
                  horizontalMargin: 20.w,
                ),

              ],

            ),
          )));

}