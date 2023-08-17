import 'dart:math';
import 'dart:typed_data';


import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hbk/Data/DataSource/Resources/assets.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Resources/text_styles.dart';
import 'package:hbk/Presentation/Common/app_text.dart';

import 'package:pdf/pdf.dart' as pd;
import 'package:pdf/widgets.dart';

class PDFLayouts {
  static Future<Uint8List> customerStatement(invoiceTitle,invoiceDataList,Widget pdfWidget,Widget pdfTitle) async {
    Document pdf = Document();

    ByteData imageData = await rootBundle.load(Assets.appLogo);

    pdf.addPage(Page(
        margin: const EdgeInsets.all(5),
        pageFormat: pd.PdfPageFormat.a3,
        build: (Context context) {
//           Widget showInvoiceData(context) {
//
//
//
//             List<Widget> row = [];
//
//             for(int i=0;i<invoiceData.length;i++){
//               List<Widget> textWidget = [];
//
//               textWidget.add(Container(
//                   height: 40,
//                   width: 100,
//                   padding: EdgeInsets.only(left: 10.sp),
//
//                   alignment: Alignment.centerLeft,
// //color: AppColors.primaryColor,
//                   child: AppText(invoiceData[i].date, style: Styles.circularStdRegular(context,color:  invoiceData[i].type==""?AppColors.primaryColor:AppColors.blackColor,fontWeight:  invoiceData[i].type==""?FontWeight.w500:FontWeight.normal))));
//               textWidget.add(SizedBox(width: 20.sp,));
//               textWidget.add(AppText(invoiceData[i].type, style: Styles.circularStdRegular(context,color:  invoiceData[i].type==""?AppColors.primaryColor:AppColors.blackColor,fontWeight:  invoiceData[i].type==""?FontWeight.w500:FontWeight.normal)) as Widget);
//               textWidget.add(SizedBox(width: 20.sp,));
//               textWidget.add(Container(
//                 padding: invoiceData[i].type==""? EdgeInsets.only(left: 50.sp):null,
//                 // height: 50.sp,
//                 width: 100,
//                 margin: const EdgeInsets.only(left: 20),
//                 child: invoiceData[i].type==""?Center(
//                   child: SingleChildScrollView(
//                     child: FittedBox(
//                       child: AppText(invoiceData[i].narration,
//                           maxLine:4,style: Styles.circularStdRegular(context,color: invoiceData[i].type==""?AppColors.primaryColor:AppColors.blackColor,fontWeight:  invoiceData[i].type==""?FontWeight.w500:FontWeight.normal)),
//                     ),
//                   ),
//                 ) : Center(
//                   child: SingleChildScrollView(
//                     child: AppText(invoiceData[i].narration,
//                         maxLine:4,style: Styles.circularStdRegular(context,color: invoiceData[i].type==""?AppColors.primaryColor:AppColors.blackColor,fontWeight:  invoiceData[i].type==""?FontWeight.w500:FontWeight.normal)),
//                   ),
//                 ),
//               ));
//               textWidget.add(SizedBox(width: 20.sp,));
//               textWidget.add(Container(
//                   padding: invoiceData[i].type==""? EdgeInsets.only(left: 50.sp):null,
//
//                   child: AppText(invoiceData[i].amount, style: Styles.circularStdRegular(context,color: invoiceData[i].type==""?AppColors.primaryColor:AppColors.blackColor,fontWeight:  invoiceData[i].type==""?FontWeight.w500:FontWeight.normal))));
//               row.add(Column(
//                 children: [
//                   Container(
//                     width:invoiceData[i].type==""? 1.sw *1.15:null,
//
//                     color: invoiceData[i].type==""?AppColors.lightInvoiceColor:AppColors.whiteColor,
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//
//                         ...textWidget,
//
//
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 20.sp,)
//                 ],
//               ));
//
//
//             }
//
//             return Column(
//               mainAxisSize: MainAxisSize.min,
//               children: row,
//             );
//
//
//           }


          return   Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: pd.PdfColors.white,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
           //   mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 40, vertical: 3),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _memoryImage(imageData.buffer.asUint8List(),
                                  height: 40),
                              SizedBox(height: 20),
                              Text('Invoice to',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: pd.PdfColors.black.shade(0.4))),
                              SizedBox(height: 2),
                              Text('Mehran Ullah',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: pd.PdfColors.black,
                                      fontWeight: FontWeight.bold)),
                            ]),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('Invoice number:',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color:
                                            pd.PdfColors.black.shade(0.4))),
                                    SizedBox(height: 3),
                                    Text('${Random().nextInt(500000) + 10000}',
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: pd.PdfColors.black,
                                            fontWeight: FontWeight.bold)),
                                  ]),
                              // Row(
                              //     crossAxisAlignment: CrossAxisAlignment.center,
                              //     children: [
                              //       Text('Date of schedule:',
                              //           style: TextStyle(
                              //               fontSize: 12,
                              //               color:
                              //               pd.PdfColors.black.shade(0.4))),
                              //       SizedBox(height: 3),
                              //       Text(
                              //           dateOfSchedules
                              //               .toString()
                              //               .substring(0, 10),
                              //           style: TextStyle(
                              //               fontSize: 13,
                              //               color: pd.PdfColors.black,
                              //               fontWeight: FontWeight.bold)),
                              //     ]),
                            ]),
                      ]),
                ),
                //customWidget,
                pdfTitle,
               pdfWidget,
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                              'Printed Date: ${DateTime.now().toString().split('.').first}',
                              style: const TextStyle(
                                  fontSize: 11, color: pd.PdfColors.grey)),
                        ])),
              ],
            ),
          ); // Center
        }));

    Uint8List a = await pdf.save();

    // log(a.toString());
    // print(pdf.document.);
    return a;
  }



  static Image _memoryImage(Uint8List bytes,
      {double? width, double? height, BoxFit fit = BoxFit.contain}) {
    return Image(
      MemoryImage(
        bytes,
      ),
      width: width,
      height: height,
      fit: fit,
    );
  }

  static Image _rawImage(
      Uint8List bytes, {
        double? width,
        double? height,
      }) {
    return Image(RawImage(
      bytes: bytes,
      width: (width ?? 20).toInt(),
      height: (height ?? 20).toInt(),
    ));
  }

  static Future<List<int>> loadImage(String path) async {
    ByteData imageData = await rootBundle.load(path);
    List<int> bytes = Uint8List.view(imageData.buffer);
    return bytes;
  }

  Widget showCustomerStatementDataPdf(invoiceDataList) {
    final widgets = <Widget>[];

    for (var invoiceData in invoiceDataList) {
      final textWidgets = <Widget>[];

      textWidgets.add(
        Container(
          height: 40,
          width: 100,
          padding: EdgeInsets.only(left: 10),
          alignment: Alignment.centerLeft,
          child: Text(
            invoiceData.date,
            style: TextStyle(
              fontWeight: invoiceData.type.isEmpty
                  ? FontWeight.bold
                  : FontWeight.normal,
              color: invoiceData.type.isEmpty
                  ? pd.PdfColors.blue
                  : pd.PdfColors.black,
            ),
          ),
        ),
      );

      textWidgets.add(SizedBox(width: 20));
      textWidgets.add(Text(invoiceData.type));
      textWidgets.add(SizedBox(width: 20));

      textWidgets.add(
        Container(
          padding: invoiceData.type.isEmpty
              ? EdgeInsets.only(left: 50)
              : null,
          width: 100,
          margin: EdgeInsets.only(left: 20),
          child: Center(

            child: Text(
              invoiceData.narration,
              maxLines: 4,
            ),

          ),
        ),
      );

      textWidgets.add(SizedBox(width: 20));

      textWidgets.add(
        Container(
          padding: invoiceData.type.isEmpty
              ? EdgeInsets.only(left: 50)
              : null,
          child: Text(invoiceData.amount),
        ),
      );

      widgets.add(
        Column(
          children: [
            Container(
              width: invoiceData.type.isEmpty ? 400 : null,
              color: invoiceData.type.isEmpty
                  ? pd.PdfColors.grey300
                  : pd.PdfColors.white,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: textWidgets,
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: widgets,
    );
  }
   Row pdfTitleCustomerStatement(invoiceTitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        for (var i = 0; i < invoiceTitle.length; i++)
          Container(
            height: 60.sp,
            width: 110.sp,
            // margin: EdgeInsets.only(right: 0),

            alignment: Alignment.center,
            padding: EdgeInsets.only(right: 20.sp),
            color: const pd.PdfColor.fromInt(0xff0C4A9F),
            child: Text(
              invoiceTitle[i],
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                  color: pd.PdfColors.white),
            ),
          ),







      ],
    );
  }

Widget pdfTitlePriceList(invoiceTitle)
{
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [

  for (var i = 0; i < invoiceTitle.length; i++)
    Container(
      height: 60.sp,
      width: i==0?50:100.sp,
      // margin: EdgeInsets.only(right: 0),

      alignment: Alignment.centerLeft,
      color: const pd.PdfColor.fromInt(0xff0C4A9F),
      child: Text(
        invoiceTitle[i],
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.bold,
            color: pd.PdfColors.white),
      ),
    ),







    ],
  );
}
  Widget showPdfPriceListData(priceListData) {


    List<Widget> row = [];

    for (int i = 0; i < priceListData.length; i++) {
      List<Widget> textWidget = [];

      textWidget.add(
        Container(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            i.toString(),
            style: TextStyle(
              color: pd.PdfColors.black,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      );

      textWidget.add(SizedBox(width: 20));

      textWidget.add(
        Container(
          width: 100,
          child: Text(
            priceListData[i].item,
            maxLines: 4,
            style: TextStyle(
              color: pd.PdfColors.black,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      );

      textWidget.add(SizedBox(width: 10));

      textWidget.add(
        Container(
          width: 100,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(right: 10),
          child: Center(

              child: Text(
                priceListData[i].specification,
                maxLines: 4,
                style: TextStyle(
                  color: pd.PdfColors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),

          ),
        ),
      );

      textWidget.add(SizedBox(width: 10));

      textWidget.add(
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(right: 30),
          child: Text(
            priceListData[i].packing,
            style: TextStyle(
              color: pd.PdfColors.black,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      );

      row.add(
        Column(
          children: [
            SizedBox(height: 10),
            priceListData[i].country != null
                ? Container(
              alignment: Alignment.centerLeft,
              width: 340.sp,
            height: 30,
            // color: pd.PdfColors.amber,
             // margin: EdgeInsets.only(right: 150.sp),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                   // padding: EdgeInsets.only(left: 30),
                   // width: MediaQuery.of(context).size.width,
                    child: Text(
                      priceListData[i].country.toString(),
                      style: TextStyle(
                        color: pd.PdfColors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 19,
                      ),
                    ),
                  ),
                ],
              ),
            )
                : priceListData[i].title != null
                ? Container(
              height: 30,
              //color: pd.PdfColors.grey,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 30),
                   // width: MediaQuery.of(context).size.width,
                    child: Text(
                      priceListData[i].title.toString(),
                      style: TextStyle(
                        color: pd.PdfColors.blue,
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            )
                : Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...textWidget,
                ],
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: row,
    );
  }
}