import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hbk/Data/DataSource/Static/assets.dart';
import 'package:hbk/Data/DataSource/Static/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Static/sized_box.dart';
import 'package:hbk/Data/DataSource/Static/strings.dart';
import 'package:hbk/Data/DataSource/Static/text_styles.dart';
import 'package:hbk/Data/DataSource/Static/utils.dart';
import 'package:hbk/Presentation/Common/app_text.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/DashboardBottomScreen/Components/bottom_cards.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/DashboardBottomScreen/Components/chart_dashboard.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/DashboardBottomScreen/Components/custom_card.dart';

import 'Components/info_card.dart';

class DashboardBottom extends StatelessWidget {
  const DashboardBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),

        child: SingleChildScrollView(
          child: Column(
            children: [
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
              ///info widget
              SizedBox(
                // color: Colors.red,
                height: 65.sp,
                width: 1.sw/1.15,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                      return   CustomInfoWidget(nameInfo: Utils.customInfoData[index].amount.toString(), nameInfoValue: Utils.customInfoData[index].name.toString(),);
                    }, separatorBuilder: (context,index){
                  return SizedBox(width: 15.sp,);
                }, itemCount: Utils.customInfoData.length),
              ),
              ///Chart
              FractionallySizedBox(
                widthFactor: 1.12,
                child: VerticalBarChart(),
              ),

              ///row
              SizedBox(
               // color: Colors.red,
                height: 65.sp,
                width: 1.sw/1.15,
                child: ListView.separated(
                  //  shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                      return  CustomCard(name:  Utils.customCardData[index].name.toString(), amount: Utils.customCardData[index].amount.toString());

                    }, separatorBuilder: (context,index){
                     return SizedBox(width: 5.sp,);
                }, itemCount: Utils.customCardData.length),
              ),
CustomSizedBox.height(10),
              SizedBox(
                // color: Colors.red,
                height: 65.sp,
                width: 1.sw/1.15,
                child: ListView.separated(
                   // shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                      return  CustomCard(name:  Utils.customCardData1[index].name.toString(), amount: Utils.customCardData1[index].amount.toString());

                    }, separatorBuilder: (context,index){
                  return SizedBox(width: 5.sp,);
                }, itemCount: Utils.customCardData1.length),
              ),
              CustomSizedBox.height(10),
              SizedBox(
                // color: Colors.red,
                height: 100.sp,
                width: 1.sw,
                child: ListView.separated(
                  //  shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                      return const BottomCards(imageAsset: Assets.rewardIcon, mainStatus: "Running", statusValue: "blue");
                    }, separatorBuilder: (context,index){
                  return SizedBox(width: 5.sp,);
                }, itemCount: 2),
              ),
              CustomSizedBox.height(10),
              SizedBox(
                // color: Colors.red,
                height: 100.sp,
                width: 1.sw,
                child: ListView.separated(
                   // shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                      return const BottomCards(imageAsset: Assets.rewardIcon, mainStatus: "Running", statusValue: "blue");
                    }, separatorBuilder: (context,index){
                  return SizedBox(width: 5.sp,);
                }, itemCount: 2),
              ),
              CustomSizedBox.height(10),
              SizedBox(
                // color: Colors.red,
                height: 100.sp,
                width: 1.sw,
                child: ListView.separated(
                    //shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                      return const BottomCards(imageAsset: Assets.rewardIcon, mainStatus: "Running", statusValue: "blue");
                    }, separatorBuilder: (context,index){
                  return SizedBox(width: 5.sp,);
                }, itemCount: 2),
              ),
              CustomSizedBox.height(10),

              // SizedBox(
              //   height: 300,
              //   width: 1.sw,
              //   child: GridView.builder(
              //
              //     shrinkWrap: true,
              //     scrollDirection: Axis.horizontal,
              //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: 2, // Display two elements per row
              //       mainAxisSpacing: 5.sp,
              //       crossAxisSpacing: 10.sp// Horizontal spacing between items
              //     ),
              //     itemBuilder: (context, index) {
              //       return const BottomCards(
              //         imageAsset: Assets.rewardIcon, // Your image asset
              //         mainStatus: "Running", // Your main status text
              //         statusValue: "blue", // Your status value
              //       );
              //     },
              //     itemCount: 4, // Total number of items (2 elements in 2 rows)
              //   ),
              // ),
          // Container(
          //   // color: Colors.red,
          //   height: 65.sp,
          //   width: 1.sw/1.15,
          //
          // child: Row(
          //   children: <Widget>[
          //
          //
          //     for (var i in Utils.customCardData1)
          //       Column(
          //         children: [
          //           CustomCard(name: i.name.toString(), amount: i.amount.toString()),
          //           SizedBox(width: 8.sp), // Add spacing between CustomCard widgets
          //         ],
          //       )
          //
          //
          //   ],
          // ),
          // )

            ],
          ),
        ),
      ),
    );
  }
}
