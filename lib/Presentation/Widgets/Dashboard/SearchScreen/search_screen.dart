import 'package:hbk/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:hbk/Data/DataSource/Resources/imports.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/HomeScreen/Components/new_arrival_product_widget.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/Product/Components/product_detail.dart';

class SearchScreen extends  StatelessWidget {
 final  bool? isGuest;
   SearchScreen({super.key,this.isGuest});
final TextEditingController searchController=SearchController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBar(
        title: "Search",
        isNotificationScreen: true,isShowNotificationButton: true,),
      body:Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: Column(children: [
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
          Align(
              alignment: Alignment.centerLeft,
              child: AppText("15 products found", style: Styles.circularStdBold(context,fontWeight: FontWeight.w500))),
          10.y,
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Wrap(
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

                      Navigate.to(context,  ProductDetails(pd: i,isGuest:isGuest));

                    },
                        isGuest:isGuest
                    )




                ],),
            ),
          ),


        ],),
      )
    );
  }
}
