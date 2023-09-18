import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:hbk/Data/AppData/app_providers.dart';
import 'package:hbk/Presentation/Widgets/Auth/splash_screen.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/CartScreen/SqDb/cart_db.dart';

import 'Application/Services/NotificationServices/notification_services.dart';
import 'Data/AppData/app_preferences.dart';
import 'Data/DataSource/Resources/imports.dart';

class DownloadCallBack {
  static void downloadCallBackTest(id, status, progress) {
    if (kDebugMode) {
      print(id);
    }
    if (kDebugMode) {
      print(status);
    }
    if (kDebugMode) {
      print(progress);
    }
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize sqflite_ffi

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  //SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  await SharedPrefs.init();
  //CartDatabase.cartDatabaseInstance.getAllCartItems();
  await NotificationServices().initNotification();
  await FlutterDownloader.initialize(
      //debug: true,
      // optional: set to false to disable printing logs to console (default: true)
      ignoreSsl:
          true // option: set to false to disable working with http links (default: false)
      );
  await FlutterDownloader.registerCallback(
      DownloadCallBack.downloadCallBackTest);
  runApp(MultiBlocProvider(providers: appProviders, child: const MyApp()));
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
            title: 'HBK Blanket',
            theme: ThemeData(primaryColor: AppColors.primaryColor),
            //home: const LoginScreen(),
            home: const SplashScreen(),
            debugShowCheckedModeBanner: false,
          );
        });
  }
}
