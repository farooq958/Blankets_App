import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hbk/Application/Services/Navigation/navigation.dart';
import 'package:hbk/Data/AppData/app_preferences.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Resources/imports.dart';
import 'package:hbk/Data/DataSource/Resources/sized_box.dart';
import 'package:hbk/Data/DataSource/Resources/strings.dart';
import 'package:hbk/Data/DataSource/Resources/text_styles.dart';
import 'package:hbk/Data/DataSource/Resources/utils.dart';
import 'package:hbk/Domain/Models/Cart/cart_model.dart';
import 'package:hbk/Domain/Models/HomeScreen/product_model.dart';
import 'package:hbk/Presentation/Common/Dialogs/custom_login_dialog.dart';
import 'package:hbk/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:hbk/Presentation/Common/app_text.dart';
import 'package:hbk/Presentation/Widgets/Auth/Login/login_screen.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/CartScreen/Controller/cart_cubit.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/CartScreen/SqDb/cart_db.dart';

import 'package:hbk/Presentation/Widgets/Dashboard/HomeScreen/Components/category_product.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/HomeScreen/Components/new_arrival_product_widget.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/Product/Components/product_detail.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/Product/product.dart';
import 'package:shimmer/shimmer.dart';

import 'Components/home_carousel.dart';
import 'Components/new_arrival_detail.dart';
import 'Controller/category_cubit.dart';
import 'Controller/new_arrival_product_cubit.dart';

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
context.read<NewArrivalProductCubit>().getNewArrivalProducts(isGuest:widget.isGuest);
    // TODO: implement initState
    super.initState();
  }
  Map<int,bool> mapIsRemove={};
  List<ProductApiModel> loadedData=[];
  @override
  Widget build(BuildContext context) {
    return  Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            child: SingleChildScrollView(
              child:
              BlocBuilder<CartCubit, CartState>(
                builder: (context, cartState) {
    return Column(
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
                            text: SharedPrefs.userData!.balance.toString(),
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

                              Navigate.to(context, NewArrivalDetail(isGuest:widget.isGuest));
                             // widget.pageController?.jumpToPage(2);
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
                      height:  widget.isGuest==true? 195.h:250.h,
                      child:     BlocBuilder<CartCubit, CartState>(
                  builder: (context, cartState) {
print(cartState);
                    print('cubit rebuild');
    return BlocConsumer<NewArrivalProductCubit, NewArrivalProductState>(
  listener: (context, state) {
    // TODO: implement listener
    // if (state is NewArrivalProductLoading) {
    //   //print("in loading");
    //   LoadingDialog.showLoadingDialog(context);
    // }
    // if (state is NewArrivalProductLoaded) {
    //   Navigator.of(context).pop(true);
    // }
    // if(state is NewArrivalProductError)
    //   {
    //     Navigator.of(context).pop(true);
    //     CustomDialog.dialog(context, AppText(state.error.toString(), style: Styles.circularStdBold(context)));
    //   }

    if(state is LogOutStateNewArrival)
    {
      showLoginDialog(context,fromSession: true);

    }
    if(state is NewArrivalIndividualLoading)
      {
       // context.read<CartCubit>().getAllCartItems();
       // WidgetFunctions.instance.snackBar(context,text: 'Adding to cart..');
      }
  },
  builder: (context, state) {

    loadedData=state is NewArrivalProductLoaded ? state.newArrivalData:loadedData;

    return ListView.separated(
      //shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      //shrinkWrap: true,
      itemBuilder: (context, index) {

        Future<bool> getBoolValueForCart(String itemCode,List<ProductApiModel> pr)    async {
          bool stat= await CartDatabase.cartDatabaseInstance.isProductInCart(itemCode);
          print("here in function + value = $stat");
          List<ProductApiModel2> p2=[];
          if(mapIsRemove.containsKey(index)) {
            mapIsRemove.update(index, (value) => stat);
          }
          else
          {
            mapIsRemove.addAll({index:stat});
          }


          return stat;
          // return  await CartDatabase.cartDatabaseInstance.isProductInCart(string);

        }
        if(state is NewArrivalProductLoaded) {
          var isRemove=   getBoolValueForCart(loadedData[index].itemCode.toString(),loadedData);
          print(mapIsRemove);
          print(isRemove);
        }
        //     print(( Future.value(isRemove) == Future.value(true)));
//Future.delayed(const Duration(seconds: 1));

        return  state is NewArrivalProductLoading?SizedBox(
          // height: 100,
          width: 150.w,
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: NewArrivalProduct(onAddToCardTap: () {  },dummyProduct: Utils.dummyProduct[index],isGuest:true), // Create a ShimmerListTile widget
          ),
        ) : NewArrivalProduct(
          isFromApi:true,
          isRemoveCart:mapIsRemove[index]??true,
          productData: loadedData[index],
          onDetailTap: (){

            Navigate.to(context, ProductDetails(isGuest: widget.isGuest,productDto:loadedData[index],isApi:true,isRemove: mapIsRemove[index],));
          },
          isGuest: widget.isGuest, onAddToCardTap: ()async{

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
          else{
            // print('intap');
            //  print( isRemove);
            if( mapIsRemove[index] == false)
            {
              int cartStatus= await  CartDatabase.cartDatabaseInstance.deleteCart(loadedData[index].itemCode.toString());
              if(cartStatus != 0)
              {

                //  context.read<CartCubit>().getAllCartItems();
              }

            }
            else
            {
              print('intap');
              CartModel cm = CartModel(productId:loadedData[index].itemCode.toString(),
                  productName: loadedData[index].itemName.toString(),productQuantity: '1',
                  productPrice: loadedData[index].price.toString() ,
                  productImage:loadedData[index].uImage.toString(),
                  multiplier: loadedData[index].multiplier.toString(),
                  pcsCtn: loadedData[index].defaultSalesUom.toString());
              var cartStatus= await CartDatabase.cartDatabaseInstance.insertCart(cm);
              if(cartStatus != 0)
              {


              }


            }
            setState(() {
              context.read<NewArrivalProductCubit>().getNewArrivalProducts(notReload: true);

            });

            context.read<CartCubit>().getAllCartItems();


          }


        },
          // dummyProduct: Utils.dummyProduct[index],

        );
      },
      separatorBuilder: (context, index) {
        return CustomSizedBox.width(15);
      },
      itemCount: state is NewArrivalIndividualLoading || state is NewArrivalProductLoading?Utils.dummyProduct.length:loadedData.length,
    );
    // if(state is NewArrivalProductLoaded  ) {
    //
    //
    //
    //
    // }

  },
);
  },
)),
                  CustomSizedBox.height(10),

                  ///Most Sold Product replace the product dummy list with actual list of most sold product
                  // widget.isGuest==true? SizedBox(height: 0.sp,width: 0.sp,): Align(
                  //     alignment: Alignment.centerLeft,
                  //     child: Row(
                  //       children: [
                  //         AppText(
                  //           AppStrings.mostSoldProduct,
                  //           style: Styles.circularStdBold(context,
                  //               fontWeight: FontWeight.w500, fontSize: 20.sp),
                  //         ),
                  //         const Spacer(),
                  //         widget.isGuest==true?const SizedBox(height: 0,width: 0,) :  GestureDetector(
                  //           onTap: (){
                  //
                  //             widget.pageController?.jumpToPage(2);
                  //           },
                  //           child: AppText(
                  //             'See all',
                  //             style: Styles.circularStdRegular(context,
                  //                 fontWeight: FontWeight.w500, fontSize: 14.sp),
                  //           ),
                  //         ),
                  //       ],
                  //     )),
                  // widget.isGuest==true? SizedBox(height: 0.sp,width: 0.sp,):   SizedBox(
                  //     width: 1.sw,
                  //     height:  widget.isGuest==true? 195.h:250.h,
                  //     child: ListView.separated(
                  //       scrollDirection: Axis.horizontal,
                  //       itemBuilder: (context, index) {
                  //         return NewArrivalProduct(
                  //           isGuest: widget.isGuest,
                  //           onDetailTap: (){
                  //
                  //             Navigate.to(context, ProductScreen(title: "",isGuest: widget.isGuest,));
                  //           },
                  //           dummyProduct: Utils.dummyProduct[index],
                  //           onAddToCardTap: () {
                  //             if (widget.isGuest == true) {
                  //               CustomDialog.dialog(
                  //                   context,
                  //                   SizedBox(
                  //                       width: 1.sw,
                  //                       height: 250.h,
                  //                       child: Center(
                  //                         child: Column(
                  //                           // crossAxisAlignment: CrossAxisAlignment.start,
                  //                           mainAxisAlignment:
                  //                           MainAxisAlignment.center,
                  //                           children: [
                  //                             SvgPicture.asset(
                  //                               Assets.logout,
                  //                               width: 50.w,
                  //                               height: 50.h,
                  //                             ),
                  //                             CustomSizedBox.height(10.h),
                  //                             AppText('Please login first',
                  //                                 style: Styles.circularStdBold(
                  //                                     context,
                  //                                     fontSize: 22.sp)),
                  //                             CustomSizedBox.height(10.h),
                  //                             AppText('Please login first',
                  //                                 style: Styles.circularStdBold(
                  //                                     context,
                  //                                     fontSize: 16.sp)),
                  //                             CustomSizedBox.height(10.h),
                  //
                  //                             CustomButton(
                  //                               onTap: () {
                  //                                 Navigator.of(context).pop(true);
                  //                                 Navigate.to(context, const LoginScreen());
                  //                               },
                  //                               text: 'Login',
                  //                               width: 1.sw,
                  //                               horizontalMargin: 20.w,
                  //                             ),
                  //
                  //                           ],
                  //
                  //                         ),
                  //                       )));
                  //             }
                  //             else
                  //               {
                  //                 CustomDialog.successConfirmDialog(context,
                  //                     button1Text: "Explore",
                  //                     button2Text: "Cart",
                  //                     width: 1.sw,
                  //                     button2LeadingImageIcon: true,
                  //                     button2LeadingIcon: Assets.bagIcon,
                  //                     title: "1 product added to cart", message: "1 product in your cart 890,230", assetImage: Assets.orderConfirm,   button1Tap: (){
                  //
                  //
                  //                       Navigate.pop(context);
                  //
                  //                     }, button2Tap: (){
                  //                       Navigate.pop(context);
                  //
                  //                       widget.pageController?.jumpToPage(3);
                  //
                  //                     });
                  //               }
                  //           },
                  //         );
                  //       },
                  //       separatorBuilder: (context, index) {
                  //         return CustomSizedBox.width(15);
                  //       },
                  //       itemCount: Utils.dummyProduct.length,
                  //     )),
                 // CustomSizedBox.height(5),
                ],
              );
  },
),

            ));
  }

}
