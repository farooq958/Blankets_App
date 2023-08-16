
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
import 'package:hbk/Presentation/Widgets/Auth/splash_screen.dart';

import 'Data/DataSource/Resources/imports.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'HBK BLANKET',
            theme: ThemeData(
              primaryColor: AppColors.primaryColor
            ),
            //home: const LoginScreen(),
            home: const SplashScreen(),
            debugShowCheckedModeBanner: false,
          );
        });
  }
}
