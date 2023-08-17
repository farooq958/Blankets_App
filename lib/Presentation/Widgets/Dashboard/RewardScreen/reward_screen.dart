import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:cross_scroll/cross_scroll.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linear_datepicker/flutter_datepicker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hbk/Data/DataSource/Resources/assets.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Resources/sized_box.dart';
import 'package:hbk/Data/DataSource/Resources/strings.dart';
import 'package:hbk/Data/DataSource/Resources/text_styles.dart';
import 'package:hbk/Presentation/Common/app_buttons.dart';
import 'package:hbk/Presentation/Common/app_text.dart';
import 'package:hbk/Presentation/Common/custom_appbar_with_back_button.dart';
import 'package:hbk/Presentation/Common/custom_textfield_with_on_tap.dart';



class RewardScreen extends  StatelessWidget {
  RewardScreen({super.key});

  final List<RewardModel> rewardListData = [

RewardModel(session: '01/05/ - 06/06/2023',status: 'loyal silver',netSale: 'Rs 1,754,000',bonusReward: 'Rs 1,754,000',loyalReward: 'Rs 1,754,000',totalReward: 'Rs 1,754,000'),
    RewardModel(session: '01/05/ - 06/06/2023',status: 'loyal silver',netSale: 'Rs 1,754,000',bonusReward: 'Rs 1,754,000',loyalReward: 'Rs 1,754,000',totalReward: 'Rs 1,754,000'),
    RewardModel(session: '01/05/ - 06/06/2023',status: 'loyal silver',netSale: 'Rs 1,754,000',bonusReward: 'Rs 1,754,000',loyalReward: 'Rs 1,754,000',totalReward: 'Rs 1,754,000'),RewardModel(session: '01/05/ - 06/06/2023',status: 'loyal silver',netSale: 'Rs 1,754,000',bonusReward: 'Rs 1,754,000',loyalReward: 'Rs 1,754,000',totalReward: 'Rs 1,754,000'),
    RewardModel(session: '01/05/ - 06/06/2023',status: 'loyal silver',netSale: 'Rs 1,754,000',bonusReward: 'Rs 1,754,000',loyalReward: 'Rs 1,754,000',totalReward: 'Rs 1,754,000'),
    RewardModel(session: '01/05/ - 06/06/2023',status: 'loyal silver',netSale: 'Rs 1,754,000',bonusReward: 'Rs 1,754,000',loyalReward: 'Rs 1,754,000',totalReward: 'Rs 1,754,000'),
    RewardModel(session: '01/05/ - 06/06/2023',status: 'loyal silver',netSale: 'Rs 1,754,000',bonusReward: 'Rs 1,754,000',loyalReward: 'Rs 1,754,000',totalReward: 'Rs 1,754,000'),


    // Add more data for other months
  ];
  final List<String> invoiceTitle=["Session","Status","Net sale","Bonus reward",'Loyal reward','Total reward'];

