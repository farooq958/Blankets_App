import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hbk/Application/Services/Navigation/navigation.dart';
import 'package:hbk/Data/DataSource/Resources/assets.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Resources/text_styles.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/BottomNavigationScreen/Controller/BottomNavigationNotifier/bottom_navigation_notifier.dart';
import 'package:hbk/Presentation/Widgets/Notifications/notification_screen.dart';

import 'app_text.dart';
import 'circle_icon_button.dart';
import 'image_widgets.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String? title;
  bool isHome;
  bool? isShowNotificationButton;
  final VoidCallback? onBackTap;
  final PageController? pageController;
  final bool? isNotificationScreen;
  final bool? isSplashScreen;
  final int? splashPageNumber;
  final VoidCallback? onSkipTap;
  final VoidCallback? onNotificationTap;

  CustomAppBar(
      {key,
      this.title,
      this.isHome = false,
      this.isShowNotificationButton,
      this.onBackTap,
      this.pageController,  this.isNotificationScreen, this.isSplashScreen, this.splashPageNumber, this.onSkipTap, this.onNotificationTap})
      : preferredSize = const Size.fromHeight(65),
        super(key: key);
  @override
  final Size preferredSize;

  @override
  CustomAppBarState createState() => CustomAppBarState();
}

class CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      //shadowColor: Colors.black12,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      centerTitle: true,
      leading: widget.isSplashScreen !=null?SizedBox(height: 0.sp,width: 0.sp,) :widget.isNotificationScreen !=null?SizedBox(height: 0.sp,width: 0.sp,) : GestureDetector(
        onTap: widget.onBackTap,
        behavior: HitTestBehavior.opaque,
        child: Center(
          child: Icon(

            Icons.menu,
            color: Colors.black,
            size: 25.r,
          ),
        ),
      ),
      title: ValueListenableBuilder(
        builder: (context, state, child) {
          return Padding(
            padding: const EdgeInsets.only(top: 5).r,
            child: AppText(

              state == 3
                  ? "Cart"
                  : state == 1
                      ? "Customer dashboard" :
              state == 2?' All Products'
                      : widget.title ?? "",
              style: Styles.circularStdBold(context,
                  fontSize: 19.sp, fontWeight: FontWeight.w500),
            ),
          );
        },
        valueListenable: BottomNotifier.bottomNavigationNotifier,
      ),

      actions: [
        widget.isSplashScreen !=null?
        widget.splashPageNumber == 2
        ? const SizedBox()
        : TextButton(
    onPressed: widget.onSkipTap,
    child: AppText(
    'Skip',
    style: Styles.circularStdMedium(context,
    color: AppColors.greyColor),
    ),
    )  :  widget.isNotificationScreen != null?      Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Align(
            child: CircleIconButton(
                icon: Icons.close, onPressed: () {
              Navigator.pop(context);
            }),
          ))  :  Row(
          children: <Widget>[
            ValueListenableBuilder(
              builder: (context,state,child) {
                return Row(
                  children: <Widget>[
                    widget.isShowNotificationButton!=null || state>0? const SizedBox(height: 0,width: 0,): GestureDetector(


                        onTap:widget.onNotificationTap ?? (){},
                        child: SvgPicture.asset(Assets.searchIcon,height: 20.h,width: 20.w,)),
                    SizedBox(width: 20.sp,),
                    widget.isShowNotificationButton!=null || state >0? const SizedBox(height: 0,width: 0,):    GestureDetector(
                onTap:(){


                Navigate.to(context, const NotificationScreen());
                },
                        child: SvgPicture.asset(Assets.notificationIcon,height: 20.h,width: 20.w,)),
                    SizedBox(width: 20.sp,),
                  ],
                );
              }, valueListenable: BottomNotifier.bottomNavigationNotifier,
            ),
            SizedBox(
              width: 20.sp,
            ),
            ValueListenableBuilder(
                valueListenable: BottomNotifier.bottomNavigationNotifier,
                builder: (context, state, child) {
                  return state == 3
                      ? GestureDetector(
                    onTap: () {
                      widget.pageController!.jumpToPage(0);
                    },
                    child: Container(
                      alignment: Alignment.center,

                      margin: EdgeInsets.only(right: 10.w),
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(20)),
                      width: 100.w,
                      height: 40.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           Icon(
                            Icons.add,
                            color: AppColors.whiteColor,
                            size: 15.r,
                          ),
                          AppText(
                            'Add items',
                            style: Styles.circularStdMedium(context,
                                color: AppColors.whiteColor,fontSize: 12.sp),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  )
                      : const SizedBox();
                })

          ],
        ),

      ],
    );
  }
}
