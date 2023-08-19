

import 'package:hbk/Data/DataSource/Resources/imports.dart';



class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();
  int currentPageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState

    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(systemNavigationBarColor: AppColors.whiteColor));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 10.w, right: 10.w),
          child: Column(
            children: [
              currentPageIndex == 2
                  ? const SizedBox()
                  : Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        onPressed: () {
                          introKey.currentState!.animateScroll(2);
                        },
                        child: AppText(
                          'Skip',
                          style: Styles.circularStdMedium(context,
                              color: AppColors.greyColor),
                        ),
                      ),
                    ),
              Expanded(
                child: Stack(
                  children: [
                    IntroductionScreen(
                      key: introKey,
                      pages: [
                        PageViewModel(
                          titleWidget: AppText(
                            Utils.textList[0],
                            style: Styles.circularStdBold(context,fontSize: 24.sp),
                            textAlign: TextAlign.center,
                            maxLine: 2,
                          ),
                          bodyWidget: AppText(
                            Utils.textSubtitles[0],
                            style: Styles.circularStdMedium(context,fontSize: 16.sp),
                            maxLine: 4,
                          ),
                          image: Image.asset(Utils.imageList[0]),
                          decoration: pageDecoration(),
                        ),
                        PageViewModel(
                          titleWidget: AppText(
                            Utils.textList[1],
                            style: Styles.circularStdBold(context,fontSize: 24.sp),
                            textAlign: TextAlign.center,
                            maxLine: 2,
                          ),
                          bodyWidget: AppText(
                            Utils.textSubtitles[1],
                            style: Styles.circularStdMedium(context,fontSize: 16.sp),
                            maxLine: 5,
                          ),
                          image: Image.asset(Utils.imageList[1]),
                          decoration: pageDecoration(),
                        ),
                        PageViewModel(
                          titleWidget: AppText(
                            Utils.textList[2],
                            style: Styles.circularStdBold(context,fontSize: 24.sp),
                            maxLine: 2,
                            textAlign: TextAlign.center,
                          ),
                          bodyWidget: AppText(
                            Utils.textSubtitles[2],
                            style: Styles.circularStdMedium(context,fontSize: 16.sp),
                            maxLine: 5,
                          ),
                          image: Image.asset(Utils.imageList[2]),
                          // Replace with your image
                          decoration: pageDecoration(),
                        ),
                      ],
                      onChange: (index) {
                        setState(() {
                          currentPageIndex = index;
                        });
                      },
                      onDone: () {
                        // Handle the "Get Started" button press
                      },
                      done: ElevatedButton(
                        onPressed: () {
                          // Handle the "Done" button press
                        },
                        child: const Text("Get Started"),
                      ),
                      showNextButton: false,
                      showBackButton: false,
                      showSkipButton: false,
                      showBottomPart: false,
                      // onSkip: (){},
                    ),
                    Positioned(
                        bottom: 1.sh / 6,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                              3, (index) => _buildDotIndicator(index)),
                        )),
                    Positioned(
                        bottom: 10.h,
                        left: 10.w,
                        right: 10.w,
                        child: CustomButton(
                          borderRadius: 30,
                          onTap: () {
                            if (currentPageIndex == 0) {
                              introKey.currentState?.animateScroll(1);
                            } else if (currentPageIndex == 1) {
                              introKey.currentState?.animateScroll(2);
                            } else {
                              Navigate.toReplace(context, const LoginScreen());
                            }
                          },
                          text: currentPageIndex == 2 ? "Get Started" : "Next",
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDotIndicator(int index) {
    bool isActive = index == currentPageIndex;

    Color color =
        index == currentPageIndex ? AppColors.primaryColor : Colors.grey;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        width: isActive ? 30.w : 15.w,
        height: 5.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }

  pageDecoration() {
    return PageDecoration(
        titleTextStyle: Styles.circularStdBold(context, fontSize: 24.sp),
        imageFlex: 1,
        imagePadding: EdgeInsets.only(top: 20.h),
        bodyTextStyle: Styles.circularStdMedium(context, fontSize: 16.sp));
  }
}
