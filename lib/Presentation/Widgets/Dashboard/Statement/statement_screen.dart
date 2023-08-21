import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:cross_scroll/cross_scroll.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linear_datepicker/flutter_datepicker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hbk/Application/Services/Pdf/pdf_downlaod.dart';
import 'package:hbk/Data/DataSource/Resources/assets.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Resources/sized_box.dart';
import 'package:hbk/Data/DataSource/Resources/strings.dart';
import 'package:hbk/Data/DataSource/Resources/text_styles.dart';
import 'package:hbk/Presentation/Common/app_buttons.dart';
import 'package:hbk/Presentation/Common/app_text.dart';
import 'package:hbk/Presentation/Common/custom_appbar_with_back_button.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/Statement/Component/pdf_layout.dart';

import 'Component/customer_statement_date_picker.dart';

class CustomerStatementScreen extends  StatelessWidget {
   CustomerStatementScreen({super.key});

  final List<InvoiceData> invoiceData = [
    InvoiceData("Jan, 2023", "", "Rs 0 Cr", 'Rs 10,500 Cr'),

    InvoiceData("04 Jan, 2023", "Invoice", "Online to MBL Gloabl S#3595+3598(5lac+5lac) On 31.1", 'Rs 102,000 Cr'),

    InvoiceData("04 Jan, 2023", "Invoice", "A/R invoices-C00066", 'Rs 102,000 Cr'),

    InvoiceData("Feb, 2023", "", "Rs 0 Cr", 'Rs 10,500 Cr'),

    InvoiceData("04 Feb, 2023", "Invoice", "A/R invoices-C00066", 'Rs 102,000 Cr'),

    InvoiceData("04 Feb, 2023", "Invoice", "Online to MBL Gloabl S#3595+3598(5lac+5lac) On 31.1", 'Rs 102,000 Cr'),

    InvoiceData("04 Feb, 2023", "Invoice", "Online to MBL Global Txt Slip# 3593", 'Rs 102,000 Cr'),
    // Add more data for other months
  ];

  @override
  Widget build(BuildContext context) {
    final List<String> invoiceTitle=["Date","Type","Narration","Amount"];

    return Scaffold(
      appBar: const CustomAppBarWithBackButton(title: 'Customer Statement',iconColor: AppColors.primaryColor,iconData: Icons.arrow_back_ios,padding: EdgeInsets.only(left: 5),iconSize: 15,),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [

                CustomSizedBox.height(10),
                ///Top Row
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
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


                      ])),


                    ],


                  ),
                ),
                Row(
                  children: [
                    const Spacer(),

                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: CustomButton(
                          bgColor: AppColors.whiteColor,
                          borderColor: AppColors.primaryColor,
                          textColor: AppColors.primaryColor,
                          textFontWeight: FontWeight.w400,
                          trailingIcon: Assets.calenderIcon,
borderThickness: 1.5,
trailIconWidth: 19.sp,
                          trailIconHeight: 19,
                          onTap: (){
                            showDatePicker(context);
                          }, text: 'Jan-Feb 2023',verticalMargin: 20,verticalPadding: 10,),
                      ),
                    ),
                  ],
                ),

 //      Expanded(
 //        child: CrossScroll(
 //          horizontalScroll: CrossScrollDesign(
 //              physics: const BouncingScrollPhysics(),
 //              padding: const EdgeInsets.only(
 //                left: 1.0,
 //                right: 9.0,
 //              )),
 //          verticalScroll: CrossScrollDesign(
 //              physics: const BouncingScrollPhysics(),
 //              padding:
 //              const EdgeInsets.only(top: 10, bottom: 70))
 //
 //        ,
 //          child: Container(
 //           // padding: const EdgeInsets.all(2),
 //            decoration: BoxDecoration(
 //                color: AppColors.whiteColor,
 //                borderRadius: BorderRadius.circular(10)),
 //            child: Column(
 //            children: <Widget>[
 //
 //              Row(
 //                mainAxisAlignment: MainAxisAlignment.start,
 //                children: [
 //
 //                  for (var i = 0; i < invoiceTitle.length; i++)
 //                    Container(
 //                      height: 60.sp,
 //                     width: 110.sp,
 //                     // margin: EdgeInsets.only(right: 0),
 //
 //                      alignment: Alignment.center,
 //                      padding: EdgeInsets.only(right: 20.sp),
 //                      color: AppColors.primaryColor,
 //                      child: AppText(
 //                        invoiceTitle[i],
 //                        textAlign: TextAlign.center,
 //                        style: Styles.circularStdBold(context,
 //                            fontSize: 13.sp,
 //                            fontWeight: FontWeight.w500,
 //                            color: AppColors.whiteColor),
 //                      ),
 //                    ),
 //
 //
 //
 //
 //
 //
 //
 //                ],
 //              ),
 //               showInvoiceData(context),
 //              SizedBox(
 //                width: 1.sw,
 //                child: FractionallySizedBox(
 //                  widthFactor: 1,
 //                  child: CustomButton(gapWidth: 10,textFontWeight: FontWeight.w400, imageWidth: 20.sp,imageHeight: 20,leadingSvgIcon: true,leadingIcon:(Assets.downloadIcon),onTap: () async {
 //
 // await PdfDownload().generatePdf(invoiceTitle,invoiceData,PDFLayouts().showCustomerStatementDataPdf(invoiceData),PDFLayouts().pdfTitleCustomerStatement(invoiceTitle)).then((value) => null);
 //
 //
 //                  }, text: "Download",horizontalMargin: 20,),
 //                ),
 //              )
 //
 //            ],
 //          ),),
 //
 //        ),
 //      )
