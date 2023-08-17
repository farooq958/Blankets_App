import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hbk/Data/DataSource/Resources/assets.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Resources/imports.dart';
import 'package:hbk/Data/DataSource/Resources/sized_box.dart';
import 'package:hbk/Data/DataSource/Resources/text_styles.dart';
import 'package:hbk/Domain/Models/HomeScreen/product_model.dart';
import 'package:hbk/Presentation/Common/app_buttons.dart';
import 'package:hbk/Presentation/Common/app_text.dart';
import 'package:hbk/Presentation/Common/circle_icon_button.dart';
import 'package:hbk/Presentation/Common/custom_appbar_with_back_button.dart';
import 'package:hbk/Presentation/Common/image_widgets.dart';

class ProductDetails extends  StatelessWidget {
  final ProductModel? pd;
  final  bool? isGuest;
  const ProductDetails( {super.key,this.pd, this.isGuest,});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBarWithBackButton(title: " ",padding: EdgeInsets.only(left: 6.sp),iconData: Icons.arrow_back_ios,iconSize: 15.sp,

      iconColor: AppColors.primaryColor,
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
              Center(child: AssetImageWidget(url: Assets.appLogo,color: AppColors.primaryColor,width: 270.w,height: 220.sp,)),
Row(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
children: [
              Expanded(
                  flex: 2,
                  child:
                  AppText("Belpla Teenagers 1 Ply Single Bed Blanket",maxLine: 2, style: Styles.circularStdBold(context,fontWeight: FontWeight.w500,fontSize: 18.sp))
              ),

 isGuest==true? const Expanded(child: SizedBox(height: 0,width: 0,)): Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleIconButton(
                    icon: Icons.remove,
                    onPressed: (){},
                    width: 25.w,
                    height: 25.h,
                    iconSize: 15,
                  ),
                  CustomSizedBox.width(10.w),

                  AppText('5',
                      style: Styles.circularStdBold(context,fontWeight: FontWeight.w500)),
                  CustomSizedBox.width(10.w),
                  CircleIconButton(
                    icon: Icons.add,
                    onPressed: () {},
                    width: 25.w,
                    height: 25.h,
                    iconSize: 15.sp,
                    color: AppColors.primaryColor,
                    iconColor: AppColors.whiteColor,
                  )
                ],
              ),
            ),
          )


],
),
              isGuest==true? const SizedBox(height: 0,width: 0,): CustomSizedBox.height(10),
              isGuest==true? const SizedBox(height: 0,width: 0,): Align(
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
                        text: '5490',
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
              const ProductTile(tileColor: AppColors.productTileColor,leadingName: 'Product origin',trailingName: 'China',),
              const ProductTile(tileColor: AppColors.whiteColor,leadingName: 'Category',trailingName: '1 PLY Double bet blanket',),
              const ProductTile(tileColor: AppColors.productTileColor,leadingName: 'Product brand',trailingName: 'Burjjan',),
              const ProductTile(tileColor: AppColors.whiteColor,leadingName: 'Product packaging',trailingName: 'Play bag',),
              const ProductTile(tileColor: AppColors.productTileColor,leadingName: 'Specification',trailingName: '200 x 240 CMS',),
              const ProductTile(tileColor: AppColors.whiteColor,leadingName: 'Embossed',trailingName: 'Yes',),
              isGuest==true?  const SizedBox(height: 0,width: 0,):ListTile(
                tileColor: AppColors.whiteColor,

                contentPadding: const EdgeInsets.only(left: 10),
                leading:
                Column(
                  children: [
                    Expanded(child: AppText('Total', style: Styles.circularStdBold(context,fontWeight: FontWeight.w500,fontSize: 14.sp))),
                  Expanded(child: AppText('Rs 890,230', style: Styles.circularStdBold(context,fontWeight: FontWeight.w600,fontSize: 15.sp))),

                  ],
                )
                ,

                trailing:  SizedBox(

                    height: 110.h,
                    width: 200,
                    child: CustomButton(onTap: () {  },
                      textFontWeight: FontWeight.normal,
                      textSize: 16,

                      text: ' Add to cart',verticalPadding: 12,leadingIcon:Assets.bagIcon,leadingSvgIcon: true,horizontalMargin: 10, )),

              ),
              CustomSizedBox.height(15)

            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: isGuest==true? CustomButton(onTap: () {

            Navigate.toReplaceAll(context, const LoginScreen());

          }, text: 'Login first to order',):const SizedBox(height: 0,width: 0,)
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
    super.key, this.leadingName, this.trailingName, this.tileColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: tileColor,
      leading:
    AppText(leadingName.toString(), style: Styles.circularStdBold(context,fontWeight: FontWeight.w500,fontSize: 14.sp))
      ,

    trailing:  AppText(trailingName.toString(), style: Styles.circularStdBold(context,fontWeight: FontWeight.w600,fontSize: 15.sp)),
    );
  }
}
