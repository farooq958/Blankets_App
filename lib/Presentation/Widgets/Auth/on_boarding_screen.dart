import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hbk/Application/NavigationService/navigation.dart';
import 'package:hbk/Data/DataSource/Static/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Static/sized_box.dart';
import 'package:hbk/Data/DataSource/Static/text_styles.dart';
import 'package:hbk/Data/DataSource/Static/utils.dart';
import 'package:hbk/Presentation/Common/app_buttons.dart';
import 'package:hbk/Presentation/Common/app_text.dart';
import 'package:hbk/Presentation/Common/image_widgets.dart';
import 'package:hbk/Presentation/Widgets/Auth/Login/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
              onPressed: () {
                // Handle skip button tap
                _goToLoginScreen();
              },
              child:
                  AppText(style: Styles.circularStdRegular(context), 'Skip')),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AssetImageWidget(
                  url: Utils.imageList[currentIndex],
                  width: 200.w,
                  height: 180.h,
                ),

                CustomSizedBox.height(16.h),
                AppText(Utils.textList[currentIndex],
                    style: Styles.circularStdBold(
                      context,
                      fontSize: 18.sp,
                    )),
                CustomSizedBox.height(8.0),
                Text(
                 Utils.textSubtitles[currentIndex],
                  textAlign: TextAlign.center,
                  style:  TextStyle(fontSize: 16.sp),
                ),

                CustomSizedBox.height(32.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    Utils.imageList.length,
                    (index) => _buildDotIndicator(index),
                  ),
                ),

                CustomSizedBox.height(32.h),
                Padding(
                  padding: EdgeInsets.only(top: 80.h),
                  child: CustomButton(
                    onTap: () {
                      if (currentIndex < Utils.imageList.length - 1) {
                        setState(() {
                          currentIndex++;
                        });
                      } else {
                        // Show the "Get Started" button when the last content is shown.
                        _showGetStartedButton();
                      }
                    },
                    text: currentIndex < Utils.imageList.length - 1
                        ? "Next"
                        : "Get Started",
                  ),
                )
              ],
            ),),
          ],
        ),
      ),
    );
  }

  // Build the dot indicator for the horizontal menu.
  Widget _buildDotIndicator(int index) {
    bool isActive = index == currentIndex;

    Color color = index == currentIndex ? AppColors.primaryColor : Colors.grey;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        width:  isActive ? 30.w : 15.w,
        height: 5.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }

  // Navigate to the login screen.
  void _goToLoginScreen() {
    Navigate.to(context, const LoginScreen());
  }

  // Show the "Get Started" button.
  void _showGetStartedButton() {
    Navigate.toReplace(context, const LoginScreen());
  }
}
