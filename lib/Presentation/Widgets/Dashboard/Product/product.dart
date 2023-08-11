import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hbk/Application/Services/Navigation/navigation.dart';
import 'package:hbk/Data/DataSource/Resources/assets.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
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
   ProductScreen({super.key, this.title});

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
            CustomTextFieldWithOnTap(
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
                         child: AppText('Sort By', style: Styles.circularStdRegular(context,letterSpacing: 1.1,fontWeight:
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


            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children:[Align(
                alignment: Alignment.centerLeft,
                child: Wrap(
                  direction: Axis.horizontal,
                  spacing: 2,

                  runSpacing: 10,

                  alignment: WrapAlignment.start,

                  children: [

                    for(var i in Utils.dummyProduct)

                      NewArrivalProduct(dummyProduct: i, onAddToCardTap: () { print("tap $i"); },onDetailTap: (){

Navigate.to(context,  ProductDetails(pd: i,));

                      },)




                  ],),
              )] ,
            ),
            //CustomSizedBox.height(100)
            ],),
        ),
      ) ,

    );
  }
}
