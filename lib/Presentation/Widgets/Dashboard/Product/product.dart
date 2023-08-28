import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hbk/Application/Services/Navigation/navigation.dart';
import 'package:hbk/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:hbk/Data/DataSource/Resources/assets.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Resources/imports.dart';
import 'package:hbk/Data/DataSource/Resources/sized_box.dart';
import 'package:hbk/Data/DataSource/Resources/text_styles.dart';
import 'package:hbk/Data/DataSource/Resources/utils.dart';
import 'package:hbk/Domain/Models/HomeScreen/product_model.dart';
import 'package:hbk/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:hbk/Presentation/Common/app_text.dart';
import 'package:hbk/Presentation/Common/custom_appbar_with_back_button.dart';
import 'package:hbk/Presentation/Common/custom_radio_button.dart';
import 'package:hbk/Presentation/Common/custom_textfield_with_on_tap.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/HomeScreen/Components/new_arrival_product_widget.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/Product/Components/filter_bottomsheet_widget.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/Product/Components/product_detail.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/Product/Components/sortBottomSheet.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/SearchScreen/Controller/all_products_cubit.dart';

import 'Components/sort_filter.dart';

class ProductScreen extends StatefulWidget {
  final String? title;
  final bool? isGuest;
  final PageController? pageController;
   ProductScreen({super.key, this.title,this.isGuest,  this.pageController});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
 final TextEditingController searchController=TextEditingController();
 List<ProductApiModel> tempSearchData=[];
 bool? tempSearchChange;
@override
  void initState() {
    // TODO: implement initState

  context.read<AllProductsCubit>().getAllProducts();

  super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.title!=null?
      CustomAppBarWithBackButton(title: widget.title,iconData: Icons.arrow_back_ios,iconSize: 15.sp,padding:
      EdgeInsets.only(left: 5.sp),iconColor: AppColors.primaryColor,) :null,


      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: BlocConsumer<AllProductsCubit, AllProductsState>(
          listener: (context, state) {
// TODO: implement listener
          },
          builder: (context, state) {
            String productLength=state is AllProductsLoaded?state.allProductsData.length.toString():'0';
            tempSearchData = state is AllProductsLoaded && tempSearchChange==null? state.allProductsData:tempSearchChange==true? tempSearchData: [];
            print(tempSearchData.length.toString()+"templength");
    return Column(children: [
          ///Search products
        widget.isGuest==true? const SizedBox(height: 0,width: 0,):  CustomTextFieldWithOnTap(
            isShadowRequired: true,

              prefixIcon: SvgPicture.asset(Assets.searchIcon,color: AppColors.greyColor,) ,

              isBorderRequired: false,
              onChanged: (query){
                if(state is AllProductsLoaded) {

                  setState(() {

                    tempSearchData=state.allProductsData.where((model) {


                      final nameLower = model.itemName?.toLowerCase();
                      final category = model.cat?.toString(); // Convert age to string for comparison
                      final queryLower = query.toLowerCase();

                      return nameLower!.contains(queryLower) || category!.contains(queryLower);

                    }).toList();
                    tempSearchChange=true;

                  });
                }
              ///tobe evaluated
              },

              borderRadius:20.sp,
              hintTextColor: AppColors.greyColor,
              controller: searchController, hintText: 'Search products', textInputType: TextInputType.text),
          ///sort and filters
          widget.isGuest==true? const SizedBox(height: 0,width: 0,):const SizedBox(height: 0,width: 0,),
//              SortAndFilter(
//                onFilterTap:(){
//                SortSheet.showBottomSheet(context,FilterBottomSheetWidget(isGuest:isGuest),'Filters');
//
//             } ,onSortTap: (){
//
//                SortSheet.showBottomSheet(context,SizedBox(
//                  height: isGuest==true?180.h:260.h,
//                  child: Padding(
//                    padding: EdgeInsets.symmetric(horizontal: 18.0.sp),
//                    child: Column(
//                      children: [
//                        CustomSizedBox.height(30.sp),
//                        Align(
//                          alignment: Alignment.centerLeft,
//                          child: AppText('Sort By', style: Styles.circularStdBold(context,letterSpacing: 1.1,fontWeight:
//                          FontWeight.w600,fontSize: 19.sp),),
//                        ),
//                        CustomSizedBox.height(10.sp),
//                        CustomRadioButtons(getCurrentValue: (s){},buttonList: isGuest==true? ["Most Relevant",'New arrivals']:  const ['Most Relevant','Low to high','High to low',
// 'New arrivals'
// ],),
//                      ],
//                    ),
//                  ),
//                ),'Sort By');
//
//              },),
CustomSizedBox.height(5),
          ///Grid View Products
          ///
      Align(
        alignment: Alignment.centerLeft,
        child: AppText("${tempSearchData.length} products found", style: Styles.circularStdBold(context,fontWeight: FontWeight.w500))),
      10.y,
      state is AllProductsLoaded?
      Expanded(
        child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child:  Wrap(
          direction: Axis.horizontal,
          spacing: 12,

          runSpacing: 12,

          alignment: WrapAlignment.start,

          children: [

            for(var i in tempSearchData)

              NewArrivalProduct(onAddToCardTap: () { print("tap $i");
              if(widget.isGuest == true){
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
                    title: "1 product added to cart", message: "1 product in your cart 890,230", assetImage: Assets.orderConfirm,
                    button1Tap: (){


                      Navigate.pop(context);

                    }, button2Tap: (){
                      Navigate.pop(context);

                      // pageController?.jumpToPage(3);

                    }
                );
              }
              },onDetailTap: (){

                Navigate.to(context,  ProductDetails(productDto: i,isGuest:widget.isGuest,isApi:true));

              },
                  isGuest:widget.isGuest,
                  productData: i,
                  isFromApi:true
              )




          ],),
        ),
      ):
      Center(child: LoadingDialog.loadingWidget()),
          //CustomSizedBox.height(100)
          ],);
  },
),
      ) ,

    );
  }
}
