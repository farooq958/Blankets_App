import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hbk/Application/Services/Navigation/navigation.dart';
import 'package:hbk/Data/AppData/app_preferences.dart';
import 'package:hbk/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:hbk/Data/DataSource/Resources/assets.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Resources/sized_box.dart';
import 'package:hbk/Data/DataSource/Resources/text_styles.dart';
import 'package:hbk/Data/DataSource/Resources/utils.dart';
import 'package:hbk/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/BottomNavigationScreen/Component/drawer_row.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/CartScreen/Controller/cart_cubit.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/CartScreen/SqDb/cart_db.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/PriceListScreen/price_list_screen.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/SearchScreen/Controller/all_products_cubit.dart';

import 'app_text.dart';
import 'image_widgets.dart';

class AppDrawer extends StatelessWidget {
  final bool? isGuest;
final  GlobalKey<ScaffoldState>? drawerKey;
  const AppDrawer({super.key, required this.isGuest,  this.drawerKey});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.primaryColor,
      width: 1.sw / 1.35,
      child: Column(

        children: [
          Expanded(
            child: ListView(
              physics:  const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              children: [
              isGuest==true?  30.y :CustomSizedBox.height(35.sp),
                isGuest == false
                    ? SizedBox(
                        height: 124.sp,
                        width: 1.sw / 1.35,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // AssetImageWidget(
                            //     isCircle: true,
                            //     height: 30,
                            //     width: 20,
                            //     radius: 40.sp,
                            //     url: 'assets/images/person.png'),
                            // CustomSizedBox.width(15),

                            Expanded(
                              flex:2,
                              child: Align(
                                  alignment: Alignment.center,
                                  child: AppText(SharedPrefs.userData!.cardName.toString(),
                                      maxLine: 2,
                                      style: Styles.circularStdBold(
                                          context,

                                          color: AppColors.whiteColor,
                                          fontSize: 20.sp,
                                          fontWeight:
                                              FontWeight.w600))),
                            ),
                            Expanded(
                                child: AppText(SharedPrefs.userData!.phone1.toString(),
                                    style: Styles.circularStdRegular(
                                        context,
                                        color: AppColors.whiteColor,
                                        fontSize: 12.sp))),
                            Expanded(
                                child: AppText(SharedPrefs.userData!.address.toString(),
                                    maxLine: 3,
                                    style: Styles.circularStdRegular(
                                        context,
                                        color: AppColors.whiteColor,
                                        fontSize: 12.sp))),
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
                    : SizedBox(
                  height: 1.sh,
                      child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                        //  shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return DrawerRow(
                              screenName: Utils.drawerData[index].screenName,
                              iconPath: Utils.drawerData[index].iconPath,
                              onTap: () async {
if(Utils.drawerData[index].screenName=='Price list'){
  context.read<AllProductsCubit>().getAllProducts(catId: 'all',isGuest: false);
 await Future.delayed(const Duration(milliseconds: 30));

  Navigate.to(context,
      Utils.drawerData[index].widgetToNavigate!);
}
else if( Utils.drawerData[index].screenName=='Logout')
  {
    drawerKey?.currentState?.closeDrawer();
    LoadingDialog.showLoadingDialog(context);

    await Future.delayed(const Duration(seconds: 3));

    SharedPrefs.clearPref();
 await  CartDatabase.cartDatabaseInstance.clearCart();
await drawerKey!.currentState!.context.read<CartCubit>().getAllCartItems();
    Navigate.toReplaceAll(drawerKey!.currentState!.context,
        Utils.drawerData[index].widgetToNavigate!);
  }
else
  {
                                Navigate.to(context,
                                    Utils.drawerData[index].widgetToNavigate!);}
                              },
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 25.sp,
                            );
                          },
                          itemCount: Utils.drawerData.length),
                    )
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
