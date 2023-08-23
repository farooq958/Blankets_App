


import 'package:hbk/Data/AppData/data.dart';
import 'package:hbk/Data/DataSource/Resources/imports.dart';
import 'package:hbk/Presentation/Widgets/Auth/on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState


    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      // systemNavigationBarColor: AppColors.primaryColor,
    ));
   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
     Future.delayed(const Duration(seconds: 2), () {
       Navigate.toReplace(context,  const OnboardingScreen());
     });
   });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    AppMedia.mediaQuery= MediaQuery.of(context);

print("Text Scale  ${    Data().textScale}") ;

    return  Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: AssetImageWidget(url: Assets.appLogo,width: 150.w,height: 150.h,),
      ),
    );
  }
}
