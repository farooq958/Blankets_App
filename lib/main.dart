
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:hbk/Data/AppData/app_providers.dart';
import 'package:hbk/Presentation/Widgets/Auth/splash_screen.dart';

import 'Application/Services/NotificationServices/notification_services.dart';
import 'Data/DataSource/Resources/imports.dart';
class DownloadCallBack{

  static void downloadCallBackTest (id, status, progress) {

    print(id);
    print(status);
    print(progress);

  }

}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await NotificationServices().initNotification();
  await FlutterDownloader.initialize(
      debug: true,
      // optional: set to false to disable printing logs to console (default: true)
      ignoreSsl:
      true // option: set to false to disable working with http links (default: false)
  );
  await FlutterDownloader.registerCallback(DownloadCallBack.downloadCallBackTest);
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
          return
          MultiBlocProvider(providers: appProviders, child:  MaterialApp(
            title: 'HBK Blanket',
            theme: ThemeData(
                primaryColor: AppColors.primaryColor
            ),
            //home: const LoginScreen(),
            home: const SplashScreen(),
            debugShowCheckedModeBanner: false,
          ));


        });
  }
}
