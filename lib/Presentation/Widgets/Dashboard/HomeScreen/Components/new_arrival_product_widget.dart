import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hbk/Data/DataSource/Resources/assets.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Resources/sized_box.dart';
import 'package:hbk/Data/DataSource/Resources/text_styles.dart';
import 'package:hbk/Data/DataSource/Resources/utils.dart';
import 'package:hbk/Domain/Models/Cart/cart_model.dart';
import 'package:hbk/Domain/Models/HomeScreen/product_model.dart';
import 'package:hbk/Presentation/Common/app_buttons.dart';
import 'package:hbk/Presentation/Common/app_text.dart';
import 'package:hbk/Presentation/Common/dialog.dart';
import 'package:hbk/Presentation/Common/image_widgets.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/CartScreen/Controller/cart_cubit.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/CartScreen/SqDb/cart_db.dart';

class NewArrivalProduct extends StatefulWidget {
 final ProductModel? dummyProduct;
 final VoidCallback onAddToCardTap;
 final ProductApiModel? productData;
 final VoidCallback? onDetailTap;
 final  bool? isGuest;
 final bool? isFromApi;
 final bool? isRemoveCart;
  const NewArrivalProduct({super.key, this.dummyProduct, required this.onAddToCardTap, this.onDetailTap, this.isGuest, this.productData, this.isFromApi, this.isRemoveCart});

  @override
  State<NewArrivalProduct> createState() => _NewArrivalProductState();
}

class _NewArrivalProductState extends State<NewArrivalProduct> {
 bool isRemove=true;
  @override
  void initState() {
    // TODO: implement initState
  if(widget.isFromApi==true){
    print("itembool");
    print(widget.isRemoveCart);
  //  getBoolValueForCart(widget.productData!.itemCode.toString());
  }

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   // print(isRemove);
    return Container(
      width: 150.w,
      height:  widget.isGuest==true? 194.h:245.h,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 12,
            offset: Offset(0, 6),
            spreadRadius: 0,
          )
        ],
      ),

      child: Center(
        child: Column(

          children: [
            CustomSizedBox.height(15),
            GestureDetector(
                onTap: widget.onDetailTap ,

                child: widget.isFromApi ==true?

                    CachedImage(url:"http://imtxt.sbsolutions.com.pk:44891/Picture/${widget.productData!.uImage.toString()}",isCircle: false,width: 110,height: 100.h,)
                    :

                AssetImageWidget(url:widget.dummyProduct!.productImage.toString(),radius: 40.sp,width: 110.w,height: 100.h,)),
            CustomSizedBox.height(10),
            GestureDetector(
              onTap: widget.onDetailTap,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child:widget.isFromApi ==true?
                AppText(widget.productData!.itemName.toString(),
                    maxLine: 3,
                    style: Styles.circularStdBold(context,fontWeight: FontWeight.w500)

                )
                    : AppText(widget.dummyProduct!.productDescription.toString(),
                    maxLine: 3,
                    style: Styles.circularStdBold(context,fontWeight: FontWeight.w500)

                ),
              ),
            ),
            CustomSizedBox.height(10),
           widget.isGuest==true? const SizedBox(height: 0,width: 0,): Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  AppText( "RS",
                      maxLine: 1,
                      style: Styles.circularStdBold(context,fontWeight: FontWeight.w500,)

                  ),
                  CustomSizedBox.width(2),
                  widget.isFromApi ==true?AppText( "${widget.productData!.price?.replaceAll(RegExp(r'\.0+$'), '')}",
                      maxLine: 1,
                      style: Styles.circularStdBold(context,fontWeight: FontWeight.w500,color: AppColors.primaryColor)

                  ) : AppText( "${widget.dummyProduct!.productPrice}",
                      maxLine: 1,
                      style: Styles.circularStdBold(context,fontWeight: FontWeight.w500,color: AppColors.primaryColor)

                  ),
                ],
              ),
            ),
            CustomSizedBox.height(10),
            widget.isGuest==true? const SizedBox(height: 0,width: 0,):  GestureDetector(
              onTap: widget.onAddToCardTap,
              child: Container(
                width: 125.sp,
                height: 32,
             //   padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 0),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                    //  width: 20.w,
                      height: 20.h,
                      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 1.33),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 15,
                            height: 13.33,
                            child: SvgPicture.asset('assets/images/bagIcon.svg'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 2),
                    AppText( widget.isRemoveCart==false? 'Remove':"Add to cart", style: Styles.circularStdBold(context,fontWeight: FontWeight.w500,fontSize: 12.sp,color: AppColors.whiteColor))
                  ],
                ),
              ),
            )

          ],

        ),
      ),
    );
  }

   getBoolValueForCart(String string) async {
    isRemove = await CartDatabase.cartDatabaseInstance.isProductInCart(string);
   // return  await CartDatabase.cartDatabaseInstance.isProductInCart(string);
    
  }
}
