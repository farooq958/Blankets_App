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
import 'package:hbk/Presentation/Common/custom_textfield_with_on_tap.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/Statement/Component/pdf_layout.dart';



class PriceListScreen extends  StatelessWidget {
  PriceListScreen({super.key});

  final List<PriceListModel> priceListData = [
    PriceListModel( "", "Rs 0 Cr", 'Rs 10,500 Cr',country: 'China'),
    PriceListModel( "", "Rs 0 Cr", 'Rs 10,500 Cr',title:"Single bed & Medium blanket" ,ctn: "12 pcs",price: "Rs 10,500"),
    PriceListModel("Baby Perla Gold 1 Ply Blanket ( Large )", "160 x 120 CMS", 'Gift box',ctn: "12 pcs",price: "Rs 10,500"),

    PriceListModel(  "Burjjan 1 ply Double bed embossed blanket","160 x 120 CMS", 'Gift box',ctn: "12 pcs",price: "Rs 10,500"),
    PriceListModel( "", "Rs 0 Cr", 'Rs 10,500 Cr',country: 'Spain'),
    PriceListModel( "", "Rs 0 Cr", 'Rs 10,500 Cr',title:"Single bed & Medium blanket",ctn: "12 pcs",price: "Rs 10,500" ),
    PriceListModel( "Baby Perla Gold 1 Ply Blanket ( Large )","160 x 120 CMS", 'Gift box',ctn: "12 pcs",price: "Rs 10,500"),




    // Add more data for other months
  ];
  final List<String> invoiceTitle=["#","Item","Specification","Packing","Pcs/Ctn","Price"];

  final TextEditingController searchControllerPrice=TextEditingController();
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: const CustomAppBarWithBackButton(title: 'Price list',iconColor: AppColors.primaryColor,iconData: Icons.arrow_back_ios,padding: EdgeInsets.only(left: 6),iconSize: 15,),
      body: Stack(
        children: [
          Column(
            children: [

              CustomSizedBox.height(10),
              ///Top Row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: CustomTextFieldWithOnTap(
                    isShadowRequired: true,

                    prefixIcon: SvgPicture.asset(Assets.searchIcon,color: AppColors.greyColor,) ,

                    isBorderRequired: false,
                    onChanged: (v){
                      ///tobe evaluated
                    },
                    borderRadius:30.sp,
                    hintTextColor: AppColors.greyColor,
                    controller: searchControllerPrice, hintText: 'Search products price', textInputType: TextInputType.text),
              ),

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
                      children: <Widget>[

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            for (var i = 0; i < invoiceTitle.length; i++)
                              Container(
                                height: 60.sp,
                                width: i==0?50:100.sp,
                                // margin: EdgeInsets.only(right: 0),

                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: i==0?30.sp:10),
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
                        showPriceListData(context),
                        // SizedBox(
                        //   width: 1.sw,
                        //   child: FractionallySizedBox(
                        //     widthFactor: 1,
                        //     child: CustomButton(gapWidth: 10,textFontWeight: FontWeight.w400, imageWidth: 20.sp,imageHeight: 20,leadingSvgIcon: true,leadingIcon:(Assets.downloadIcon),onTap: () async {
                        //
                        //       // await PdfDownload().generatePdf(invoiceTitle,priceListData,PDFLayouts().showPdfPriceListData(priceListData),PDFLayouts().pdfTitlePriceList(invoiceTitle)).then((value) => null);
                        //
                        //
                        //     }, text: "Download",horizontalMargin: 20,),
                        //   ),
                        // )

                      ],
                    ),),

                ),
              )
