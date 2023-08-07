import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hbk/Data/DataSource/Static/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Static/sized_box.dart';
import 'package:hbk/Data/DataSource/Static/strings.dart';
import 'package:hbk/Data/DataSource/Static/text_styles.dart';
import 'package:hbk/Presentation/Common/app_text.dart';
import 'package:hbk/Presentation/Common/custom_app_bar.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/HomeScreen/Components/category_product.dart';

import 'Components/home_carousel.dart';

class HomeScreen extends StatelessWidget {
  //GlobalKey<ScaffoldState> scaffoldKey;
   const HomeScreen( {super.key});

  @override
  Widget build(BuildContext context) {

    return    Scaffold(
      backgroundColor: AppColors.whiteColor,

      //  drawer: Drawer(),

        // appBar: CustomAppBar(onBackTap: (){
        //   scaffoldKey.currentState!.openDrawer();
        //
        // },),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child:  SingleChildScrollView(
            child: Column(children: [
              CustomSizedBox.height(10),
  ///Top Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                    AppText(AppStrings.accountBalance, style: Styles.circularStdRegular(context,fontWeight: FontWeight.w500,fontSize: 16),),
                   RichText(text: TextSpan(children: [
                     TextSpan(
                         text: 'Rs ',
                         style: Styles.circularStdBold(context,fontSize: 16.sp
                           )),
                     TextSpan(
                         text: '50,490 ',
                         style: Styles.circularStdBold(context,fontWeight: FontWeight.w900,fontSize: 20
                         )),


                   ]))

                  ],
                ),
              CustomSizedBox.height(20),
///Home Coruosel sliding Images
              const HomeCarousel(),
              CustomSizedBox.height(20),
              ///Category Product
              Align(
                  alignment: Alignment.centerLeft,
                  child: AppText(AppStrings.category, style: Styles.circularStdRegular(context,fontWeight: FontWeight.w500,fontSize: 20.sp),)),
              CustomSizedBox.height(20),
const CategoryProduct(),

              ///New Arrival

              Align(
                  alignment: Alignment.centerLeft,
                  child: AppText(AppStrings.newArrival, style: Styles.circularStdRegular(context,fontWeight: FontWeight.w500,fontSize: 20.sp),)),
///to be continued ..
              CustomSizedBox.height(200),

            ],),
          )
        )

    );
  }
}