 // final TextEditingController searchControllerPrice=TextEditingController();
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: const CustomAppBarWithBackButton(title: 'Rewards',iconColor: AppColors.primaryColor,iconData: Icons.arrow_back_ios,padding: EdgeInsets.only(left: 5),iconSize: 15,),
      body: Column(
        children: [

          CustomSizedBox.height(10),
          ///Top Row


          Expanded(
            child: CrossScroll(
              horizontalScroll: CrossScrollDesign(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(
                    left: 1.0,
                    right: 9.0,
                  )),
              verticalScroll: CrossScrollDesign(
                  physics: const BouncingScrollPhysics(),
                  padding:
                  const EdgeInsets.only(top: 10, bottom: 70))

              ,
              child: Container(
                // padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[


                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        for (var i = 0; i < invoiceTitle.length; i++)
                          Container(
                            height: 60.sp,
                            width: i==0? 150.sp:120.sp,
                            // margin: EdgeInsets.only(right: 0),

                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 25.sp),
                            color: AppColors.primaryColor,
                            child: AppText(
                              invoiceTitle[i],
                              // textAlign:  TextAlign.center,
                              style: Styles.circularStdBold(context,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.whiteColor),
                            ),
                          ),







                      ],
                    ),
                    Padding(

                        padding: EdgeInsets.only(right: 0.sp),
                        child: showRewardListData(context)),


                  ],
                ),),

            ),
          ),
          SizedBox(
            width: 1.sw,
            child: FractionallySizedBox(
              widthFactor: 1,
              child: CustomButton(gapWidth: 10,textFontWeight: FontWeight.w400, imageWidth: 20.sp,imageHeight: 20,leadingSvgIcon: true,leadingIcon:(Assets.downloadIcon),onTap: (){}, text: "Download",horizontalMargin: 20,),
            ),
          ),
          CustomSizedBox.height(10)

          // Row(
          //   children: [
          //     Expanded(
          //       child: SingleChildScrollView(
          //         scrollDirection: Axis.horizontal,
          //
          //         child: DataTableTheme(
          //           data: DataTableThemeData(
          //             headingRowColor: MaterialStateColor.resolveWith((states) => AppColors.primaryColor),
          //             //  dataRowColor: MaterialStateColor.resolveWith((states) => Colors.grey.shade100),
          //             headingTextStyle: Styles.circularStdBold(context,fontSize: 15.sp,color: AppColors.whiteColor),
          //            // dataTextStyle: Styles.circularStdBold(context,fontSize: 15.sp,color: AppColors.primaryColor),
          //           ),
          //           child: DataTable(
          //             horizontalMargin: 10,
          //             columnSpacing: 1.sw/20,
          //
          //             columns:  [
          //               DataColumn(label: AppText('Date',style:Styles.circularStdRegular(context,fontSize: 15.sp,color: AppColors.whiteColor,fontWeight: FontWeight.w500),)),
          //               DataColumn(label: AppText('Type',style: Styles.circularStdRegular(context,fontSize: 15.sp,color: AppColors.whiteColor,fontWeight: FontWeight.w500),)),
          //               DataColumn(label: AppText(
          //
          //                 'Narration',
          //
          //                 style: Styles.circularStdRegular(context,fontSize: 15.sp,color: AppColors.whiteColor,fontWeight: FontWeight.w500),)),
          //               DataColumn(label: AppText('Amount',style:Styles.circularStdRegular(context,fontSize: 15.sp,color: AppColors.whiteColor,fontWeight: FontWeight.w500),)),
          //             ],
          //             rows: [
          //               for(int index=0 ;index<invoiceData.length;index++)
          //                 DataRow(cells: [
          //                   DataCell(SizedBox(
          //                     height: 20,
          //
          //
          //                       child: AppText(invoiceData[index].date, style: Styles.circularStdRegular(context,color: invoiceData[index].type=="start"? AppColors.primaryColor:AppColors.blackColor),))),
          //
          //                   DataCell(AppText(invoiceData[index].type,
          //
          //                     style: Styles.circularStdRegular(context,color: invoiceData[index].type==""? AppColors.primaryColor:AppColors.blackColor),)),
          //                   DataCell(SizedBox(
          //                     width: 100.sp,
          //                     child: SingleChildScrollView(
          //
          //                       child: AppText(invoiceData[index].narration,
          //                         maxLine: 5,
          //                         style: Styles.circularStdRegular(context,color: invoiceData[index].type=="start"? AppColors.primaryColor:AppColors.blackColor),),
          //                     ),
          //                   )),
          //                   DataCell(AppText(invoiceData[index].amount.toString(), style: Styles.circularStdRegular(context,color: invoiceData[index].type=="start"? AppColors.primaryColor:AppColors.blackColor),)),
          //
          //                 ],
          //                     color:MaterialStateColor.resolveWith((states) => invoiceData[index].type=="start"? AppColors.lightInvoiceColor:AppColors.whiteColor)
          //                 ),
          //
          //
          //             ],
          //             dividerThickness: 0.0,
          //             dataRowHeight: 32,// Set the thickness of the divider
          //
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),

        ],
      ),
    );
  }




  Widget showRewardListData(context) {
    List<List<RewardModel>> invoiceFinalData = [
      [],
      [],
      [],
      [],

    ];
    List<List<RewardModel>> inData = [rewardListData];


    List<Widget> row = [];

    for(int i=0;i<rewardListData.length;i++){
      List<Widget> textWidget = [];

      textWidget.add(Container(
        alignment: Alignment.centerLeft,
      //  width: 130,
       // color: Colors.red,
         // margin: EdgeInsets.only(right: 50.sp),
          child: AppText(rewardListData[i].session.toString(), style: Styles.circularStdRegular(context,color: AppColors.blackColor,fontWeight: FontWeight.normal))));
    //  textWidget.add(SizedBox(width: 10.sp,));
      textWidget.add(SizedBox(width: 40.sp,));
      textWidget.add(Container(
          //width: 100.sp,
          //   color: Colors.black,
          alignment: Alignment.centerLeft,
        //  padding: EdgeInsets.only(right: 100.sp),

          child: AppText(rewardListData[i].status.toString(),
             // maxLine: 4,
              style: Styles.circularStdRegular(context,color:  AppColors.blackColor,fontWeight: FontWeight.normal))));
      textWidget.add(SizedBox(width: 40.sp,));
      textWidget.add(Container(
        // padding: priceListData[i].item==""? EdgeInsets.only(left: 50.sp):null,
        // height: 50.sp,
       // width: 100,
        alignment: Alignment.centerLeft,
       // padding: EdgeInsets.only(right: 10.sp),

        // margin: const EdgeInsets.only(left: 20),
        child:  Center(
          child: SingleChildScrollView(
            child: AppText(rewardListData[i].netSale.toString(),
                style: Styles.circularStdRegular(context,color: AppColors.blackColor,fontWeight:  FontWeight.normal)),
          ),
        ),
      ));
      textWidget.add(SizedBox(width: 40.sp,));


      textWidget.add(Container(
        // padding: priceListData[i].item==""? EdgeInsets.only(left: 50.sp):null,
          alignment: Alignment.centerLeft,
          //padding: EdgeInsets.only(right: 30.sp),
          child: AppText(rewardListData[i].bonusReward.toString(), style: Styles.circularStdRegular(context,color:AppColors.blackColor,fontWeight: FontWeight.normal))));
      textWidget.add(SizedBox(width: 40.sp,));
      textWidget.add(Container(
        // padding: priceListData[i].item==""? EdgeInsets.only(left: 50.sp):null,
          alignment: Alignment.centerLeft,
          //padding: EdgeInsets.only(right: 30.sp),
          child: AppText(rewardListData[i].loyalReward.toString(), style: Styles.circularStdRegular(context,color:AppColors.blackColor,fontWeight: FontWeight.normal))));
      textWidget.add(SizedBox(width: 40.sp,));
      textWidget.add(Container(
        // padding: priceListData[i].item==""? EdgeInsets.only(left: 50.sp):null,
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(left: 10.sp),
          //padding: EdgeInsets.only(right: 30.sp),
          child: AppText(rewardListData[i].totalReward.toString(), style: Styles.circularStdRegular(context,color:AppColors.blackColor,fontWeight: FontWeight.normal))));
      row.add(Column(

        children: [
          CustomSizedBox.height(10.sp),
          Container(
            // width:priceListData[i].title!=null? 1.sw *1.15:null,

            //  color: priceListData[i].title!=null?AppColors.lightInvoiceColor:AppColors.whiteColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [

                ...textWidget,


              ],
            ),
          ),
          SizedBox(height: 20.sp,)
        ],
      ));


    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: row,
    );


  }
}
class RewardModel {
  final String? session;
  final String? status;
  final String? netSale;
  final String? bonusReward;
  final String? loyalReward;
  final String? totalReward;

  RewardModel(   {this.session,this.status, this.netSale, this.bonusReward, this.loyalReward, this.totalReward,});
}
