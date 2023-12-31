import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hbk/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:hbk/Data/DataSource/Resources/imports.dart';
import 'package:hbk/Domain/Models/Cart/cart_model.dart';
import 'package:hbk/Domain/Models/HomeScreen/product_model.dart';
import 'package:hbk/Presentation/Common/Dialogs/custom_login_dialog.dart';
import 'package:hbk/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/CartScreen/Controller/cart_cubit.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/CartScreen/SqDb/cart_db.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/HomeScreen/Components/new_arrival_product_widget.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/HomeScreen/Controller/new_arrival_product_cubit.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/Product/Components/product_detail.dart';



class NewArrivalDetail extends  StatefulWidget {
  final  bool? isGuest;
  const NewArrivalDetail({super.key,this.isGuest});

  @override
  State<NewArrivalDetail> createState() => _NewArrivalDetail();
}

class _NewArrivalDetail extends State<NewArrivalDetail> {
  final TextEditingController searchController=SearchController();
  Map<int,bool> mapIsRemove={};
  @override
  void initState() {
    context.read<NewArrivalProductCubit>().getNewArrivalProducts(isGuest: widget.isGuest);
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
          title: "New Arrival",
          isNotificationScreen: true,isShowNotificationButton: true,),
        body:Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: BlocConsumer<NewArrivalProductCubit, NewArrivalProductState>(
            listener: (context, state) {
// TODO: implement listener
              if(state is LogOutStateNewArrival)
              {
                showLoginDialog(context,fromSession: true);

              }
            },
            builder: (context, state) {
              //  String productLength=state is AllProductsLoaded?state.allProductsData.length.toString():'0';
              tempSearchData = state is NewArrivalProductLoaded && tempSearchChange==null? state.newArrivalData:tempSearchChange==true? tempSearchData: [];

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
              if(state is NewArrivalProductLoaded) {
                var isRemove =   getBoolValueForCart('tempSearchData[i].itemCode.toString()',tempSearchData);
                print(mapIsRemove);
                print(isRemove);
              }
              print("${tempSearchData.length}templength");
              return BlocBuilder<CartCubit, CartState>(
                builder: (context, cState) {
                  return Column(children: [
                    CustomTextFieldWithOnTap(
                        isShadowRequired: true,

                        prefixIcon: SvgPicture.asset(Assets.searchIcon,color: AppColors.greyColor,) ,

                        isBorderRequired: false,
                        onChanged: (query){
                          if(state is NewArrivalProductLoaded) {

                            setState(() {

                              tempSearchData=state.newArrivalData.where((model) {


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
                    state is NewArrivalProductLoaded?
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child:  Wrap(
                          direction: Axis.horizontal,
                          spacing: 12,

                          runSpacing: 12,

                          alignment: WrapAlignment.start,

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
                                      multiplier:tempSearchData[i].multiplier.toString(),
                                      pcsCtn: tempSearchData[i].defaultSalesUom.toString());
                                  var cartStatus= await CartDatabase.cartDatabaseInstance.insertCart(cm);
                                  if(cartStatus != 0)
                                  {


                                  }


                                }

                                //context.read<AllProductsCubit>().getAllProducts(catId: widget.catId ?? 'all',isGuest:widget.isGuest);
                                context.read<CartCubit>().getAllCartItems();
                                setState(() {

                                });

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

                                Navigate.to(context,  ProductDetails(productDto: tempSearchData[i],isGuest:widget.isGuest,isApi:true,isRemove: mapIsRemove[i],));

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


                  ],);
                },
              );


            },
          ),
        )
    );
  }
}