///
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




  Widget showPriceListData(context) {
    List<List<PriceListModel>> invoiceFinalData = [
      [],
      [],
      [],
      [],

    ];
    List<List<PriceListModel>> inData = [priceListData];


    List<Widget> row = [];

    for(int i=0;i<priceListData.length;i++){
      List<Widget> textWidget = [];

      textWidget.add(Container(
          padding: EdgeInsets.only(left: 20.sp),
          child: AppText(i.toString(), style: Styles.circularStdRegular(context,color: AppColors.blackColor,fontWeight: FontWeight.normal))));
      textWidget.add(SizedBox(width: 20.sp,));
      textWidget.add(Container(
          width: 100.sp,
       //   color: Colors.black,

          child: AppText(priceListData[i].item,
              maxLine: 4,
              style: Styles.circularStdRegular(context,color:  AppColors.blackColor,fontWeight: FontWeight.normal))));
      textWidget.add(SizedBox(width: 10.sp,));
      textWidget.add(Container(
       // padding: priceListData[i].item==""? EdgeInsets.only(left: 50.sp):null,
        // height: 50.sp,
        width: 100,
     alignment: Alignment.centerLeft,
       padding: EdgeInsets.only(right: 10.sp),

       // margin: const EdgeInsets.only(left: 20),
        child: priceListData[i].item==""?Center(
          child: SingleChildScrollView(
            child: FittedBox(
              child: AppText(priceListData[i].specification,
                  maxLine:4,style: Styles.circularStdRegular(context,color:AppColors.blackColor,fontWeight: FontWeight.normal)),
            ),
          ),
        ) : Center(
          child: SingleChildScrollView(
            child: AppText(priceListData[i].specification,
                maxLine:4,style: Styles.circularStdRegular(context,color: priceListData[i].item==""?AppColors.primaryColor:AppColors.blackColor,fontWeight:  priceListData[i].item==""?FontWeight.w500:FontWeight.normal)),
          ),
        ),
      ));
      textWidget.add(SizedBox(width: 10.sp,));
      textWidget.add(Container(
         // padding: priceListData[i].item==""? EdgeInsets.only(left: 50.sp):null,
alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(right: 30.sp),
          child: AppText(priceListData[i].packing, style: Styles.circularStdRegular(context,color:AppColors.blackColor,fontWeight: FontWeight.normal))));
      textWidget.add(SizedBox(width: 10.sp,));
      textWidget.add(Container(
        // padding: priceListData[i].item==""? EdgeInsets.only(left: 50.sp):null,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(right: 30.sp),
          child: AppText(priceListData[i].ctn.toString(), style: Styles.circularStdRegular(context,color:AppColors.blackColor,fontWeight: FontWeight.normal))));
      textWidget.add(SizedBox(width: 10.sp,));
      textWidget.add(Container(
        // padding: priceListData[i].item==""? EdgeInsets.only(left: 50.sp):null,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(right: 30.sp),
          child: AppText(priceListData[i].price.toString(), style: Styles.circularStdRegular(context,color:AppColors.blackColor,fontWeight: FontWeight.normal))));
      row.add(Column(

        children: [
          CustomSizedBox.height(10.sp),
          priceListData[i].country!=null?Container(
            alignment: Alignment.centerLeft,

            child: Row(
            mainAxisSize: MainAxisSize.min,

            children: <Widget>[

     Container(
       alignment: Alignment.centerLeft,
       padding: EdgeInsets.only(left: 30.sp),
       width: 1.sw*1.57,
       child: (AppText(priceListData[i].country.toString(), style: Styles.circularStdRegular(context,color:
        AppColors.blackColor,fontWeight:
    FontWeight.w500,fontSize: 19.sp))),
     )


    ],
          ),) :  priceListData[i].title!=null?Container(
height: 50,
            color: AppColors.lightInvoiceColor,
            child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[

              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 30.sp),
                width: 1.sw*1.57,
                child: (AppText(priceListData[i].title.toString(), style: Styles.circularStdRegular(context,color:
                AppColors.primaryColor,fontWeight:
                FontWeight.w500,fontSize: 14.sp))),
              )


            ],
          ),):
          Container(
           // width:priceListData[i].title!=null? 1.sw *1.15:null,

          //  color: priceListData[i].title!=null?AppColors.lightInvoiceColor:AppColors.whiteColor,
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
class PriceListModel {
  final String? sNo;
  final String item;
  final String specification;
  final String packing;
  final String? ctn;
  final String? price;
  final String? country;
  final String? title;

  PriceListModel( this.item, this.specification, this.packing, {this.country, this.title,this.sNo,this.ctn,this.price});
}
