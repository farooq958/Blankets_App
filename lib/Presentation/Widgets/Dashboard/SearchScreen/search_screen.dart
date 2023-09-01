import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hbk/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:hbk/Data/DataSource/Resources/imports.dart';
import 'package:hbk/Domain/Models/HomeScreen/product_model.dart';
import 'package:hbk/Presentation/Common/Dialogs/custom_login_dialog.dart';
import 'package:hbk/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/HomeScreen/Components/new_arrival_product_widget.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/Product/Components/product_detail.dart';

import 'Controller/all_products_cubit.dart';

class SearchScreen extends  StatefulWidget {
 final  bool? isGuest;
   SearchScreen({super.key,this.isGuest});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
final TextEditingController searchController=SearchController();
@override
  void initState() {
  context.read<AllProductsCubit>().getAllProducts(isGuest: widget.isGuest,catId: 'all');
    // TODO: implement initState
    super.initState();
  }
List<ProductApiModel> tempSearchData=[];
bool? tempSearchChange;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBar(
        title: "Search",
        isNotificationScreen: true,isShowNotificationButton: true,),
      body:Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: BlocConsumer<AllProductsCubit, AllProductsState>(
          listener: (context, state) {
// TODO: implement listener
            if(state is LogOutProductState)
            {
              showLoginDialog(context,fromSession: true);

            }
          },
  builder: (context, state) {
 //  String productLength=state is AllProductsLoaded?state.allProductsData.length.toString():'0';
   tempSearchData = state is AllProductsLoaded && tempSearchChange==null? state.allProductsData:tempSearchChange==true? tempSearchData: [];
   print(tempSearchData.length.toString()+"templength");
    return Column(children: [
          CustomTextFieldWithOnTap(
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
              controller: searchController, hintText: 'Search By Name & Category', textInputType: TextInputType.text),
          Align(
              alignment: Alignment.centerLeft,
              child: AppText("${tempSearchData.length} Products Found", style: Styles.circularStdBold(context,fontWeight: FontWeight.w500))),
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
      Expanded(child: Center(child: LoadingDialog.loadingWidget())),


        ],);


    },
),
      )
    );
  }
}

