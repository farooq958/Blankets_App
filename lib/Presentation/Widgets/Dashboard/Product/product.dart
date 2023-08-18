import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hbk/Application/Services/Navigation/navigation.dart';
import 'package:hbk/Data/DataSource/Resources/assets.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Resources/imports.dart';
import 'package:hbk/Data/DataSource/Resources/sized_box.dart';
import 'package:hbk/Data/DataSource/Resources/text_styles.dart';
import 'package:hbk/Data/DataSource/Resources/utils.dart';
import 'package:hbk/Presentation/Common/app_text.dart';
import 'package:hbk/Presentation/Common/custom_appbar_with_back_button.dart';
import 'package:hbk/Presentation/Common/custom_radio_button.dart';
import 'package:hbk/Presentation/Common/custom_textfield_with_on_tap.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/HomeScreen/Components/new_arrival_product_widget.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/Product/Components/filter_bottomsheet_widget.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/Product/Components/product_detail.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/Product/Components/sortBottomSheet.dart';

import 'Components/sort_filter.dart';

class ProductScreen extends StatelessWidget {
  final String? title;
  final bool? isGuest;
   ProductScreen({super.key, this.title,this.isGuest});

 final TextEditingController searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: title!=null?CustomAppBarWithBackButton(title: title,iconData: Icons.arrow_back_ios,iconSize: 15.sp,padding: EdgeInsets.only(left: 5.sp),iconColor: AppColors.primaryColor,) :null,


      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: SingleChildScrollView(
          child: Column(children: [
            ///Search products
          isGuest==true? const SizedBox(height: 0,width: 0,):  CustomTextFieldWithOnTap(
              isShadowRequired: true,

                prefixIcon: SvgPicture.asset(Assets.searchIcon,color: AppColors.greyColor,) ,

                isBorderRequired: false,
                onChanged: (v){
                ///tobe evaluated
                },

                borderRadius:20.sp,
                hintTextColor: AppColors.greyColor,
                controller: searchController, hintText: 'Search products', textInputType: TextInputType.text),
            ///sort and filters
            isGuest==true? const SizedBox(height: 10,width: 10,):const SizedBox(height: 0,width: 0,),
             SortAndFilter(
               onFilterTap:(){
               SortSheet.showBottomSheet(context,const FilterBottomSheetWidget(),'Filters');

            } ,onSortTap: (){

               SortSheet.showBottomSheet(context,SizedBox(
                 height: 260.h,
                 child: Padding(
                   padding: EdgeInsets.symmetric(horizontal: 18.0.sp),
                   child: Column(
                     children: [
                       CustomSizedBox.height(30.sp),
                       Align(
                         alignment: Alignment.centerLeft,
                         child: AppText('Sort By', style: Styles.circularStdBold(context,letterSpacing: 1.1,fontWeight:
                         FontWeight.w600,fontSize: 19.sp),),
                       ),
                       CustomSizedBox.height(10.sp),
                       CustomRadioButtons(getCurrentValue: (s){},buttonList: const ['Most Relevant','Low to high','High to low',
'New arrivals'
],),
                     ],
                   ),
                 ),
               ),'Sort By');

             },),
CustomSizedBox.height(10),
            ///Grid View Products
            ///
            Align(
                alignment: Alignment.centerLeft,
                child: AppText("165 products total", style: Styles.circularStdBold(context,fontWeight: FontWeight.w500))),
            // Expanded(
            //   child: GridView.builder(
            //    // shrinkWrap: true,
            //     physics: const NeverScrollableScrollPhysics(),
            //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 2, // Number of elements per row
            //       mainAxisSpacing: 130.0,
            //       crossAxisSpacing: 8.0,
            //   ), itemBuilder: (context,index){
            //     return NewArrivalProduct(dummyProduct: Utils.dummyProduct[index], onAddToCardTap: () { print("tap $index"); },);
            //
            //   },
            //     itemCount: Utils.dummyProduct.length,
            //
            //   ),
            // ),


            Wrap(
              direction: Axis.horizontal,
              spacing: 12,

              runSpacing: 12,

              alignment: WrapAlignment.start,

              children: [

                for(var i in Utils.dummyProduct)

                  NewArrivalProduct(dummyProduct: i, onAddToCardTap: () { print("tap $i");
                    if(isGuest == true){
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
                            title: "1 product added to cart", message: "1 product in your cart 890,230", assetImage: Assets.orderConfirm, button1Tap: (){}, button2Tap: (){});
                      }
                    },onDetailTap: (){

Navigate.to(context,  ProductDetails(pd: i,isGuest:isGuest));

                  },
                  isGuest:isGuest
                  )




              ],),
            //CustomSizedBox.height(100)
            ],),
        ),
      ) ,

    );
  }
}
