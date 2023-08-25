import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'Controller/category_cubit.dart';

class HomeScreen extends StatefulWidget {
  final bool? isGuest;
  final PageController? pageController;

  //GlobalKey<ScaffoldState> scaffoldKey;
  const HomeScreen({super.key, this.pageController, required this.isGuest});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  widget.isGuest==true? const SizedBox(height: 0,width: 0,): CustomSizedBox.height(5),

                  ///Top Row
               widget.isGuest==true? const SizedBox(height: 0,width: 0,):   Row(
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
                  widget.isGuest==true? const SizedBox(height: 0,width: 0,): CustomSizedBox.height(10),

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
                  CategoryProduct(pageController: widget.pageController,  isGuest: widget.isGuest,),

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
                          widget.isGuest==true?const SizedBox(height: 0,width: 0,) :GestureDetector(

                            onTap: (){
                              widget.pageController?.jumpToPage(2);
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
                      height:  widget.isGuest==true? 195.h:250.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return NewArrivalProduct(
                            onDetailTap: (){

                              Navigate.to(context, ProductDetails(isGuest: widget.isGuest,));
                            },
                            isGuest: widget.isGuest,
                            dummyProduct: Utils.dummyProduct[index],
                            onAddToCardTap: () {
                              if (widget.isGuest == true) {
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
                              else
                                {
                                  CustomDialog.successConfirmDialog(context,
                                      button1Text: "Explore",
                                      button2Text: "Cart",
                                      width: 1.sw,
                                      button2LeadingImageIcon: true,
                                      button2LeadingIcon: Assets.bagIcon,
                                      title: "1 product added to cart", message: "1 product in your cart 890,230", assetImage: Assets.orderConfirm,
                                      button1Tap: (){


                                        Navigate.pop(context);

                                      }, button2Tap: (){
                                        Navigate.pop(context);

                                        widget.pageController?.jumpToPage(3);

                                      });
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
                  widget.isGuest==true? SizedBox(height: 0.sp,width: 0.sp,): Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          AppText(
                            AppStrings.mostSoldProduct,
                            style: Styles.circularStdBold(context,
                                fontWeight: FontWeight.w500, fontSize: 20.sp),
                          ),
                          const Spacer(),
                          widget.isGuest==true?const SizedBox(height: 0,width: 0,) :  GestureDetector(
                            onTap: (){

                              widget.pageController?.jumpToPage(2);
                            },
                            child: AppText(
                              'See all',
                              style: Styles.circularStdRegular(context,
                                  fontWeight: FontWeight.w500, fontSize: 14.sp),
                            ),
                          ),
                        ],
                      )),
                  widget.isGuest==true? SizedBox(height: 0.sp,width: 0.sp,):   SizedBox(
                      width: 1.sw,
                      height:  widget.isGuest==true? 195.h:250.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return NewArrivalProduct(
                            isGuest: widget.isGuest,
                            onDetailTap: (){

                              Navigate.to(context, ProductScreen(title: "",isGuest: widget.isGuest,));
                            },
                            dummyProduct: Utils.dummyProduct[index],
                            onAddToCardTap: () {
                              if (widget.isGuest == true) {
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
                              else
                                {
                                  CustomDialog.successConfirmDialog(context,
                                      button1Text: "Explore",
                                      button2Text: "Cart",
                                      width: 1.sw,
                                      button2LeadingImageIcon: true,
                                      button2LeadingIcon: Assets.bagIcon,
                                      title: "1 product added to cart", message: "1 product in your cart 890,230", assetImage: Assets.orderConfirm,   button1Tap: (){


                                        Navigate.pop(context);

                                      }, button2Tap: (){
                                        Navigate.pop(context);

                                        widget.pageController?.jumpToPage(3);

                                      });
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
