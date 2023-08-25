import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hbk/Application/Services/Connectivity/connectivity_service.dart';
import 'package:hbk/Application/Services/Navigation/navigation.dart';
import 'package:hbk/Data/DataSource/Resources/assets.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Resources/imports.dart';
import 'package:hbk/Data/DataSource/Resources/text_styles.dart';
import 'package:hbk/Presentation/Common/Dialogs/custom_login_dialog.dart';
import 'package:hbk/Presentation/Common/app_drawer.dart';
import 'package:hbk/Presentation/Common/app_text.dart';
import 'package:hbk/Presentation/Common/custom_app_bar.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/BottomNavigationScreen/Controller/BottomNavigationNotifier/bottom_navigation_notifier.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/CartScreen/cart_screen.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/DashboardBottomScreen/dashboard_screen.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/HomeScreen/home_screen.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/Product/product.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/ProfileScreen/profile_screen.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/SearchScreen/search_screen.dart';
import 'package:hbk/Presentation/Widgets/Notifications/notification_screen.dart';
import 'package:hbk/Presentation/Widgets/no_internet_connection.dart';

class BottomNavigationScreen extends StatefulWidget {
  final bool? isGuest;

  const BottomNavigationScreen({super.key,this.isGuest});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  PageController pageController = PageController(initialPage: 0);
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
   init();
    BottomNotifier.bottomNavigationNotifier.value=0;
    super.initState();
  }

  init() {
    AppConnectivity.connectionChanged(onDisconnected: (){
      Navigate.to(context, const NoInternetConnectionScreen());
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      key: scaffoldKey,
      appBar: CustomAppBar(
pageController: pageController,
        onSearchTap: (){

  Navigate.to(context,  SearchScreen(isGuest: widget.isGuest,));

        },
        onNotificationTap: (){
  if(widget.isGuest==true){
    showLoginDialog(context);
  }else{
    Navigate.to(context, const NotificationScreen());
  }
        },
        onBackTap: (){
        scaffoldKey.currentState!.openDrawer();

      },),
      drawer:   AppDrawer(isGuest:widget.isGuest!),
body: SizedBox(
  height: 1.sh,
  width: 1.sw,
  child: PageView(
    controller: pageController,
physics: widget.isGuest ==true? const NeverScrollableScrollPhysics(): const ClampingScrollPhysics() ,
onPageChanged: (x)
    {
      BottomNotifier.bottomNavigationNotifier.value=x;



    },
    children:  [
 HomeScreen(pageController:pageController,isGuest:widget.isGuest),
      const DashboardBottom(),
       ProductScreen(isGuest: widget.isGuest,pageController:pageController),
       CartScreen(pageController: pageController,isGuest:widget.isGuest),
      ProfileScreen(isGuest: widget.isGuest!,)


    ],

  ),


),
      bottomNavigationBar: ValueListenableBuilder(
        builder: (context,state,child) {
          return Container(
            width: 375.0,
            height: 84.0.sp,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  offset: const Offset(0, 0),
                  blurRadius: 10.0,
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      BottomNotifier.bottomNavigationNotifier.value=0;
                      pageController.jumpToPage(0);
                    },
                    child: Column(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: SvgPicture.asset(
                              Assets.homeIcon,
                              color: state == 0
                                  ? AppColors.primaryColor
                                  : const Color(0xffA7A7A7),

                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.sp,
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: AppText(
                                'Home',
                                style: Styles.circularStdRegular(
                                  context,
                                  fontSize: 13.0.sp,
                                  color: state == 0
                                      ?  AppColors.primaryColor
                                      : const Color(0xffA7A7A7),
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
///1
                Expanded(
                  child: InkWell(
                    onTap: () {
                      if(widget.isGuest == true){
                        showLoginDialog(context);
                      }
                      else{
                        BottomNotifier.bottomNavigationNotifier.value=1;
                        pageController.jumpToPage(1);
                      }
                    },
                    child: Column(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: SvgPicture.asset(
                              Assets.dashboardBottomIcon,
                              color: state == 1
                                  ? AppColors.primaryColor
                                  : const Color(0xffA7A7A7),

                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.sp,
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: AppText(
                                'Dashboard',
                                style: Styles.circularStdRegular(
                                  context,
                                  fontSize: 13.0.sp,
                                  color: state == 1
                                      ?  AppColors.primaryColor
                                      : const Color(0xffA7A7A7),
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
///2
                Expanded(
                  child: InkWell(
                    onTap: () {
                      BottomNotifier.bottomNavigationNotifier.value=2;
                      pageController.jumpToPage(2);
                    },
                    child: Column(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: SvgPicture.asset(
                              Assets.productIcon,
                              color: state == 2
                                  ? AppColors.primaryColor
                                  : null,

                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.sp,
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: AppText(
                                'Products',
                                style: Styles.circularStdRegular(
                                  context,
                                  fontSize: 13.0.sp,
                                  color: state == 2
                                      ?  AppColors.primaryColor
                                      : const Color(0xffA7A7A7),
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
///3
                Expanded(
                  child: InkWell(
                    onTap: () {
                      if(widget.isGuest == true){
                        showLoginDialog(context);
                      }
                      else{
                        BottomNotifier.bottomNavigationNotifier.value=3;
                        pageController.jumpToPage(3);
                      }
                    },
                    child: Column(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: SvgPicture.asset(
                              Assets.cartIcon,
                              color: state == 3
                                  ? AppColors.primaryColor
                                  : const Color(0xffA7A7A7),

                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.sp,
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: AppText(
                                'Cart',
                                style: Styles.circularStdRegular(
                                  context,
                                  fontSize: 13.0.sp,
                                  color: state == 3
                                      ?  AppColors.primaryColor
                                      : const Color(0xffA7A7A7),
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                ///4
                Expanded(
                  child: InkWell(
                    onTap: () {
                      BottomNotifier.bottomNavigationNotifier.value=4;
                      pageController.jumpToPage(4);
                    },
                    child: Column(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: SvgPicture.asset(
                              Assets.profileIcon,
                              color: state == 4
                                  ? AppColors.primaryColor
                                  : const Color(0xffA7A7A7),

                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.sp,
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: AppText(
                                'Profile',
                                style: Styles.circularStdRegular(
                                  context,
                                  fontSize: 13.0.sp,
                                  color: state == 4
                                      ?  AppColors.primaryColor
                                      : const Color(0xffA7A7A7),
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }, valueListenable: BottomNotifier.bottomNavigationNotifier,
      )



    );
  }
}