///data table
                Row(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,

                        child: DataTableTheme(
                          data: DataTableThemeData(
                            headingRowColor: MaterialStateColor.resolveWith((states) => AppColors.primaryColor),
                            //  dataRowColor: MaterialStateColor.resolveWith((states) => Colors.grey.shade100),
                            headingTextStyle: Styles.circularStdBold(context,fontSize: 15.sp,color: AppColors.whiteColor),
                           // dataTextStyle: Styles.circularStdBold(context,fontSize: 15.sp,color: AppColors.primaryColor),
                          ),
                          child: DataTable(
                            horizontalMargin: 10,
                            columnSpacing: 1.sw/20,
dataRowMaxHeight: 78,
                            columns:  [
                              DataColumn(label: AppText('Date',style:Styles.circularStdRegular(context,fontSize: 15.sp,color: AppColors.whiteColor,fontWeight: FontWeight.w500),)),
                              DataColumn(label: AppText('Type',style: Styles.circularStdRegular(context,fontSize: 15.sp,color: AppColors.whiteColor,fontWeight: FontWeight.w500),)),
                              DataColumn(label: AppText(

                                'Narration',

                                style: Styles.circularStdRegular(context,fontSize: 15.sp,color: AppColors.whiteColor,fontWeight: FontWeight.w500),)),
                              DataColumn(label: AppText('Amount',style:Styles.circularStdRegular(context,fontSize: 15.sp,color: AppColors.whiteColor,fontWeight: FontWeight.w500),)),
                            ],
                            rows: [
                              for(int index=0 ;index<invoiceData.length;index++)
                                DataRow(


                                    cells: [
                                  DataCell(SizedBox(
                                    height: 20,


                                      child: AppText(invoiceData[index].date, style: Styles.circularStdRegular(context,color: invoiceData[index].type==""? AppColors.primaryColor:AppColors.blackColor),))),

                                  DataCell(AppText(invoiceData[index].type,

                                    style: Styles.circularStdRegular(context,color: invoiceData[index].type==""? AppColors.primaryColor:AppColors.blackColor),)),
                                  DataCell(SizedBox(
                                    width: 120.sp,
                                    child: AppText(invoiceData[index].narration,
                                      maxLine: 5,
                                      style: Styles.circularStdRegular(context,color: invoiceData[index].type==""? AppColors.primaryColor:AppColors.blackColor),),
                                  )),
                                  DataCell(AppText(invoiceData[index].amount.toString(), style: Styles.circularStdRegular(context,color: invoiceData[index].type==""? AppColors.primaryColor:AppColors.blackColor),)),

                                ],
                                    color:MaterialStateColor.resolveWith((states) => invoiceData[index].type==""? AppColors.lightInvoiceColor:AppColors.whiteColor)
                                ),


                            ],
                            dividerThickness: 0.0,
                           // dataRowHeight: 32,// Set the thickness of the divider

                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                CustomSizedBox.height(50),

              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: SizedBox(
              width: 1.sw,
              child: FractionallySizedBox(
                widthFactor: 1,
                child: CustomButton(gapWidth: 10,textFontWeight: FontWeight.w400, imageWidth: 20.sp,imageHeight: 20,leadingSvgIcon: true,leadingIcon:(Assets.downloadIcon),onTap: () async {

                  // await PdfDownload().generatePdf(invoiceTitle,invoiceData,PDFLayouts().showCustomerStatementDataPdf(invoiceData),PDFLayouts().pdfTitleCustomerStatement(invoiceTitle)).then((value) => null);


                }, text: "Download",horizontalMargin: 20,),
              ),
            ),
          )
        ],
      ),
    );
  }
  void showDatePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)

      ),
      builder: (BuildContext builder) {
        return SizedBox(
          height: 600,
          width: 1.sw,
          child: buildDateRangePicker(context),
        );
      },
    );
  }



  Widget showInvoiceData(context) {
    List<List<InvoiceData>> invoiceFinalData = [
      [],
      [],
      [],
      [],

    ];
    List<List<InvoiceData>> inData = [invoiceData];


    List<Widget> row = [];

    for(int i=0;i<invoiceData.length;i++){
      List<Widget> textWidget = [];

      textWidget.add(Container(
          height: 40,
          width: 100,
padding: EdgeInsets.only(left: 10.sp),

alignment: Alignment.centerLeft,
//color: AppColors.primaryColor,
          child: AppText(invoiceData[i].date, style: Styles.circularStdRegular(context,color:  invoiceData[i].type==""?AppColors.primaryColor:AppColors.blackColor,fontWeight:  invoiceData[i].type==""?FontWeight.w500:FontWeight.normal))));
      textWidget.add(SizedBox(width: 20.sp,));
    textWidget.add(AppText(invoiceData[i].type, style: Styles.circularStdRegular(context,color:  invoiceData[i].type==""?AppColors.primaryColor:AppColors.blackColor,fontWeight:  invoiceData[i].type==""?FontWeight.w500:FontWeight.normal)));
      textWidget.add(SizedBox(width: 20.sp,));
    textWidget.add(Container(
      padding: invoiceData[i].type==""? EdgeInsets.only(left: 50.sp):null,
     // height: 50.sp,
      width: 100,
      margin: const EdgeInsets.only(left: 20),
      child: invoiceData[i].type==""?Center(
        child: SingleChildScrollView(
          child: FittedBox(
            child: AppText(invoiceData[i].narration,
                maxLine:4,style: Styles.circularStdRegular(context,color: invoiceData[i].type==""?AppColors.primaryColor:AppColors.blackColor,fontWeight:  invoiceData[i].type==""?FontWeight.w500:FontWeight.normal)),
          ),
        ),
      ) : Center(
        child: SingleChildScrollView(
          child: AppText(invoiceData[i].narration,
              maxLine:4,style: Styles.circularStdRegular(context,color: invoiceData[i].type==""?AppColors.primaryColor:AppColors.blackColor,fontWeight:  invoiceData[i].type==""?FontWeight.w500:FontWeight.normal)),
        ),
      ),
    ));
      textWidget.add(SizedBox(width: 20.sp,));
    textWidget.add(Container(
        padding: invoiceData[i].type==""? EdgeInsets.only(left: 50.sp):null,

        child: AppText(invoiceData[i].amount, style: Styles.circularStdRegular(context,color: invoiceData[i].type==""?AppColors.primaryColor:AppColors.blackColor,fontWeight:  invoiceData[i].type==""?FontWeight.w500:FontWeight.normal))));
      row.add(Column(
        children: [
          Container(
            width:invoiceData[i].type==""? 1.sw *1.15:null,

            color: invoiceData[i].type==""?AppColors.lightInvoiceColor:AppColors.whiteColor,
            child: Row(
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
class InvoiceData {
  final String date;
  final String type;
  final String narration;
  final String amount;

  InvoiceData(this.date, this.type, this.narration, this.amount);
}
