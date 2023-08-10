import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Resources/strings.dart';
import 'package:hbk/Data/DataSource/Resources/text_styles.dart';
import 'package:hbk/Presentation/Common/app_text.dart';
import 'package:hbk/Presentation/Common/circle_icon_button.dart';
import 'package:hbk/Presentation/Common/custom_app_bar.dart';
import 'package:hbk/Presentation/Widgets/Notifications/Comonents/notification_tile.dart';

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
