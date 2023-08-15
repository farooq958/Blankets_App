
import 'package:hbk/Data/DataSource/Resources/imports.dart';



class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBar(
        title: "Notifications",
        isNotificationScreen: true,isShowNotificationButton: true,),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 5,
          itemBuilder: (context,index){
        return const NotificationTile();
      }),
    );
  }
}
