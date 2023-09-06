import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hbk/Data/DataSource/Resources/imports.dart';
import 'package:hbk/Data/DataSource/Resources/properties_data.dart';
import 'package:hbk/Domain/Models/Cart/cart_model.dart';
import 'package:hbk/Domain/Models/HomeScreen/product_model.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/CartScreen/Controller/cart_cubit.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/CartScreen/SqDb/cart_db.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/HomeScreen/Controller/new_arrival_product_cubit.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/Product/Controller/quantity_notifier.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/SearchScreen/Controller/all_products_cubit.dart';

class ProductDetails extends StatelessWidget {
  final ProductModel? pd;
  final bool? isGuest;
  final bool? isApi;
  final ProductApiModel? productDto;
  const ProductDetails({
    super.key,
    this.pd,
    this.isGuest,
    this.isApi,
    this.productDto,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithBackButton(
        title: " ",
        padding: EdgeInsets.only(left: 6.sp),
        iconData: Icons.arrow_back_ios,
        iconSize: 15.sp,
        iconColor: AppColors.primaryColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0.sp),
        child: SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    ///top widget upto price pkr 500xx
                    Center(
                        child: isApi == true
                            ? CachedImage(
                                url:
                                    "http://imtxt.sbsolutions.com.pk:44891/Picture/${productDto!.uImage}",
                                width: 270.w,
                                height: 220.sp,
                                isCircle: false)
                            : AssetImageWidget(
                                url: Assets.appLogo,
                                color: AppColors.primaryColor,
                                width: 270.w,
                                height: 220.sp,
                              )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                            flex: 2,
                            child: isApi == true
                                ? AppText(productDto!.itemName.toString(),
                                    maxLine: 3,
                                    style: Styles.circularStdBold(context,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18.sp))
                                : AppText(
                                    "Belpla Teenagers 1 Ply Single Bed Blanket",
                                    maxLine: 2,
                                    style: Styles.circularStdBold(context,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18.sp))),
                        isGuest == true
                            ? const Expanded(
                                child: SizedBox(
                                height: 0,
                                width: 0,
                              ))
                            : Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(right: 10.w),
                                  child: ValueListenableBuilder(
                                    builder: (context, state, child) {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CircleIconButton(
                                            icon: Icons.remove,
                                            onPressed: () {
                                              if (state != 0) {
                                                QuantityNotifier
                                                    .quantityNotifier.value--;
                                              }
                                            },
                                            width: 25.w,
                                            height: 25.h,
                                            iconSize: 15,
                                          ),
                                          CustomSizedBox.width(10.w),
                                          AppText(state.toString(),
                                              style: Styles.circularStdBold(
                                                  context,
                                                  fontWeight: FontWeight.w500)),
                                          CustomSizedBox.width(10.w),
                                          CircleIconButton(
                                            icon: Icons.add,
                                            onPressed: () {
                                              QuantityNotifier
                                                  .quantityNotifier.value++;
                                            },
                                            width: 25.w,
                                            height: 25.h,
                                            iconSize: 15.sp,
                                            color: AppColors.primaryColor,
                                            iconColor: AppColors.whiteColor,
                                          )
                                        ],
                                      );
                                    },
                                    valueListenable:
                                        QuantityNotifier.quantityNotifier,
                                  ),
                                ),
                              )
                      ],
                    ),
                    isGuest == true
                        ? const SizedBox(
                            height: 0,
                            width: 0,
                          )
                        : CustomSizedBox.height(10),
                    isGuest == true
                        ? const SizedBox(
                            height: 0,
                            width: 0,
                          )
                        : Align(
                            alignment: Alignment.centerLeft,
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'PKR ',
                                    style: Styles.circularStdRegular(
                                      context,
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                      //fontFamily: 'Circular Std',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextSpan(
                                    text: isApi == true
                                        ? productDto!.price
                                        : '5490',
                                    style: Styles.circularStdBold(
                                      context,
                                      color: AppColors.primaryColor,
                                      fontSize: 15.sp,
                                      //fontFamily: 'Circular Std',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                    CustomSizedBox.height(20),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: AppText("Product specification",
                            style: Styles.circularStdBold(context,
                                fontWeight: FontWeight.w500, fontSize: 18.sp))),

                    CustomSizedBox.height(10),
                    ProductTile(
                      tileColor: AppColors.productTileColor,
                      leadingName: 'Product origin',
                      trailingName: isApi == true
                          ? getOriginString(productDto!)
                          : 'China',
                    ),
                    ProductTile(
                      tileColor: AppColors.whiteColor,
                      leadingName: 'Category',
                      trailingName: isApi == true
                          ? productDto!.cat.toString()
                          : '1 PLY Double bet blanket',
                    ),
                    ProductTile(
                      tileColor: AppColors.productTileColor,
                      leadingName: 'Product brand',
                      trailingName: isApi == true
                          ? productDto!.itemName.toString().split(" ").first
                          : 'Burjjan',
                    ),
                    ProductTile(
                      tileColor: AppColors.whiteColor,
                      leadingName: 'Product packaging',
                      trailingName:
                          isApi == true ? productDto!.uPacking : 'Play bag',
                    ),
                    ProductTile(
                      tileColor: AppColors.productTileColor,
                      leadingName: 'Specification',
                      trailingName: isApi == true
                          ? productDto!.uGoodstype
                          : '200 x 240 CMS',
                    ),
                    ProductTile(
                      tileColor: AppColors.whiteColor,
                      leadingName: 'Embossed',
                      trailingName: isApi == true
                          ? getEmbossedString(productDto!)
                          : 'Yes',
                    ),
                    ProductTile(
                      tileColor: AppColors.productTileColor,
                      leadingName: 'Pcs Per Carton',
                      trailingName: isApi == true
                          ? productDto!.defaultSalesUom.toString()
                          : '20 Pcs',
                    ),

                    // isGuest==true?  const SizedBox(height: 0,width: 0,):
                    // ListTile(
                    //   tileColor: AppColors.whiteColor,
                    //
                    //   contentPadding: const EdgeInsets.only(left: 10),
                    //   leading:
                    //   Column(
                    //     children: [
                    //       Expanded(child: AppText('Total', style: Styles.circularStdBold(context,fontWeight: FontWeight.w500,fontSize: 14.sp))),
                    //     Expanded(child: AppText('Rs 890,230', style: Styles.circularStdBold(context,fontWeight: FontWeight.w600,fontSize: 15.sp))),
                    //
                    //     ],
                    //   )
                    //   ,
                    //
                    //   trailing:  SizedBox(
                    //
                    //       height: 110.h,
                    //       width: 200,
                    //       child: CustomButton(onTap: () {
                    //         CustomDialog.successConfirmDialog(context,
                    //             button1Text: "Explore",
                    //             button2Text: "Cart",
                    //             width: 1.sw,
                    //             button2LeadingImageIcon: true,
                    //             button2LeadingIcon: Assets.bagIcon,
                    //             title: "1 product added to cart", message: "1 product in your cart 890,230", assetImage: Assets.orderConfirm, button1Tap: (){}, button2Tap: (){});
                    //
                    //       },
                    //         textFontWeight: FontWeight.normal,
                    //         textSize: 16,
                    //         borderRadius: 40,
                    //
                    //         text: ' Add to cart',verticalPadding: 12,leadingIcon:Assets.bagIcon,leadingSvgIcon: true,horizontalMargin: 10, )),
                    //
                    // ),
                    CustomSizedBox.height(50)
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: isGuest == true
                    ? CustomButton(
                        onTap: () {
                          Navigate.toReplaceAll(context, const LoginScreen());
                        },
                        text: 'Login first to order',
                      )
                    : Container(
                        color: AppColors.whiteColor,
                        child: ListTile(
                          tileColor: AppColors.whiteColor,
                          contentPadding: const EdgeInsets.only(left: 10),
                          leading: Column(
                            children: [
                              Expanded(
                                  child: AppText('Total',
                                      style: Styles.circularStdBold(context,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.sp))),
                              Expanded(
                                  child: AppText('Rs 890,230',
                                      style: Styles.circularStdBold(context,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15.sp))),
                            ],
                          ),
                          trailing: SizedBox(
                              height: 110.h,
                              width: 200,
                              child: CustomButton(
                                onTap: () {
                                  CustomDialog.successConfirmDialog(context,
                                      button1Text: "Explore",
                                      button2Text: "Cart",
                                      width: 1.sw,
                                      button2LeadingImageIcon: true,
                                      button2LeadingIcon: Assets.bagIcon,
                                      title: "1 product added to cart",
                                      message: "1 product in your cart 890,230",
                                      assetImage: Assets.orderConfirm,
                                      button1Tap: () {
                                    Navigate.pop(context);
                                  }, button2Tap: () {
                                    Navigate.pop(context);
                                  });
                                },
                                textFontWeight: FontWeight.normal,
                                textSize: 16,
                                borderRadius: 40,
                                text: ' Add to cart',
                                verticalPadding: 12,
                                leadingIcon: Assets.bagIcon,
                                leadingSvgIcon: true,
                                horizontalMargin: 10,
                              )),
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProductTile extends StatelessWidget {
  final String? leadingName;
  final String? trailingName;
  final Color? tileColor;
  const ProductTile({
    super.key,
    this.leadingName,
    this.trailingName,
    this.tileColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: tileColor,
      leading: AppText(leadingName.toString(),
          style: Styles.circularStdBold(context,
              fontWeight: FontWeight.w500, fontSize: 14.sp)),
      trailing: AppText(trailingName.toString(),
          style: Styles.circularStdBold(context,
              fontWeight: FontWeight.w600, fontSize: 15.sp)),
class ProductDetails extends  StatefulWidget {
  final bool? isGuest;
  final bool? isRemove;
  final String? catId;
  const ProductDetails( {super.key,this.pd, this.isGuest, this.isApi, this.productDto, this.isRemove, this.catId,});
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool? isRemove;
  @override
  void initState() {

   if(widget.isApi==true) {
     context.read<CartCubit>().getAllCartItems();
    isRemove= widget.isRemove;

   }
print("updated");
    // TODO: implement initState
    super.initState();
  }
    return  WillPopScope(
      onWillPop: ()async { return false; },
      child: Scaffold(
        appBar: CustomAppBarWithBackButton(title: " ",padding: EdgeInsets.only(left: 6.sp),iconData: Icons.arrow_back_ios,iconSize: 15.sp,

        iconColor: AppColors.primaryColor,
          catId: widget.catId ,
          isGuest: widget.isGuest,
        ),

body: Padding(
  padding:  EdgeInsets.symmetric(horizontal: 10.0.sp),
  child:   SizedBox(
      width: 1.sw,
      height: 1.sh,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
///top widget upto price pkr 500xx
                Center(child:
                widget.isApi==true?CachedImage(url:  "http://imtxt.sbsolutions.com.pk:44891/Picture/${widget.productDto!.uImage}",width: 270.w,height: 220.sp,isCircle:false) :
                AssetImageWidget(url: Assets.appLogo,color: AppColors.primaryColor,width: 270.w,height: 220.sp,)),
Row(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
children: [
                Expanded(
                    flex: 2,
                    child:
                    widget.isApi==true?                   AppText(widget.productDto!.itemName.toString(),
                        maxLine: 3, style: Styles.circularStdBold(context,fontWeight: FontWeight.w500,fontSize: 18.sp))
                        :
                    AppText("Belpla Teenagers 1 Ply Single Bed Blanket",maxLine: 2, style: Styles.circularStdBold(context,fontWeight: FontWeight.w500,fontSize: 18.sp))
                ),

 widget.isGuest==true? const Expanded(child: SizedBox(height: 0,width: 0,)): Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: BlocBuilder<CartCubit, CartState>(
  builder: (context, cartSt) {
      List<CartModel>? lc=[];
      if(cartSt is CartLoaded){
        lc=cartSt.cartData.where((element) => element.productId== widget.productDto?.itemCode.toString()).toList();
      }
      print("cartLenth");
      print(lc.length);
      if(lc.isNotEmpty)
        {
          print(double.parse(lc[0].productQuantity.toString()).toInt());
          QuantityNotifier.quantityNotifier.value=(double.parse(lc[0].productQuantity.toString())).toInt();
        }
      else
        {
          QuantityNotifier.quantityNotifier.value=1;
        }
      return ValueListenableBuilder(
                  builder: (context,state,child) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleIconButton(
                          icon: Icons.remove,
                          onPressed: () async {
                            if(state != 0) {
                              QuantityNotifier.quantityNotifier.value--;
                              CartModel cm = CartModel(productId:widget.productDto!.itemCode.toString(),
                                  productName: widget.productDto!.itemName.toString(),productQuantity: (QuantityNotifier.quantityNotifier.value.toString()) ,
                                  productPrice: widget.productDto!.price.toString() ,
                                  multiplier: widget.productDto!.multiplier.toString(),
                                  productImage:widget.productDto!.uImage.toString(),
                                  pcsCtn: widget.productDto!.defaultSalesUom.toString());
                             await CartDatabase.cartDatabaseInstance.updateCart(cm);
                            }
                          },
                          width: 25.w,
                          height: 25.h,
                          iconSize: 15,
                        ),
                        CustomSizedBox.width(10.w),

                        AppText(state.toString(),
                            style: Styles.circularStdBold(context,fontWeight: FontWeight.w500)),
                        CustomSizedBox.width(10.w),
                        CircleIconButton(
                          icon: Icons.add,
                          onPressed: () async {

                            QuantityNotifier.quantityNotifier.value++;
print(  QuantityNotifier.quantityNotifier.value);
print('stateeeeee');
                            CartModel cm = CartModel(productId:widget.productDto!.itemCode.toString(),
                                productName: widget.productDto!.itemName.toString(),productQuantity: (QuantityNotifier.quantityNotifier.value.toString() ),
                                productPrice: widget.productDto!.price.toString() ,
                                multiplier: widget.productDto!.multiplier.toString(),
                                productImage:widget.productDto!.uImage.toString(),
                                pcsCtn: widget.productDto!.defaultSalesUom.toString());
                           await CartDatabase.cartDatabaseInstance.updateCart(cm);
                          },
                          width: 25.w,
                          height: 25.h,
                          iconSize: 15.sp,
                          color: AppColors.primaryColor,
                          iconColor: AppColors.whiteColor,
                        )
                      ],
                    );
                  }, valueListenable: QuantityNotifier.quantityNotifier,
                );
  },
),
              ),
            )


],
),
                widget.isGuest==true? const SizedBox(height: 0,width: 0,): CustomSizedBox.height(10),
                widget.isGuest==true? const SizedBox(height: 0,width: 0,): Align(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'PKR ',
                          style: Styles.circularStdRegular(
                            context,
                            color: Colors.black,
                            fontSize: 15.sp,
                            //fontFamily: 'Circular Std',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: widget.isApi==true?widget.productDto!.price:'5490',
                          style: Styles.circularStdBold(
                            context,
                            color:AppColors.primaryColor,
                            fontSize: 15.sp,
                            //fontFamily: 'Circular Std',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ) ,
                  ),
                ),
                CustomSizedBox.height(20),
                Align(
                    alignment: Alignment.centerLeft,
                    child:
                    AppText("Product specification", style: Styles.circularStdBold(context,fontWeight: FontWeight.w500,fontSize: 18.sp))),
                    CustomSizedBox.height(10),
                    ProductTile(
                      tileColor: AppColors.productTileColor,
                      leadingName: 'Product origin',
                      trailingName: isApi == true
                          ? getOriginString(productDto!)
                          : 'China',
                    ),
                    ProductTile(
                      tileColor: AppColors.whiteColor,
                      leadingName: 'Category',
                      trailingName: isApi == true
                          ? productDto!.cat.toString()
                          : '1 PLY Double bet blanket',
                    ),
                    ProductTile(
                      tileColor: AppColors.productTileColor,
                      leadingName: 'Product brand',
                      trailingName: isApi == true
                          ? productDto!.itemName.toString().split(" ").first
                          : 'Burjjan',
                    ),
                    ProductTile(
                      tileColor: AppColors.whiteColor,
                      leadingName: 'Product packaging',
                      trailingName:
                          isApi == true ? productDto!.uPacking : 'Play bag',
                    ),
                    ProductTile(
                      tileColor: AppColors.productTileColor,
                      leadingName: 'Specification',
                      trailingName: isApi == true
                          ? productDto!.uGoodstype
                          : '200 x 240 CMS',
                    ),
                    ProductTile(
                      tileColor: AppColors.whiteColor,
                      leadingName: 'Embossed',
                      trailingName: isApi == true
                          ? getEmbossedString(productDto!)
                          : 'Yes',
                    ),
                    ProductTile(
                      tileColor: AppColors.productTileColor,
                      leadingName: 'Pcs Per Carton',
                      trailingName: isApi == true
                          ? productDto!.defaultSalesUom.toString()
                          : '20 Pcs',
                    ),
                // isGuest==true?  const SizedBox(height: 0,width: 0,):
                // ListTile(
                //   tileColor: AppColors.whiteColor,
                //
                //   contentPadding: const EdgeInsets.only(left: 10),
                //   leading:
                //   Column(
                //     children: [
                //       Expanded(child: AppText('Total', style: Styles.circularStdBold(context,fontWeight: FontWeight.w500,fontSize: 14.sp))),
                //     Expanded(child: AppText('Rs 890,230', style: Styles.circularStdBold(context,fontWeight: FontWeight.w600,fontSize: 15.sp))),
                //
                //     ],
                //   )
                //   ,
                //
                //   trailing:  SizedBox(
                //
                //       height: 110.h,
                //       width: 200,
                //       child: CustomButton(onTap: () {
                //         CustomDialog.successConfirmDialog(context,
                //             button1Text: "Explore",
                //             button2Text: "Cart",
                //             width: 1.sw,
                //             button2LeadingImageIcon: true,
                //             button2LeadingIcon: Assets.bagIcon,
                //             title: "1 product added to cart", message: "1 product in your cart 890,230", assetImage: Assets.orderConfirm, button1Tap: (){}, button2Tap: (){});
                //
                //       },
                //         textFontWeight: FontWeight.normal,
                //         textSize: 16,
                //         borderRadius: 40,
                //
                //         text: ' Add to cart',verticalPadding: 12,leadingIcon:Assets.bagIcon,leadingSvgIcon: true,horizontalMargin: 10, )),
                //
                // ),
                CustomSizedBox.height(50)

              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: widget.isGuest==true? CustomButton(onTap: () {

              Navigate.toReplaceAll(context, const LoginScreen());

            }, text: 'Login first to order',):   Container(
              color: AppColors.whiteColor,
              child: ListTile(
                tileColor: AppColors.whiteColor,


                contentPadding: const EdgeInsets.only(left: 10),
                leading:
                Column(
                  children: [
                    Expanded(child: AppText('Total', style: Styles.circularStdBold(context,fontWeight: FontWeight.w500,fontSize: 14.sp))),
                    Expanded(child: AppText('Rs ${double.parse(widget.productDto!.price.toString()) * double.parse(widget.productDto!.defaultSalesUom.toString().split(' ').first)}', style: Styles.circularStdBold(context,fontWeight: FontWeight.w600,fontSize: 15.sp))),

                  ],
                )
                ,

                trailing:  SizedBox(

                    height: 110.h,
                    width: 200,
                    child: CustomButton(onTap: () async {
                      // CustomDialog.successConfirmDialog(context,
                      //     button1Text: "Explore",
                      //     button2Text: "Cart",
                      //     width: 1.sw,
                      //     button2LeadingImageIcon: true,
                      //     button2LeadingIcon: Assets.bagIcon,
                      //     title: "1 product added to cart", message: "1 product in your cart 890,230", assetImage: Assets.orderConfirm, button1Tap: (){
                      //
                      //
                      //   Navigate.pop(context);
                      //     }, button2Tap: (){
                      //       Navigate.pop(context);
                      //     });

                   if  ( isRemove==true){
                     CartModel cm = CartModel(productId:widget.productDto!.itemCode.toString(),
                         productName: widget.productDto!.itemName.toString(),productQuantity:QuantityNotifier.quantityNotifier.value.toString(),
                         productPrice: widget.productDto!.price.toString() ,
                         productImage:widget.productDto!.uImage.toString(),
                         multiplier: widget.productDto!.multiplier.toString(),
                         pcsCtn: widget.productDto!.defaultSalesUom.toString());
                     var cartStatus= await CartDatabase.cartDatabaseInstance.insertCart(cm);
                     if(cartStatus != 0)
                     {
                       isRemove=false;


                     }
                  context.read<CartCubit>().getAllCartItems();
                   }
                      else
                        {
                          var cartStatus= await  CartDatabase.cartDatabaseInstance.deleteCart(widget.productDto!.itemCode.toString());
                          if(cartStatus != 0)
                          {
isRemove=true;
                            //  context.read<CartCubit>().getAllCartItems();
                          }

                          context.read<CartCubit>().getAllCartItems();
                        }
                      setState(() {

                      });
                   context.read<AllProductsCubit>().getAllProducts(catId: widget.catId ?? 'all',isGuest:widget.isGuest);
                   context.read<NewArrivalProductCubit>().getNewArrivalProducts(notReload: true);
                    },
                      textFontWeight: FontWeight.normal,
                      textSize: 16,
                      borderRadius: 40,

                      text: isRemove==true?' Add to cart':'Remove',verticalPadding: 12,leadingIcon:Assets.bagIcon,leadingSvgIcon: true,horizontalMargin: 10, )),

              ),
            ),
          )
        ],
      ),
  ),
),

      ),
    );
  }
}
