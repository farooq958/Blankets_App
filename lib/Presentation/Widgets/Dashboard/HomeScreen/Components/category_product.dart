import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hbk/Application/Services/Navigation/navigation.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Resources/sized_box.dart';
import 'package:hbk/Data/DataSource/Resources/text_styles.dart';
import 'package:hbk/Data/DataSource/Resources/utils.dart';
import 'package:hbk/Presentation/Common/app_text.dart';
import 'package:hbk/Presentation/Common/image_widgets.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/Product/product.dart';

class CategoryProduct extends StatelessWidget {
 final PageController? pageController;
 final bool? isGuest;
  const CategoryProduct({super.key, this.pageController, this.isGuest});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 1.sw,
      child: ListView.separated(
        shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){

        return GestureDetector(
          onTap:(){
            ///not used
Utils.productTitle.value=Utils.categoryDummyProduct[index].productName.toString();
///used
            Navigate.to(context, ProductScreen(title: Utils.categoryDummyProduct[index].productName.toString(),isGuest: isGuest,));

//pageController?.jumpToPage(2);


          },
          child: SizedBox(
            height: 105.sp,
            width: 120.sp,

            child: Column(

              children: [

                AssetImageWidget(url: Utils.categoryDummyProduct[index].productImage.toString(),isCircle: true,radius: 40.sp,),
              CustomSizedBox.height(5),
                AppText(Utils.categoryDummyProduct[index].productName.toString(), style: Styles.circularStdRegular(context,fontWeight: FontWeight.w600,color: Colors.black))
              ],

            ),
          ),
        );

      }, separatorBuilder: (context,index){

        return index!=0?CustomSizedBox.width(5):CustomSizedBox.width(0);

      }, itemCount: Utils.categoryDummyProduct.length),
    );
  }
}
