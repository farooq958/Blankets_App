import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hbk/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:hbk/Data/DataSource/Resources/imports.dart';
import 'package:hbk/Data/DataSource/Resources/utils.dart';
import 'package:hbk/Domain/Models/Cart/cart_model.dart';
import 'package:hbk/Domain/Models/HomeScreen/product_model.dart';
import 'package:hbk/Presentation/Common/Dialogs/custom_login_dialog.dart';
import 'package:hbk/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:hbk/Presentation/Common/custom_radio_button.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/CartScreen/Controller/cart_cubit.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/CartScreen/SqDb/cart_db.dart';
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
  final String? catId;
  const ProductScreen(
      {super.key, this.title, this.isGuest, this.pageController, this.catId});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
 final TextEditingController searchController=TextEditingController();
 List<ProductApiModel> tempSearchData=[];
 bool? tempSearchChange;
 bool? isFromFilter;
 Map<int,bool> mapIsRemove={};
  bool? isFromSort;
@override
  void initState() {
    // TODO: implement initState
  isFromFilter=false;
  isFromSort=false;
  if(widget.catId == null){

  }
  context.read<AllProductsCubit>().getAllProducts(catId: widget.catId ?? 'all',isGuest:widget.isGuest);

  super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.title != null
          ? CustomAppBarWithBackButton(
              title: widget.title,
              iconData: Icons.arrow_back_ios,
              iconSize: 15.sp,
              padding: EdgeInsets.only(left: 5.sp),
              iconColor: AppColors.primaryColor,
            )
          : null,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: BlocConsumer<AllProductsCubit, AllProductsState>(
          listener: (context, state) {
            // if(state is AllProductsLoaded)
            //   {
            //     setState(() {
            //
            //     });
            //   }
// TODO: implement listener
            if (state is LogOutProductState) {
              showLoginDialog(context, fromSession: true);
            }
          },
          builder: (context, state) {
            String productLength = state is AllProductsLoaded
                ? state.allProductsData.length.toString()
                : '0';
            if (isFromFilter == false && isFromSort == false) {
              tempSearchData =
                  state is AllProductsLoaded && tempSearchChange == null
                      ? state.allProductsData
                      : tempSearchChange == true
                          ? tempSearchData
                          : [];
            }
            Future<bool> getBoolValueForCart(String itemCode,List<ProductApiModel> pr)    async {

          //    print("here in function + value = $stat");
              List<ProductApiModel2> p2=[];
              for(int i=0;i<tempSearchData.length;i++) {
                bool stat= await CartDatabase.cartDatabaseInstance.isProductInCart(tempSearchData[i].itemCode.toString());
                if(mapIsRemove.containsKey(i)) {
                mapIsRemove.update(i, (value) => stat);
              }
              else
              {
                mapIsRemove.addAll({i:stat});
              }
              }
              print('map of indexess');
              print(mapIsRemove);


              return true;
              // return  await CartDatabase.cartDatabaseInstance.isProductInCart(string);

            }
            if(state is AllProductsLoaded) {
              var isRemove =   getBoolValueForCart('tempSearchData[i].itemCode.toString()',tempSearchData);

            }



    return BlocBuilder<CartCubit, CartState>(
  builder: (context, cState) {
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
                      final category = model.cat?.toString().toLowerCase(); // Convert age to string for comparison
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
          widget.isGuest==true? const SizedBox(height: 0,width: 0,):

                       SortAndFilter(
               onFilterTap:() async {
           List<String> categoryDto =  getCategoryData(state is AllProductsLoaded?state.allProductsData:[]);
         //  categoryDto.add('dummyCat');
               SortSheet.showBottomSheet(context, FilterBottomSheetWidget(isGuest:true, dto: state is AllProductsLoaded?state.allProductsData:[], getData: (data ) {

                 setState(() {
                   print(data.length);
                   isFromFilter =true;
                   tempSearchData=data;
                 });
                 Navigate.pop(context);

               }, onClearTap: () {
                 setState(() {
                  if (state is AllProductsLoaded)
                    {
                      tempSearchData=state.allProductsData;
                    }
                 });
                 isFromSort=false;
                 isFromFilter=false;
                 Navigate.pop(context);

               }, categoryList: categoryDto,),'Filters');

            } ,onSortTap: (){

               SortSheet.showBottomSheet(context,SizedBox(
                 height: 180.h,
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
                       CustomRadioButtons(getCurrentValue: (s){

                         print(s);
                         setState(() {
                           isFromFilter =false;
                           isFromSort=true;
                           if(s=='Low To High')
                             {
                               tempSearchData.sort((a, b) => double.parse(a.price.toString()).compareTo(double.parse(b.price.toString())));
                             }
                           else
                             {
                               tempSearchData.sort((a, b) => double.parse(b.price.toString()).compareTo(double.parse(a.price.toString())));


                             }

                         });
                         Navigate.pop(context);

                       },buttonList:const ["Low To High",'High To Low'],
                           ),
                     ],
                   ),
                 ),
               ),'Sort By');

             },),

CustomSizedBox.height(5),
          ///Grid View Products
          ///
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

     runSpacing:  12,
    runAlignment: WrapAlignment.start,
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.start,

          children: [

            for(int i=0;i<tempSearchData.length; i++)

              NewArrivalProduct(onAddToCardTap: () async { print("tap $i");
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
                if( mapIsRemove[i] == false)
                {
                  var cartStatus= await  CartDatabase.cartDatabaseInstance.deleteCart(tempSearchData[i].itemCode.toString());
                  if(cartStatus != 0)
                  {

                    //  context.read<CartCubit>().getAllCartItems();
                  }

                }
                else
                {
                  print('intap');
                  CartModel cm = CartModel(productId:tempSearchData[i].itemCode.toString(),
                      productName: tempSearchData[i].itemName.toString(),productQuantity: '1',
                      productPrice: tempSearchData[i].price.toString() ,
                      productImage:tempSearchData[i].uImage.toString(),
                      multiplier: tempSearchData[i].multiplier.toString(),
                      pcsCtn: tempSearchData[i].defaultSalesUom.toString());
                  var cartStatus= await CartDatabase.cartDatabaseInstance.insertCart(cm);
                  if(cartStatus != 0)
                  {


                  }


                }
                setState(() {

                });
                //context.read<AllProductsCubit>().getAllProducts(catId: widget.catId ?? 'all',isGuest:widget.isGuest);
                context.read<CartCubit>().getAllCartItems();


                // CustomDialog.successConfirmDialog(context,
                //     button1Text: "Explore",
                //     button2Text: "Cart",
                //     width: 1.sw,
                //     button2LeadingImageIcon: true,
                //     button2LeadingIcon: Assets.bagIcon,
                //     title: "1 product added to cart", message: "1 product in your cart 890,230", assetImage: Assets.orderConfirm,
                //     button1Tap: (){
                //
                //
                //       Navigate.pop(context);
                //
                //     }, button2Tap: (){
                //       Navigate.pop(context);
                //
                //       // pageController?.jumpToPage(3);
                //
                //     }
                // );
              }
              },onDetailTap: (){

                Navigate.to(context,  ProductDetails(productDto: tempSearchData[i],isGuest:widget.isGuest,isApi:true,isRemove: mapIsRemove[i],catId: widget.catId,));

              },
                  isGuest:widget.isGuest,
                  productData: tempSearchData[i],
                  isFromApi:true,
                isRemoveCart: mapIsRemove[i],

              )




          ],),
        ),
      ):
      Expanded(child: Center(child: LoadingDialog.loadingWidget())),
          //CustomSizedBox.height(100)
          ],);
  },
);
  },
),
      ) ,

    );
  }

 List<String> getCategoryData(List<ProductApiModel> list) {
  List<String> categoryDto=[];
  for(var i in list)
    {
      print(i.cat);
      if(!categoryDto.contains(i.cat.toString())) {
        categoryDto.add(i.cat.toString());
      }

    }
  return categoryDto;

  }
}
