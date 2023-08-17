import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hbk/Application/Services/Navigation/navigation.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Resources/imports.dart';
import 'package:hbk/Data/DataSource/Resources/sized_box.dart';
import 'package:hbk/Data/DataSource/Resources/strings.dart';
import 'package:hbk/Data/DataSource/Resources/text_styles.dart';
import 'package:hbk/Data/DataSource/Resources/utils.dart';
import 'package:hbk/Presentation/Common/app_text.dart';
import 'package:hbk/Presentation/Widgets/Auth/Login/login_screen.dart';

import 'package:hbk/Presentation/Widgets/Dashboard/HomeScreen/Components/category_product.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/HomeScreen/Components/new_arrival_product_widget.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/Product/Components/product_detail.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/Product/product.dart';

import 'Components/home_carousel.dart';

class HomeScreen extends StatelessWidget {
  final bool? isGuest;
  final PageController? pageController;

  //GlobalKey<ScaffoldState> scaffoldKey;
  const HomeScreen({super.key, this.pageController, required this.isGuest});

  @override
  Widget build(BuildContext context) {
    return  Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomSizedBox.height(10),

                  ///Top Row
               isGuest==true? const SizedBox(height: 0,width: 0,):   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      AppText(
                        AppStrings.accountBalance,
                        style: Styles.circularStdBold(context,
                            fontWeight: FontWeight.w500, fontSize: 16.sp),
                      ),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: 'Rs ',
                            style: Styles.circularStdBold(context,
                                fontSize: 16.sp)),
                        TextSpan(
                            text: '50,490 ',
                            style: Styles.circularStdBold(context,
                                fontWeight: FontWeight.w900, fontSize: 20.sp)),
                      ]))
                    ],
                  ),
                  CustomSizedBox.height(20),

                  ///Home Coruosel sliding Images
                  const HomeCarousel(),
                  CustomSizedBox.height(5),

                  ///Category Product
                  Align(
                      alignment: Alignment.centerLeft,
                      child: AppText(
                        AppStrings.category,
                        style: Styles.circularStdBold(context,
                            fontWeight: FontWeight.w500, fontSize: 20.sp),
                      )),
                  CustomSizedBox.height(20),
                  CategoryProduct(pageController: pageController,  isGuest: isGuest,),

                  ///New Arrival

                  Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          AppText(
                            AppStrings.newArrival,
                            style: Styles.circularStdBold(context,
                                fontWeight: FontWeight.w500, fontSize: 20.sp),
                          ),
                          const Spacer(),
                          isGuest==true?const SizedBox(height: 0,width: 0,) :GestureDetector(

                            onTap: (){
                              pageController?.jumpToPage(2);
                            },
                            child: AppText(
                             'See all',
                              style: Styles.circularStdRegular(context,
                                  fontWeight: FontWeight.w500, fontSize: 14.sp),
                            ),
                          ),

                        ],
                      )),

                  ///to be continued ...
                  SizedBox(
                      width: 1.sw,
                      height:  isGuest==true? 195.h:260.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return NewArrivalProduct(
                            onDetailTap: (){

                              Navigate.to(context, ProductDetails(isGuest: isGuest,));
                            },
                            isGuest: isGuest,
                            dummyProduct: Utils.dummyProduct[index],
                            onAddToCardTap: () {
                              if (isGuest == true) {
                                CustomDialog.dialog(
                                    context,
                                    SizedBox(
                                        width: 1.sw,
                                        height: 200.h,
                                        child: Center(
                                          child: Column(
                                            // crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                Assets.logout,
                                                width: 50.w,
                                                height: 50.h,
                                              ),
                                              AppText('Please login first',
                                                  style: Styles.circularStdBold(
                                                      context,
                                                      fontSize: 22.sp)),
                                              AppText('Please login first',
                                                  style: Styles.circularStdBold(
                                                      context,
                                                      fontSize: 16.sp)),
                                              CustomSizedBox.height(10.h),
                                              CustomButton(
                                                onTap: () {
                                                  Navigator.of(context)
                                                      .pop(true);
                                                },
                                                text: 'Login',
                                                width: 1.sw,
                                                horizontalMargin: 20.w,
                                              ),
                                            ],
                                          ),
                                        )));
                              }
                            },
                          );
                        },
                        separatorBuilder: (context, index) {
                          return CustomSizedBox.width(15);
                        },
                        itemCount: Utils.dummyProduct.length,
                      )),
                  CustomSizedBox.height(10),

                  ///Most Sold Product replace the product dummy list with actual list of most sold product
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          AppText(
                            AppStrings.mostSoldProduct,
                            style: Styles.circularStdBold(context,
                                fontWeight: FontWeight.w500, fontSize: 20.sp),
                          ),
                          const Spacer(),
                          isGuest==true?const SizedBox(height: 0,width: 0,) :  GestureDetector(
                            onTap: (){

                              pageController?.jumpToPage(2);
                            },
                            child: AppText(
                              'See all',
                              style: Styles.circularStdRegular(context,
                                  fontWeight: FontWeight.w500, fontSize: 14.sp),
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                      width: 1.sw,
                      height:  isGuest==true? 195.h:250.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return NewArrivalProduct(
                            isGuest: isGuest,
                            onDetailTap: (){

                              Navigate.to(context, ProductScreen(title: "",isGuest: isGuest,));
                            },
                            dummyProduct: Utils.dummyProduct[index],
                            onAddToCardTap: () {
                              if (isGuest == true) {
                                CustomDialog.dialog(
                                    context,
                                    SizedBox(
                                        width: 1.sw,
                                        height: 250.h,
                                        child: Center(
                                          child: Column(
                                            // crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                Assets.logout,
                                                width: 50.w,
                                                height: 50.h,
                                              ),
                                              CustomSizedBox.height(10.h),
                                              AppText('Please login first',
                                                  style: Styles.circularStdBold(
                                                      context,
                                                      fontSize: 22.sp)),
                                              CustomSizedBox.height(10.h),
                                              AppText('Please login first',
                                                  style: Styles.circularStdBold(
                                                      context,
                                                      fontSize: 16.sp)),
                                              CustomSizedBox.height(10.h),

                                              CustomButton(
                                                onTap: () {
                                                  Navigator.of(context).pop(true);
                                                  Navigate.to(context, const LoginScreen());
                                                },
                                                text: 'Login',
                                                width: 1.sw,
                                                horizontalMargin: 20.w,
                                              ),

                                            ],

                                          ),
                                        )));
                              }
                            },
                          );
                        },
                        separatorBuilder: (context, index) {
                          return CustomSizedBox.width(15);
                        },
                        itemCount: Utils.dummyProduct.length,
                      )),
                  CustomSizedBox.height(5),
                ],
              ),
            ));
  }
}
