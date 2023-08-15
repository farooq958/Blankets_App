
import 'package:hbk/Application/Services/Connectivity/connectivity_service.dart';
import 'package:hbk/Data/DataSource/Resources/imports.dart';

import 'package:hbk/Presentation/Widgets/Dashboard/BottomNavigationScreen/bottom_navigation_screen.dart';

class NoInternetConnectionScreen extends StatefulWidget {
  const NoInternetConnectionScreen({Key? key}) : super(key: key);

  @override
  State<NoInternetConnectionScreen> createState() => _NoInternetConnectionScreenState();
}

class _NoInternetConnectionScreenState extends State<NoInternetConnectionScreen> {

  @override
  void initState() {
    // TODO: implement initState
    checkConnectivity();
    super.initState();
  }
  checkConnectivity(){
    if(Navigator.canPop(context)){
      AppConnectivity.connectionChanged(onConnected: (){
        if(mounted){
          Navigator.of(context).pop(true);
        }
      });
    }else{
      AppConnectivity.connectionChanged(onConnected: () {
        Navigate.toReplaceAll(context,  const BottomNavigationScreen());
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(Assets.noInternetConnection),
            CustomSizedBox.height(10.h),
            AppText(AppStrings.noInternetConnection,
                style: Styles.circularStdBold(context)),
            CustomSizedBox.height(10.h),
            AppText('Connect to internet and try again.',
                style: Styles.circularStdMedium(context,color: Colors.grey)),
            CustomSizedBox.height(30.h),
            CustomButton(
              horizontalMargin: 50.w,
              onTap: (){
                WidgetFunctions.instance.toast(context, successSnackBar(
                    text: 'Please check your internet Connection',
                    context: context,
                    bgColor: AppColors.primaryColor));
              }, text: 'Retry',)
          ],
        ),
      ),
    );
  }
}
