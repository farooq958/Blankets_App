import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hbk/Application/Services/Navigation/navigation.dart';
import 'package:hbk/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:hbk/Data/DataSource/Resources/assets.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Resources/sized_box.dart';
import 'package:hbk/Data/DataSource/Resources/text_styles.dart';
import 'package:hbk/Data/DataSource/Resources/utils.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/BottomNavigationScreen/Component/drawer_row.dart';

import 'app_text.dart';
import 'image_widgets.dart';

class AppDrawer extends StatelessWidget {
  final bool? isGuest;

  const AppDrawer({super.key, required this.isGuest});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.primaryColor,
      width: 1.sw / 1.35,
      child: Column(

        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              children: [
              isGuest==true?  30.y :CustomSizedBox.height(35.sp),
                isGuest == false
                    ? SizedBox(
                        height: 100.sp,
                        width: 1.sw / 1.35,
                        child: Row(
                          children: [
                            AssetImageWidget(
                                isCircle: true,
                                height: 30,
                                width: 20,
                                radius: 40.sp,
                                url: 'assets/images/person.png'),
                            CustomSizedBox.width(15),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                      child: Align(
                                          alignment: Alignment.bottomLeft,
                                          child: AppText("Aqib Javed",
                                              style: Styles.circularStdBold(
                                                  context,
                                                  color: AppColors.whiteColor,
                                                  fontSize: 20.sp,
                                                  fontWeight:
                                                      FontWeight.w600)))),
                                  SizedBox(
                                    height: 5.sp,
                                  ),
                                  Expanded(
                                      child: AppText("example@gmail.com",
                                          style: Styles.circularStdRegular(
                                              context,
                                              color: AppColors.whiteColor,
                                              fontSize: 12.sp))),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : UnconstrainedBox(alignment: Alignment.topLeft,
                      child: AssetImageWidget(
                          url: Assets.appLogo,
                          height: 150.h,
                          width: 147.w,
                        ),
                    ),

              CustomSizedBox.height(   1.sp),
                isGuest == true
                    ? ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return DrawerRow(
                            screenName: Utils.drawerGuestData[index].screenName,
                            iconPath: Utils.drawerGuestData[index].iconPath,
                            onTap: () {
                              Navigate.to(context, Utils.drawerGuestData[index].widgetToNavigate!);
                            },
                          );
                        },
                        separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 25.sp,
                    );
                        },
                        itemCount: Utils.drawerGuestData.length)
                    : ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return DrawerRow(
                            screenName: Utils.drawerData[index].screenName,
                            iconPath: Utils.drawerData[index].iconPath,
                            onTap: () {
                              Navigate.to(context,
                                  Utils.drawerData[index].widgetToNavigate!);
                            },
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 25.sp,
                          );
                        },
                        itemCount: Utils.drawerData.length)
              ],
            ),
          ),
          AppText("Version 2.0.0",
              style: Styles.circularStdBold(context,
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.w300,
                  fontSize: 12.sp)),
          SizedBox(
            height: 10.sp,
          )
        ],
      ),
    );
  }
}
