import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hbk/Data/DataSource/Resources/assets.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Resources/text_styles.dart';
import 'package:hbk/Presentation/Common/app_buttons.dart';
import 'package:hbk/Presentation/Common/circle_icon_button.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/BottomNavigationScreen/Controller/BottomNavigationNotifier/bottom_navigation_notifier.dart';

import 'app_text.dart';
import 'image_widgets.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String? title;
  bool isHome;
  bool? isShowNotificationButton;
  final VoidCallback? onBackTap;
  final PageController? pageController;

  CustomAppBar(
      {key,
      this.title,
      this.isHome = false,
      this.isShowNotificationButton,
      this.onBackTap,
      this.pageController})
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
      elevation: 8,
      shadowColor: Colors.black12,
      backgroundColor: AppColors.whiteColor,
      automaticallyImplyLeading: false,
      centerTitle: true,
      leading: GestureDetector(
        onTap: widget.onBackTap,
        behavior: HitTestBehavior.opaque,
        child: Center(
          child: Icon(
            Icons.menu,
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
                      ? "Customer dashboard"
                      : widget.title ?? "",
              style: Styles.circularStdBold(context,
                  fontSize: 19.sp, fontWeight: FontWeight.w500),
            ),
          );
        },
        valueListenable: BottomNotifier.bottomNavigationNotifier,
      ),
      actions: [
        widget.isHome
            ? SvgPicture.asset(
                Assets.searchIcon,
                height: 20.h,
                width: 20.w,
              )
            : const SizedBox(),
        SizedBox(
          width: 10.sp,
        ),
        widget.isHome
            ? SvgPicture.asset(
                Assets.notificationIcon,
                height: 20.h,
                width: 20.w,
              )
            : const SizedBox(),
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
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(20)),
                          width: 120.w,
                          height: 40.h,
                          child: Row(
                            children: [
                              const Icon(
                                Icons.add,
                                color: AppColors.whiteColor,
                              ),
                              AppText(
                                'Add items',
                                style: Styles.circularStdMedium(context,
                                    color: AppColors.whiteColor),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  : const SizedBox();
            })
      ],
    );
  }
}
