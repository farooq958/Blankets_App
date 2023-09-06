import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hbk/Data/AppData/app_preferences.dart';
import 'package:hbk/Data/DataSource/Resources/assets.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Resources/text_styles.dart';
import 'package:hbk/Presentation/Common/app_text.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/InvoiceScreen/Component/invoice_details.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/PriceListScreen/price_list_screen.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/RewardScreen/reward_screen.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/Statement/statement_screen.dart';
import 'package:intl/intl.dart';
import 'package:number_to_words_english/number_to_words_english.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import 'package:pdf/pdf.dart' as pd;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PDFLayouts {
  static Future<Uint8List> customerStatement(invoiceTitle, invoiceDataList,
      Widget? pdfWidget, Widget? pdfTitle) async {
    Document pdf = Document();
    final height = pd.PdfPageFormat.a4.height;
    final width = pd.PdfPageFormat.a4.width;
    var pdfBlackColor = pd.PdfColors.black;
    // ByteData imageData = await rootBundle.load(Assets.appLogo);
    ByteData imageData = await rootBundle.load(Assets.headerPdf);
    ByteData imageData2 = await rootBundle.load(Assets.footerPdf);

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

          return Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: pd.PdfColors.white,
                borderRadius: BorderRadius.circular(10)),
            child: invoiceDetailLayout(imageData, imageData2),
          ); // Center
        }));

    Uint8List a = await pdf.save();

    ///previous
    // Container(
    //   padding: const EdgeInsets.all(2),
    //   decoration: BoxDecoration(
    //       color: pd.PdfColors.white,
    //       borderRadius: BorderRadius.circular(10)),
    //   child: Column(
    //     //   mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       Padding(
    //         padding:
    //         const EdgeInsets.symmetric(horizontal: 40, vertical: 3),
    //         child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: [
    //               Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     _memoryImage(imageData.buffer.asUint8List(),
    //                         height: 40),
    //                     SizedBox(height: 20),
    //                     Text('Invoice to',
    //                         style: TextStyle(
    //                             fontSize: 14,
    //                             color: pd.PdfColors.black.shade(0.4))),
    //                     SizedBox(height: 2),
    //                     Text('Mehran Ullah',
    //                         style: TextStyle(
    //                             fontSize: 16,
    //                             color: pd.PdfColors.black,
    //                             fontWeight: FontWeight.bold)),
    //                   ]),
    //               Column(
    //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     Row(
    //                         crossAxisAlignment: CrossAxisAlignment.center,
    //                         children: [
    //                           Text('Invoice number:',
    //                               style: TextStyle(
    //                                   fontSize: 12,
    //                                   color:
    //                                   pd.PdfColors.black.shade(0.4))),
    //                           SizedBox(height: 3),
    //                           Text('${Random().nextInt(500000) + 10000}',
    //                               style: TextStyle(
    //                                   fontSize: 13,
    //                                   color: pd.PdfColors.black,
    //                                   fontWeight: FontWeight.bold)),
    //                         ]),
    //                     // Row(
    //                     //     crossAxisAlignment: CrossAxisAlignment.center,
    //                     //     children: [
    //                     //       Text('Date of schedule:',
    //                     //           style: TextStyle(
    //                     //               fontSize: 12,
    //                     //               color:
    //                     //               pd.PdfColors.black.shade(0.4))),
    //                     //       SizedBox(height: 3),
    //                     //       Text(
    //                     //           dateOfSchedules
    //                     //               .toString()
    //                     //               .substring(0, 10),
    //                     //           style: TextStyle(
    //                     //               fontSize: 13,
    //                     //               color: pd.PdfColors.black,
    //                     //               fontWeight: FontWeight.bold)),
    //                     //     ]),
    //                   ]),
    //             ]),
    //       ),
    //       //customWidget,
    //       pdfTitle,
    //       pdfWidget,
    //       Padding(
    //           padding: const EdgeInsets.symmetric(
    //               horizontal: 20, vertical: 15),
    //           child: Row(
    //               mainAxisAlignment: MainAxisAlignment.start,
    //               children: [
    //                 Text(
    //                     'Printed Date: ${DateTime.now().toString().split('.').first}',
    //                     style: const TextStyle(
    //                         fontSize: 11, color: pd.PdfColors.grey)),
    //               ])),
    //     ],
    //   ),
    // );

    // log(a.toString());
    // print(pdf.document.);
    return a;
  }

  static Widget invoiceDetailLayout(imageData, imageData2) {
    return Stack(children: [
      Column(children: [
        _memoryImage(imageData.buffer.asUint8List(),
            width: pd.PdfPageFormat.a3.width),
        Container(
          height: 50,
          decoration: const BoxDecoration(
              color: pd.PdfColor.fromInt(0xffC0C0C0),
              border: Border(
                  bottom: BorderSide(color: pd.PdfColors.black, width: 5.0))),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("Customer's Copy",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                Text("Original",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                Text("Invoice",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))
              ]),
        )
      ]),
      Positioned(
        bottom: 0,
        child:
            _memoryImage(imageData2.buffer.asUint8List(), fit: BoxFit.fitWidth),
      )
    ]);
  }

  Future<Uint8List> generateDocumentForStatement(
      List<StatementData> statementDataList) async {
    //var allStudents = new List.from(absentStudents)..addAll(presentStudents);

   // var color=pd.PdfColors.white;
    //getPdfColor(statementData);
   // int i=0;
    final pw.Document doc = pw.Document();

    final imageJpg =
        (await rootBundle.load(Assets.headerPdf)).buffer.asUint8List();
    final imageJpgfooter =
        (await rootBundle.load(Assets.footerPdf)).buffer.asUint8List();

    final headers = ['Date', 'Type', 'Narration', 'Amount'];

    // Define the table data
    final table = pw.Table(

columnWidths: {
  0: const pw.FixedColumnWidth(120),
  1: const pw.FixedColumnWidth(120),
  2: const pw.FixedColumnWidth(120),
  3: const pw.FixedColumnWidth(120),
},

      // border: pw.TableBorder.all(width: 0),

      children: [

        // Header row
        pw.TableRow(
          children: ['Date', 'Type', 'Narration', 'Amount']
              .map((text) => pw.Container(
            alignment: pw.Alignment.center,
            padding: const pw.EdgeInsets.all(5),
            decoration: const pw.BoxDecoration(
              color: PdfColor.fromInt(0xff0C4A9F),
            ),
            child: pw.Text(
              text,
              style: const pw.TextStyle(
                fontSize: 12,
                //fontWeight: pw.FontWeight.regular,
                color: pd.PdfColors.white
              ),
            ),
          ))
              .toList(),
        ),
        // Data rows
        for (final data in statementDataList)
          pw.TableRow(
            decoration: data.type == '' ? const pw.BoxDecoration(color: PdfColors.grey300) : null,

            children: [
              pw.Container(
                alignment: pw.Alignment.centerLeft,
                padding: const pw.EdgeInsets.all(5),
                child: pw.Text(data.date, style: const pw.TextStyle(fontSize: 10)),
              ),
              pw.Container(
                alignment: pw.Alignment.center,
                padding: const pw.EdgeInsets.all(5),
                child: pw.Text(data.type, style: const pw.TextStyle(fontSize: 10)),
              ),
              pw.Container(
                alignment: pw.Alignment.centerLeft,
                padding: const pw.EdgeInsets.all(5),
                child: pw.Text(data.narration, style: const pw.TextStyle(fontSize: 10)),
              ),
              pw.Container(
                alignment: pw.Alignment.centerRight,
                padding: const pw.EdgeInsets.all(5),
                child: pw.Text(data.amount, style:  pw.TextStyle(fontSize: 10,color: data.type=='Invoice'?pd.PdfColors.red:null)),
              ),
            ],
          ),
      ],
    );
    final pageTheme = pw.PageTheme(
      pageFormat: PdfPageFormat.a4,
      buildBackground: (context) {
        return pw.FullPage(
          ignoreMargins: true,
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Expanded(child: pw.Container()), // Content
              pw.ClipRRect(
                child: pw.Image(
                  pw.MemoryImage(imageJpgfooter),
                  height: 1.sh / 10,
                  fit: pw.BoxFit.contain,
                ),
              ),

            ],
          ),
        );
      },
    );

 
    doc.addPage(pw.MultiPage(
      pageTheme: pageTheme,


        header: (pw.Context context) {
          return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.ClipRRect(
                    child: pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Container(
                              width: 1.sw / 4,
                              child: pw.Center(
                                child: pw.Image(
                                  pw.MemoryImage(imageJpg),
                                  width: 1.sw / 4,
                                  height: 1.sh / 8,
                                  fit: pw.BoxFit.contain,
                                ),
                              )),
                          pw.Container(
                            height: 1.sh / 30,
                            child: pw.Text(
                              //'${months[filterredDummy[index]]}',
                                'Customer Statement',
                                //"${filterredDummy[index]['date'].toString().split(" ").first}",
                                textAlign: pw.TextAlign.center,
                                style: pw.TextStyle(
                                    decoration: pw.TextDecoration.none,
                                    //color: whitecolor,
                                    fontSize: 1.sw / 15,
                                    fontWeight: pw.FontWeight.bold)),
                          ),
                        ])),
                pw.Container(
                    height: 1.sh / 30,
                    width: 1.sw * 1.15,
                    //color: PdfColors.red,
                    child: pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: pw.CrossAxisAlignment.center,
                        children: [
                          pw.Container(
                            child: pw.Text(
                                SharedPrefs.userData!.cntctPrsn.toString(),
                                //'${months[filterredDummy[index]]}',
                                //'${oldlogindatalist['UserDetails']['CardName']}',

                                //"${filterredDummy[index]['date'].toString().split(" ").first}",
                                textAlign: pw.TextAlign.center,
                                style: pw.TextStyle(
                                    decoration: pw.TextDecoration.none,
                                    //color: whitecolor,
                                    fontSize: 1.sw / 35,
                                    fontWeight: pw.FontWeight.bold)),
                          ),
                          pw.Container(
                            child: pw.Text(
                              //'${months[filterredDummy[index]]}',

                              // 'Date & Time : ${DateTime.now().toDMYHM()}',
                                'Date & Time: ${DateFormat.yMMMMEEEEd().format(DateTime.now())}',
                                //"${filterredDummy[index]['date'].toString().split(" ").first}",
                                textAlign: pw.TextAlign.center,
                                style: pw.TextStyle(
                                    decoration: pw.TextDecoration.none,
                                    //color: whitecolor,
                                    fontSize: 1.sw / 35,
                                    fontWeight: pw.FontWeight.bold)),
                          ),
                        ])),
                // pw.Container(
                //     height: height / 30,
                //     width: width * 1.15,
                //     //color: PdfColors.red,
                //     child: pw.Row(
                //         mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                //         crossAxisAlignment: pw.CrossAxisAlignment.center,
                //         children: [
                //           pw.Container(
                //             child: pw.Text(
                //                 //'${months[filterredDummy[index]]}',
                //                 'Date & Time : ${DateTime.now().toDMYHM()}',
                //                 //"${filterredDummy[index]['date'].toString().split(" ").first}",
                //                 textAlign: pw.TextAlign.center,
                //                 style: pw.TextStyle(
                //                     decoration: pw.TextDecoration.none,
                //                     //color: whitecolor,
                //                     fontSize: width / 35,
                //                     fontWeight: pw.FontWeight.bold)),
                //           ),
                //         ])),
              ]);
        },

        build: (context) =>  [
          table,
        //   pw.Column(children: [
        //  // pw.SizedBox(
        //  //     height: 1.sh/5,
        //  //
        //  //     child: pw.Column(
        //  //      crossAxisAlignment: pw.CrossAxisAlignment.start,
        //  //      // mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        //  //      children: [
        //  //
        //  //      ])),
        //
        //
        //  pw.Expanded(child:table)
        // ])


        ]));

/// ////
//     doc.addPage(pw.MultiPage(
//         maxPages: 500,
//         pageFormat:
//             PdfPageFormat.letter.copyWith(marginBottom: 1.5 * PdfPageFormat.mm),
//         crossAxisAlignment: pw.CrossAxisAlignment.start,
//         header: (pw.Context context) {
//           return pw.Column(
//               crossAxisAlignment: pw.CrossAxisAlignment.start,
//               // mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//               children: [
//                 pw.ClipRRect(
//                   child: pw.Image(
//                     pw.MemoryImage(imageJpg),
//                     height: 1.sh / 10,
//                     fit: pw.BoxFit.contain,
//                   ),
//                 ),
//                 pw.Container(
//                     height: 1.sh / 30,
//                     width: 1.sw * 1.15,
//                     //color: PdfColors.red,
//                     child: pw.Row(
//                         mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: pw.CrossAxisAlignment.center,
//                         children: [
//                           pw.Container(
//                             child: pw.Text(
//                                 //'${months[filterredDummy[index]]}',
//                                 //   'Customers Name : ${oldlogindatalist['UserDetails']['CardName']}',
//                                 'Customer Name',
//                                 //"${filterredDummy[index]['date'].toString().split(" ").first}",
//                                 textAlign: pw.TextAlign.center,
//                                 style: pw.TextStyle(
//                                     decoration: pw.TextDecoration.none,
//                                     //color: whitecolor,
//                                     fontSize: 1.sw / 35,
//                                     fontWeight: pw.FontWeight.bold)),
//                           ),
//                           pw.Container(
//                             child: pw.Text(
//                                 //'${months[filterredDummy[index]]}',
//                                 'Date & Time :',
//                                 //"${filterredDummy[index]['date'].toString().split(" ").first}",
//                                 textAlign: pw.TextAlign.center,
//                                 style: pw.TextStyle(
//                                     decoration: pw.TextDecoration.none,
//                                     //color: whitecolor,
//                                     fontSize: 1.sw / 35,
//                                     fontWeight: pw.FontWeight.bold)),
//                           ),
//                         ])),
//               ]);
//         },
//
//         footer: (pw.Context context) {
//           return pw.Column(
//               crossAxisAlignment: pw.CrossAxisAlignment.start,
//               // mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//               children: [
//                 pw.ClipRRect(
//                   child: pw.Image(
//                     pw.MemoryImage(imageJpgfooter),
//                     height: 1.sh / 10,
//                     fit: pw.BoxFit.contain,
//                   ),
//                 ),
//               ]);
//         },
//         build: (pw.Context context) => <pw.Widget>[
//               // pw.Container(height: height / 100),
//           pw.Container(height: 1.sh / 100),
//
//         ///  //// ////
//           // pw.Container(
//           //   // height: height / 1.35,
//           //   // color: redcolor.withOpacity(0.5),
//           //   // decoration: generaldecorationwithshadows(
//           //   //     appthemecolor,
//           //   //     appthemecolor.withOpacity(0),
//           //   //     width / 25,
//           //   //     1,
//           //   //     appthemecolor.withOpacity(0),
//           //   //     2),
//           //   child: pw.Column(
//           //     mainAxisAlignment: pw.MainAxisAlignment.start,
//           //     crossAxisAlignment: pw.CrossAxisAlignment.center,
//           //     children: [
//           //       pw.ClipRRect(
//           //         // borderRadius: pw.BorderRadius.only(
//           //         //     topLeft: pw.Radius.circular(width / 26),
//           //         //     topRight: pw.Radius.circular(width / 26)),
//           //         child: pw.Container(
//           //           height: height / 30,
//           //           decoration: pw.BoxDecoration(
//           //             color: PdfColors.grey300,
//           //             border: pw.Border.all(color: pdfblackcolor),
//           //           ),
//           //           //  color: appthemecolor,
//           //           child: pw.Row(
//           //             mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//           //             crossAxisAlignment: pw.CrossAxisAlignment.center,
//           //             children: [
//           //               pw.Container(
//           //                 width: width / 15,
//
//           //                 // color: redcolor,
//           //                 child: pw.Center(
//           //                     child: pw.Text("#",
//           //                         style: pw.TextStyle(
//           //                             fontSize: width / 30,
//           //                             // color: whitecolor,
//           //                             fontWeight: pw.FontWeight.bold))),
//           //               ),
//           //               pw.Container(
//           //                 width: width / 4,
//           //                 // color: redcolor,
//           //                 child: pw.Center(
//           //                     child: pw.Text("Item",
//           //                         style: pw.TextStyle(
//           //                             fontSize: width / 30,
//           //                             //color: whitecolor,
//           //                             fontWeight: pw.FontWeight.bold))),
//           //               ),
//           //               pw.Container(
//           //                 // width: width / 6,
//           //                 // color: greencolor,
//           //                 child: pw.Center(
//           //                     child: pw.Text("Space",
//           //                         style: pw.TextStyle(
//           //                             fontSize: width / 30,
//           //                             // color: whitecolor,
//           //                             fontWeight: pw.FontWeight.bold))),
//           //               ),
//           //               pw.Container(
//           //                 width: width / 6,
//           //                 // color: greencolor,
//           //                 child: pw.Center(
//           //                     child: pw.Text("Packing",
//           //                         style: pw.TextStyle(
//           //                             fontSize: width / 30,
//           //                             // color: whitecolor,
//           //                             fontWeight: pw.FontWeight.bold))),
//           //               ),
//           //               pw.Container(
//           //                 width: width / 6,
//           //                 // color: bluecolor,
//           //                 child: pw.Center(
//           //                     child: pw.Text("Pcs/ctn",
//           //                         style: pw.TextStyle(
//           //                             fontSize: width / 30,
//           //                             //color: whitecolor,
//           //                             fontWeight: pw.FontWeight.bold))),
//           //               ),
//           //               pw.Container(
//           //                 // width: width / 5.2,
//           //                 //   color: redcolor,
//           //                 child: pw.Center(
//           //                     child: pw.Text("Price",
//           //                         style: pw.TextStyle(
//           //                             fontSize: width / 30,
//           //                             // color: whitecolor,
//           //                             fontWeight: pw.FontWeight.bold))),
//           //               ),
//           //             ],
//           //           ),
//           //         ),
//           //       ),
//           //     // ... pricelistdata(),
//           //      // pricelistdata(1),
//
//           //     ],
//           //   ),
//           // ),
//
//           // pw.Table.fromTextArray(
//           //   context: context,
//           //
//           //   rowDecoration: BoxDecoration(color: getPdfColor(statementData[i])),
//           //   cellStyle: const pw.TextStyle(fontSize: 8),
//           //   headerAlignment: pw.Alignment.center,
//           //   cellAlignment: pw.Alignment.centerLeft,
//           //   data: <List<String>>[
//           //     <String>[
//           //       'Date       ',
//           //       'Type',
//           //       'Item',
//           //       'Narration',
//           //       'Amount',
//           //
//           //     ],
//           //
//           //     for ( i = 0; i < statementData.length; i++)
//           //       <String>[
//           //         (statementData[i].date),
//           //         // '${productsapilist[i]['ItemName']}'
//           //         (statementData[i].type),
//           //         //"brands"
//           //         (statementData[i].narration),
//           //         (statementData[i].amount),
//           //
//           //       ],
//           //   ],
//           // ),
//
//
// ///
// //               pw.Container(
// //                   width: 1.sw * 1.15, //color: bluecolor,
// //                   child: pw.ListView.builder(
// //                     itemCount: statementData.length,
// //                     itemBuilder: (context, int index) {
// //                       if (statementData[index].type == "0") {
// //                         return pw.Container(
// //                           height: 1.sh / 20,
// //                           decoration: pw.BoxDecoration(
// //                             color: PdfColors.grey300,
// //                             border: pw.Border.all(color: pd.PdfColors.black),
// //                           ),
// //                           // color: greencolor,
// //
// //                           child: pw.Row(
// //                             mainAxisAlignment:
// //                                 pw.MainAxisAlignment.spaceBetween,
// //                             crossAxisAlignment: pw.CrossAxisAlignment.center,
// //                             children: [
// //                               pw.Padding(
// //                                 padding: pw.EdgeInsets.only(left: 1.sw / 100),
// //                                 child: pw.Text(
// //                                     //'${months[filterredDummy[index]]}',
// //                                     //   '${months[filterredDummy[index]['date'].month - 1]}, ${filterredDummy[index]['date'].year}',
// //                                     statementData[index].date,
// //                                     //"${filterredDummy[index]['date'].toString().split(" ").first}",
// //                                     textAlign: pw.TextAlign.center,
// //                                     style: pw.TextStyle(
// //                                         decoration: pw.TextDecoration.none,
// //                                         //color: whitecolor,
// //                                         fontSize: 1.sw / 35,
// //                                         fontWeight: pw.FontWeight.bold)),
// //                               ),
// //                               pw.Text(
// //                                   // "${format.format(double.parse(filterredDummy[index]['cr'].toString()))} Cr",
// //                                   statementData[index].narration,
// //                                   textAlign: pw.TextAlign.center,
// //                                   style: pw.TextStyle(
// //                                       decoration: pw.TextDecoration.none,
// //                                       // color: whitecolor,
// //                                       fontSize: 1.sw / 35,
// //                                       fontWeight: pw.FontWeight.bold)),
// //                               pw.Padding(
// //                                 padding: pw.EdgeInsets.only(right: 1.sw / 100),
// //                                 child: pw.Text(
// //                                     // "${format.format(double.parse(filterredDummy[index]['dr'].toString()))} Dr",
// //                                     statementData[index].amount,
// //                                     textAlign: pw.TextAlign.center,
// //                                     style: pw.TextStyle(
// //                                         decoration: pw.TextDecoration.none,
// //                                         // color: whitecolor,
// //                                         fontSize: 1.sw / 35,
// //                                         fontWeight: pw.FontWeight.bold)),
// //                               ),
// //                             ],
// //                           ),
// //                         );
// //                       } else {
// //                         return pw.Padding(
// //                           padding: pw.EdgeInsets.fromLTRB(0, 0, 0, 0),
// //                           child: pw.Container(
// //                               // height: height / 15,
// //                               decoration: pw.BoxDecoration(
// //                                 border:
// //                                     pw.Border.all(color: pd.PdfColors.black),
// //                               ),
// //                               //  color: redcolor,
// //                               child: pw.Column(
// //                                   mainAxisAlignment: pw.MainAxisAlignment.start,
// //                                   crossAxisAlignment:
// //                                       pw.CrossAxisAlignment.center,
// //                                   children: [
// //                                     pw.Container(
// //                                       //height: height / 15,
// //                                       child: pw.Row(
// //                                         mainAxisAlignment:
// //                                             pw.MainAxisAlignment.spaceBetween,
// //                                         crossAxisAlignment:
// //                                             pw.CrossAxisAlignment.center,
// //                                         children: [
// //                                           pw.Container(
// //                                             width: 1.sw / 5,
// //                                             child: pw.Center(
// //                                               child: pw.Text(
// //                                                   statementData[index].date,
// //                                                   textAlign:
// //                                                       pw.TextAlign.center,
// //                                                   style: pw.TextStyle(
// //                                                       decoration: pw
// //                                                           .TextDecoration.none,
// //                                                       color: pd.PdfColors.black,
// //                                                       fontSize: 1.sw / 35,
// //                                                       fontWeight: pw
// //                                                           .FontWeight.normal)),
// //                                             ),
// //                                           ),
// //                                           pw.Container(
// //                                             width: 1.sw / 5,
// //                                             child: pw.Center(
// //                                               child: pw.Text(
// //                                                   // "${filterredDummy[index]['pType']}",
// //                                                   statementData[index].type,
// //                                                   textAlign:
// //                                                       pw.TextAlign.center,
// //                                                   style: pw.TextStyle(
// //                                                       decoration: pw
// //                                                           .TextDecoration.none,
// //                                                       color: pd.PdfColors.black,
// //                                                       fontSize: 1.sw / 35,
// //                                                       fontWeight: pw
// //                                                           .FontWeight.normal)),
// //                                             ),
// //                                           ),
// //                                           // pw.Container(
// //                                           //   width: 1.sw / 5,
// //                                           //   // color: yellowcolor,
// //                                           //   child: pw.Center(
// //                                           //     child: pw.Text(
// //                                           //         "${filterredDummy[index]['linememo']}",
// //                                           //         textAlign: pw.TextAlign.center,
// //                                           //         style: pw.TextStyle(
// //                                           //             decoration:
// //                                           //             pw.TextDecoration.none,
// //                                           //             color: pd.PdfColors.black,
// //                                           //             fontSize: 1.sw
// //                                           //                 / 35,
// //                                           //             fontWeight:
// //                                           //             pw.FontWeight.normal)),
// //                                           //   ),
// //                                           // ),
// //                                           // pw.Container(
// //                                           //   width: 1.sw / 5,
// //                                           //   child: pw.Center(
// //                                           //     child: pw.Text(
// //                                           //       // filterredDummy[index]
// //                                           //       //                 ['pType'] ==
// //                                           //       //             "Payment" ||
// //                                           //       //         filterredDummy[index]
// //                                           //       //                 ['pType'] ==
// //                                           //       //             "JE"
// //                                           //       //     ?
// //                                           //         "${format.format(double.parse(filterredDummy[index]['amount'].toString()))} ${filterredDummy[index]['amounttype'].toString()}",
// //                                           //         //: "${format.format(double.parse(filterredDummy[index]['amount'].toString()))} Dr",
// //                                           //         textAlign: pw.TextAlign.center,
// //                                           //         style: pw.TextStyle(
// //                                           //             decoration:
// //                                           //             pw.TextDecoration.none,
// //                                           //             color: pd.PdfColors.black,
// //                                           //             fontSize: 1.sw / 35,
// //                                           //             fontWeight:
// //                                           //             pw.FontWeight.normal)),
// //                                           //   ),
// //                                           // ),
// //                                         ],
// //                                       ),
// //                                     ),
// //                                     pw.Container(
// //                                       height: 1,
// //                                       // color: lightblackcolor
// //                                       //    .withOpacity(0.25)
// //                                     )
// //                                   ])),
// //                         );
// //                       }
// //                     },
// //                   ))///
//               // pw.Table.fromTextArray(
//               //     context: context,
//               //     headerAlignment: pw.Alignment.center,
//               //     cellAlignment: pw.Alignment.center,
//               //     data: <List<String>>[
//               //       <String>['Date', 'Type', 'Narration', 'Amount'],
//               //       for (int i = 0; i < filterredDummy.length; i++)
//               //         filterredDummy[i]['type'] == "0"
//               //             ? <String>[
//               //                 '${months[filterredDummy[i]['date'].month - 1]}, ${filterredDummy[i]['date'].year}',
//               //                 "Rs.${filterredDummy[i]['cr']} Cr",
//               //                 'N/A',
//               //                 "Rs.${filterredDummy[i]['dr']} Dr",
//               //               ]
//               //             : <String>[
//               //                 '${filterredDummy[i]['date'].toString().split(" ").first}',
//               //                 filterredDummy[i]['pType'] == "Invoice"
//               //                     ? 'Invoice'
//               //                     : "Payment",
//               //                 '${filterredDummy[i]['linememo']}',
//               //                 filterredDummy[i]['pType'] == "Payment"
//               //                     ? "Rs.${filterredDummy[i]['amount']} Cr"
//               //                     : "Rs.${filterredDummy[i]['amount']} Dr",
//               //               ],
//               //     ]),
//             ]));

    ///
    // return doc.save();
    // final appDocDir = await getApplicationDocumentsDirectory();
    // final appDocPath = appDocDir.path;
    // final file = File(appDocPath + '/' + 'statement.pdf');
    // print('Save as file ${file.path} ...');
    // // await file.writeAsBytes(bytes);
    // print('saving file');
    // await file.writeAsBytes(await doc.save());
    // print('opening file');
    // await OpenFile.open(file.path);

    Uint8List a = await doc.save();

    return a;
  }

  pd.PdfColor getPdfColor(StatementData statementData) {
    pd.PdfColor color=pd.PdfColors.white;
     // for(var i in statementData)
     //  {
        if(statementData.type=='')
          {

            color=pd.PdfColors.grey300;
           // break;
          }
        else
          {
            color=pd.PdfColors.white;
            //break;
          }

      // }
     return color;
  }

  Future<Uint8List> generateDocumentForInvoice(List<InvoiceDetailModel>invoiceDataList,ctnTotal,pcsTotal,grandTotal) async {
    //var allStudents = new List.from(absentStudents)..addAll(presentStudents);
    final Document doc = Document();

    final imageJpg =
        (await rootBundle.load(Assets.headerPdf)).buffer.asUint8List();
    final imageJpgfooter =
        (await rootBundle.load(Assets.footerPdf)).buffer.asUint8List();
    final height = 1.sh;
    final width = 1.sw;
    var pdfBlackColor = pd.PdfColors.black;
    doc.addPage(MultiPage(
            // maxPages: 5000,

            pageFormat: PdfPageFormat.a4,
            // PdfPageFormat.letter.copyWith(marginBottom: 1.5 * PdfPageFormat.mm),
            crossAxisAlignment: CrossAxisAlignment.start,
            header: (Context context) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      child: Image(
                        MemoryImage(imageJpg),
                        height: height / 10,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ]);
            },
            footer: (Context context) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      child: Image(
                        MemoryImage(imageJpgfooter),
                        height: height / 10,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ]);
            },
            build: (Context context) => <Widget>[
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //        Container(
                        //   height: height / 100,
                        // ),
                        Container(
                          height: height / 20,
                          //width: width,
                          //width: width  * 1.17,
                          decoration: BoxDecoration(
                            color: PdfColors.grey300,
                            border: Border.all(color: pd.PdfColors.black),
                          ),
                          // decoration: generaldecorationwithshadows(
                          //     blackcolor,
                          //     whitecolor.withOpacity(0.5),
                          //     0,
                          //     1,
                          //     lightblackcolor.withOpacity(0.5),
                          //     1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: width / 30),
                                child: Center(
                                    child: Text(
                                  "Customer's Copy",
                                  style: TextStyle(
                                      //color: blackcolor,
                                      fontSize: width / 35,
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                              Center(
                                  child: Text(
                                "Original",
                                style: TextStyle(
                                    //color: blackcolor,
                                    fontSize: width / 35,
                                    fontWeight: FontWeight.bold),
                              )),
                              Padding(
                                padding: EdgeInsets.only(right: width / 30),
                                child: Center(
                                    child: Text(
                                  "Invoice",
                                  style: TextStyle(
                                      //color: blackcolor,
                                      fontSize: width / 35,
                                      fontWeight: FontWeight.bold),
                                )),
                              )
                            ],
                          ),
                        ),
                        Container(height: height / 200),
                        Container(
                          //  height: height / 6,
                          //  width: width,
                          // width: width / 1.1,

                          child: Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // height: height / 6,
                                width: width / 2.5,

                                // color: pdfth,
                                child: ListView.builder(
                                  //physics: NeverScrollableScrollPhysics(),
                                  itemCount: 4,
                                  itemBuilder: (context, int index) {
                                    return Padding(
                                      padding:
                                          EdgeInsets.only(bottom: height / 100),
                                      child: Container(
                                        width: width / 1.25,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width / 50),
                                              child: Container(
                                                width: width / 4,
                                                //   color: greencolor,
                                                child: Text(
                                                  index == 0
                                                      ? "Customer's Name :"
                                                      : index == 1
                                                          ? "Contact Person :"
                                                          : index == 2
                                                              ? "Phone No. :"
                                                              : "Address :",
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      //color: blackcolor,
                                                      fontSize: width / 40,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: width / 4,
                                              //  color: greencolor,
                                              child: Text(
                                                index == 0
                                                    ? invoiceDataList[0].customerName.toString()
                                                    : index == 1
                                                        ? invoiceDataList[0].contactPerson.toString()
                                                        : index == 2
                                                            ? invoiceDataList[0].phoneNumber.toString()
                                                            : invoiceDataList[0].address.toString(),
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    //color: lightblackcolor,
                                                    fontSize: index == 0
                                                        ? width / 35
                                                        : width / 45,
                                                    fontWeight: index == 0
                                                        ? FontWeight.bold
                                                        : FontWeight.normal),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Container(width: width / 4),
                              //    Container(
                              //   height: height / 4,
                              //   width: width  - width / 2 - width / 7,
                              //   color: bluecolor,
                              // )
                              Container(
                                // height: height / 6,
                                width: width / 2.5,
                                //color: redcolor,
                                child: ListView.builder(
                                  //physics: NeverScrollableScrollPhysics(),
                                  itemCount: 5,
                                  itemBuilder: (context, int index) {
                                    return Padding(
                                      padding:
                                          EdgeInsets.only(bottom: height / 100),
                                      child: Container(
                                        width: width / 1.25,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width / 50),
                                              child: Container(
                                                width: width / 4,
                                                //height: height / 30,
                                                //   color: greencolor,
                                                child: Text(
                                                  index == 0
                                                      ? "Status :"
                                                      : index == 1
                                                          ? "Created By :"
                                                          : index == 2
                                                              ? "Invoice No. :"
                                                              : index == 3
                                                                  ? "Date :"
                                                                  : "Sales Person :",
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      //color: blackcolor,
                                                      fontSize: width / 40,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: width / 4,
                                              // height: height / 30,
                                              //  color: greencolor,
                                              child: Text(
                                                index == 0
                                                    ? invoiceDataList[0].status.toString()
                                                    : index == 1
                                                        ?invoiceDataList[0].createdBy.toString()
                                                        : index == 2
                                                            ? invoiceDataList[0].invoiceNo.toString()
                                                            : index == 3
                                                                ? invoiceDataList[0].date.toString()
                                                                : invoiceDataList[0].salePerson.toString(),
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    //color: lightblackcolor,
                                                    fontSize: width / 45,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          // color: redcolor,
                          //child:
                        ),
                        Container(
                          height: height / 18,
                          // width: width,
                          // decoration: generaldecorationwithshadows(
                          //     blackcolor,
                          //     whitecolor.withOpacity(0.5),
                          //     0,
                          //     1,
                          //     lightblackcolor.withOpacity(0.5),
                          //     1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: width / 12,
                                decoration: BoxDecoration(
                                  color: PdfColors.grey300,
                                  border: Border.all(color: pd.PdfColors.black),
                                ),
                                //color: redcolor,
                                // decoration: generaldecoration(
                                //     blackcolor.withOpacity(0.25),
                                //     whitecolor.withOpacity(0),
                                //     0),
                                child: Center(
                                  child: Text(
                                    "S/NO",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        //color: blackcolor,
                                        fontSize: width / 45,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Container(
                                width: width / 3.7,
                                decoration: BoxDecoration(
                                  color: PdfColors.grey300,
                                  border: Border.all(color: pdfBlackColor),
                                ),
                                //color: redcolor,
                                // decoration: generaldecoration(
                                //     blackcolor.withOpacity(0.25),
                                //     whitecolor.withOpacity(0),
                                //     0),
                                child: Center(
                                  child: Text(
                                    "Description of Goods",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        //color: blackcolor,
                                        fontSize: width / 45,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Container(
                                  width: width / 3.8,
                                  //color: redcolor,
                                  // decoration: generaldecoration(
                                  //     blackcolor.withOpacity(0.25),
                                  //     whitecolor.withOpacity(0),
                                  //     0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: height / 36,

                                        decoration: BoxDecoration(
                                          color: PdfColors.grey300,
                                          border:
                                              Border.all(color: pdfBlackColor),
                                        ),
                                        // decoration: generaldecoration(
                                        //     whitecolor.withOpacity(0.25),
                                        //     whitecolor.withOpacity(0),
                                        //     0),
                                        child: Center(
                                          child: Text(
                                            "Specification",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                // color: blackcolor,
                                                fontSize: width / 40,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      Container(
                                          height: height / 36,
                                          decoration: BoxDecoration(
                                            color: PdfColors.grey300,
                                            border: Border.all(
                                                color: pdfBlackColor),
                                          ),
                                          // decoration: generaldecoration(
                                          //     blackcolor.withOpacity(0.25),
                                          //     whitecolor.withOpacity(0),
                                          //     0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: width / 8,
                                                height: height / 36,
                                                decoration: BoxDecoration(
                                                  color: PdfColors.grey300,
                                                  border: Border.all(
                                                      color: pdfBlackColor),
                                                ),
                                                // decoration: generaldecoration(
                                                //     blackcolor.withOpacity(0.25),
                                                //     whitecolor.withOpacity(0),
                                                //     0),
                                                child: Center(
                                                  child: Text(
                                                    "Type",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        //color: blackcolor,
                                                        fontSize: width / 40,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: width / 8,
                                                height: height / 36,
                                                child: Center(
                                                  child: Text(
                                                    "Packing",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        // color: blackcolor,
                                                        fontSize: width / 40,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )),
                                    ],
                                  )),
                              Container(
                                  width: width / 5,
                                  decoration: BoxDecoration(
                                    color: PdfColors.grey300,
                                    border: Border.all(color: pdfBlackColor),
                                  ),
                                  //color: redcolor,
                                  // decoration: generaldecoration(
                                  //     blackcolor.withOpacity(0.25),
                                  //     whitecolor.withOpacity(0),
                                  //     0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: height / 36,
                                        decoration: BoxDecoration(
                                          color: PdfColors.grey300,
                                          border:
                                              Border.all(color: pdfBlackColor),
                                        ),
                                        // decoration: generaldecoration(
                                        //     whitecolor.withOpacity(0.25),
                                        //     whitecolor.withOpacity(0),
                                        //     0),
                                        child: Center(
                                          child: Text(
                                            "Quantity",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                // color: blackcolor,
                                                fontSize: width / 45,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      Container(
                                          height: height / 36,
                                          // height: height / 40,
                                          decoration: BoxDecoration(
                                            color: PdfColors.grey300,
                                            border: Border.all(
                                                color: pdfBlackColor),
                                          ),
                                          // decoration: generaldecoration(
                                          //     blackcolor.withOpacity(0.25),
                                          //     whitecolor.withOpacity(0),
                                          //     0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: width / 12,
                                                decoration: BoxDecoration(
                                                  color: PdfColors.grey300,
                                                  border: Border.all(
                                                      color: pdfBlackColor),
                                                ),
                                                // decoration: generaldecoration(
                                                //     blackcolor.withOpacity(0.25),
                                                //     whitecolor.withOpacity(0),
                                                //     0),
                                                child: Center(
                                                  child: Text(
                                                    "Ctns",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        //color: blackcolor,
                                                        fontSize: width / 45,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: width / 12,
                                                // width: width / 10,
                                                // height: height / 40,

                                                // color: yellowcolor,
                                                child: Center(
                                                  child: Text(
                                                    "Pcs",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        //color: blackcolor,
                                                        fontSize: width / 45,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )),
                                    ],
                                  )),
                              Container(
                                width: width / 7,
                                decoration: BoxDecoration(
                                  color: PdfColors.grey300,
                                  border: Border.all(color: pdfBlackColor),
                                ),
                                //color: redcolor,
                                // decoration: generaldecoration(
                                //     blackcolor.withOpacity(0.25),
                                //     whitecolor.withOpacity(0),
                                //     0),
                                child: Center(
                                  child: Text(
                                    "Unit Price",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        // color: blackcolor,
                                        fontSize: width / 45,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Container(
                                width: width / 5,
                                decoration: BoxDecoration(
                                  color: PdfColors.grey300,
                                  border: Border.all(color: pdfBlackColor),
                                ),
                                //color: redcolor,
                                // decoration: generaldecoration(
                                //     blackcolor.withOpacity(0.25),
                                //     whitecolor.withOpacity(0),
                                //     0),
                                child: Center(
                                  child: Text(
                                    "Total",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        // color: blackcolor,
                                        fontSize: width / 45,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(children: [
                          invoiceListDataTableData(
                              0, invoiceDataList.length, invoiceDataList),
                          totalAmountInvoice(ctnTotal.toString(),pcsTotal.toString(),grandTotal.toString())
                        ])
                      ]),
                  //
                  // docentrydatalit.length >= 10 && docentrydatalit.length <= 20
                  // // ?  Container(
                  // //   width: width,
                  // //   color: pdfappthemecolor,
                  // //   child:
                  //     ? Container(
                  //     width: width,
                  //     child: Column(
                  //       // mainAxisAlignment: MainAxisAlignment.center,
                  //         crossAxisAlignment: CrossAxisAlignment.center,
                  //         // mainAxisAlignment: MainAxisAlignment.start,
                  //         // crossAxisAlignment: CrossAxisAlignment.center,
                  //         children: [
                  //           invoicelistviewdata(0, 10),
                  //           invoicelistviewdata(
                  //               10, docentrydatalit.length - 10),
                  //           totalamountinvoice()
                  //         ]))
                  // // )
                  //     : docentrydatalit.length >= 20 &&
                  //     docentrydatalit.length <= 30
                  //     ? Container(
                  //   //color: pdfappthemecolor,
                  //     child: Column(
                  //       // mainAxisAlignment: MainAxisAlignment.center,
                  //       // crossAxisAlignment: CrossAxisAlignment.end,
                  //         children: [
                  //           invoicelistviewdata(0, 10),
                  //           invoicelistviewdata(10, 10),
                  //           invoicelistviewdata(
                  //               20, docentrydatalit.length - 20),
                  //           totalamountinvoice()
                  //         ]))
                  //     : docentrydatalit.length >= 30 &&
                  //     docentrydatalit.length <= 40
                  //     ? Column(children: [
                  //   invoicelistviewdata(0, 10),
                  //   invoicelistviewdata(10, 10),
                  //   invoicelistviewdata(20, 10),
                  //   invoicelistviewdata(
                  //       30, docentrydatalit.length - 30),
                  //   totalamountinvoice()
                  // ])
                  //     : Container(),
                  // Container(
                  //   width: width / 12 +
                  //       width / 4 +
                  //       width / 4 +
                  //       width / 6 +
                  //       width / 8 +
                  //       width / 7,
                  //   child: Table.fromTextArray(
                  //       //cellStyle: TextStyle(fontSize: 8),
                  //       context: context,
                  //       //  headerAlignment: Alignment.center,
                  //       //cellAlignment: Alignment.centerLeft,
                  //       data: <List<String>>[
                  //         for (int index = 0; index < docentrydatalit.length; index++)
                  //           <String>[
                  //             "${docentrydatalit[index]['id']}",
                  //             "${docentrydatalit[index]['Description']}",
                  //             "${docentrydatalit[index]['Goodstype']}",
                  //             "${docentrydatalit[index]['Packing']}",
                  //             "${docentrydatalit[index]['Quantity']}",
                  //             "${docentrydatalit[index]['InvQty']}",
                  //             "${format.format(double.parse(docentrydatalit[index]['Price']))}",
                  //             "${format.format((double.parse(docentrydatalit[index]['LineTotal'])))}",

                  //           ],
                  //       ]),
                  // ),

                  // Column(children: [

                  Container(
                    height: height / 100,
                  ),
                  Container(
                      width: width,
                      height: height / 18,
                      //  height: height / 20,

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            //      height: height / 20,
                            //    width: width / 3,
                            //   color: greencolor,
                            child: Text(
                              "Amounts in words : ",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  //color: blackcolor,
                                  fontSize: width / 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            //  height: height / 20,
                            //  width: width / 1.5,
                            //  color: yellowcolor,
                            child: Text(
                              NumberToWordsEnglish.convert(double.parse(grandTotal.toString()).toInt()),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  //color: blackcolor,
                                  fontSize: width / 30,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      )),
                ])

        // ,
        // ])
        );
    Uint8List a = await doc.save();

    return a;
    // return doc.save();
    // final appDocDir = await getApplicationDocumentsDirectory();
    // final appDocPath = appDocDir.path;
    // final file = File(appDocPath + '/' + 'invoice.pdf');
    // print('Save as file ${file.path} ...');
    // // await file.writeAsBytes(bytes);
    // print('saving file');
    // await file.writeAsBytes(await doc.save());
    // print('opening file');
    // await OpenFile.open(file.path);
  }

  Future<Uint8List> generateDocumentForReward(
      List<RewardModel> rewardData) async {
    final imageJpg =
        (await rootBundle.load(Assets.headerPdf)).buffer.asUint8List();
    final imageJpgfooter =
        (await rootBundle.load(Assets.footerPdf)).buffer.asUint8List();

    // print() {

    final doc = pw.Document();
    doc.addPage(pw.MultiPage(
        pageFormat:
            PdfPageFormat.letter.copyWith(marginBottom: 1.5 * PdfPageFormat.cm),
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        header: (pw.Context context) {
          return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              // mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.ClipRRect(
                  child: pw.Image(
                    pw.MemoryImage(imageJpg),
                    height: 1.sh / 10,
                    fit: pw.BoxFit.contain,
                  ),
                ),
                pw.Container(
                    height: 1.sh / 30,
                    width: 1.sw * 1.15,
                    //color: PdfColors.red,
                    child: pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: pw.CrossAxisAlignment.center,
                        children: [
                          pw.Container(
                            child: pw.Text(

                                //   'Customers Name : ${oldlogindatalist['UserDetails']['CardName']}',
                                "",

                                /// add name here

                                textAlign: pw.TextAlign.center,
                                style: pw.TextStyle(
                                    decoration: pw.TextDecoration.none,
                                    //color: whitecolor,
                                    fontSize: 1.sw / 35,
                                    fontWeight: pw.FontWeight.bold)),
                          ),
                          pw.Container(
                            child: pw.Text(

                                //   'Date & Time : ${DateTime.now().toDMYHM()}',
                                "Date & Time",

                                /// add date here
                                textAlign: pw.TextAlign.center,
                                style: pw.TextStyle(
                                    decoration: pw.TextDecoration.none,
                                    //color: whitecolor,
                                    fontSize: 1.sw / 35,
                                    fontWeight: pw.FontWeight.bold)),
                          ),
                        ])),
              ]);
        },
        footer: (pw.Context context) {
          return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              // mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.ClipRRect(
                  child: pw.Image(
                    pw.MemoryImage(imageJpgfooter),
                    height: 1.sh / 10,
                    fit: pw.BoxFit.contain,
                  ),
                ),
              ]);
        },
        build: (pw.Context context) => <pw.Widget>[
              pw.Container(height: 1.sh / 100),
              pw.Table.fromTextArray(
                  cellStyle: pw.TextStyle(fontSize: 8),
                  context: context,
                  headerAlignment: pw.Alignment.center,
                  cellAlignment: pw.Alignment.centerLeft,
                  data: <List<String>>[
                    <String>[
                      'Session',
                      'Status',
                      'Net Sales',
                      'Bonus Reward',
                      'Loyal Reward',
                      'Total Reward'
                    ],
                    for (int index = 0; index < rewardData.length; index++)
                      <String>[
                        // '${rewardData[index].s} \n ${rewarddatalist[index]['EndDate'].toString().split(" ").first}',
                        //  '${rewardData[index].loyalReward.toString().split(" ").first} \n ${rewardData[index].session.toString().split(" ").first}',
                        (rewardData[index].session.toString()),
                        (rewardData[index].status.toString()),
                        (rewardData[index].netSale.toString()),
                        "${rewardData[index].bonusReward}",
                        "${rewardData[index].loyalReward}",
                        (rewardData[index].totalReward.toString()),
                      ],
                  ]),
            ]));

    //  index: 4

    Uint8List a = await doc.save();

    return a;
    // final appDocDir = await getApplicationDocumentsDirectory();
    // final appDocPath = appDocDir.path;
    // final file = File(appDocPath + '/' + 'Pricelist.pdf');
    // print('Save as file ${file.path} ...');
    // // await file.writeAsBytes(bytes);
    // print('saving file');
    // await file.writeAsBytes(await doc.save());
    // print('opening file');
    // await OpenFile.open(file.path);
  }

  Future<Uint8List> generateDocumentForPriceList(
      List<PriceListModel> priceList) async {
    final imageJpg =
        (await rootBundle.load(Assets.headerPdf)).buffer.asUint8List();
    final imageJpgfooter =
        (await rootBundle.load(Assets.footerPdf)).buffer.asUint8List();

    // print() {

    final doc = pw.Document();
    doc.addPage(
      pw.MultiPage(
          crossAxisAlignment: pw.CrossAxisAlignment.center,
          header: (pw.Context context) {
            return pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.ClipRRect(
                      child: pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                        pw.Container(
                            width: 1.sw / 4,
                            child: pw.Center(
                              child: pw.Image(
                                pw.MemoryImage(imageJpg),
                                width: 1.sw / 4,
                                height: 1.sh / 8,
                                fit: pw.BoxFit.contain,
                              ),
                            )),
                        pw.Container(
                          height: 1.sh / 30,
                          child: pw.Text(
                              //'${months[filterredDummy[index]]}',
                              'Price List',
                              //"${filterredDummy[index]['date'].toString().split(" ").first}",
                              textAlign: pw.TextAlign.center,
                              style: pw.TextStyle(
                                  decoration: pw.TextDecoration.none,
                                  //color: whitecolor,
                                  fontSize: 1.sw / 15,
                                  fontWeight: pw.FontWeight.bold)),
                        ),
                      ])),
                  pw.Container(
                      height: 1.sh / 30,
                      width: 1.sw * 1.15,
                      //color: PdfColors.red,
                      child: pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: pw.CrossAxisAlignment.center,
                          children: [
                            pw.Container(
                              child: pw.Text(
                                  SharedPrefs.userData!.cntctPrsn.toString(),
                                  //'${months[filterredDummy[index]]}',
                                  //'${oldlogindatalist['UserDetails']['CardName']}',

                                  //"${filterredDummy[index]['date'].toString().split(" ").first}",
                                  textAlign: pw.TextAlign.center,
                                  style: pw.TextStyle(
                                      decoration: pw.TextDecoration.none,
                                      //color: whitecolor,
                                      fontSize: 1.sw / 35,
                                      fontWeight: pw.FontWeight.bold)),
                            ),
                            pw.Container(
                              child: pw.Text(
                                  //'${months[filterredDummy[index]]}',

                                  // 'Date & Time : ${DateTime.now().toDMYHM()}',
                                  'Date & Time: ${DateFormat.yMMMMEEEEd().format(DateTime.now())}',
                                  //"${filterredDummy[index]['date'].toString().split(" ").first}",
                                  textAlign: pw.TextAlign.center,
                                  style: pw.TextStyle(
                                      decoration: pw.TextDecoration.none,
                                      //color: whitecolor,
                                      fontSize: 1.sw / 35,
                                      fontWeight: pw.FontWeight.bold)),
                            ),
                          ])),
                  // pw.Container(
                  //     height: height / 30,
                  //     width: width * 1.15,
                  //     //color: PdfColors.red,
                  //     child: pw.Row(
                  //         mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  //         crossAxisAlignment: pw.CrossAxisAlignment.center,
                  //         children: [
                  //           pw.Container(
                  //             child: pw.Text(
                  //                 //'${months[filterredDummy[index]]}',
                  //                 'Date & Time : ${DateTime.now().toDMYHM()}',
                  //                 //"${filterredDummy[index]['date'].toString().split(" ").first}",
                  //                 textAlign: pw.TextAlign.center,
                  //                 style: pw.TextStyle(
                  //                     decoration: pw.TextDecoration.none,
                  //                     //color: whitecolor,
                  //                     fontSize: width / 35,
                  //                     fontWeight: pw.FontWeight.bold)),
                  //           ),
                  //         ])),
                ]);
          },
          build: (pw.Context context) => <pw.Widget>[
                pw.Container(height: 1.sh / 100),
                // pw.Container(
                //   // height: height / 1.35,
                //   // color: redcolor.withOpacity(0.5),
                //   // decoration: generaldecorationwithshadows(
                //   //     appthemecolor,
                //   //     appthemecolor.withOpacity(0),
                //   //     width / 25,
                //   //     1,
                //   //     appthemecolor.withOpacity(0),
                //   //     2),
                //   child: pw.Column(
                //     mainAxisAlignment: pw.MainAxisAlignment.start,
                //     crossAxisAlignment: pw.CrossAxisAlignment.center,
                //     children: [
                //       pw.ClipRRect(
                //         // borderRadius: pw.BorderRadius.only(
                //         //     topLeft: pw.Radius.circular(width / 26),
                //         //     topRight: pw.Radius.circular(width / 26)),
                //         child: pw.Container(
                //           height: height / 30,
                //           decoration: pw.BoxDecoration(
                //             color: PdfColors.grey300,
                //             border: pw.Border.all(color: pdfblackcolor),
                //           ),
                //           //  color: appthemecolor,
                //           child: pw.Row(
                //             mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                //             crossAxisAlignment: pw.CrossAxisAlignment.center,
                //             children: [
                //               pw.Container(
                //                 width: width / 15,

                //                 // color: redcolor,
                //                 child: pw.Center(
                //                     child: pw.Text("#",
                //                         style: pw.TextStyle(
                //                             fontSize: width / 30,
                //                             // color: whitecolor,
                //                             fontWeight: pw.FontWeight.bold))),
                //               ),
                //               pw.Container(
                //                 width: width / 4,
                //                 // color: redcolor,
                //                 child: pw.Center(
                //                     child: pw.Text("Item",
                //                         style: pw.TextStyle(
                //                             fontSize: width / 30,
                //                             //color: whitecolor,
                //                             fontWeight: pw.FontWeight.bold))),
                //               ),
                //               pw.Container(
                //                 // width: width / 6,
                //                 // color: greencolor,
                //                 child: pw.Center(
                //                     child: pw.Text("Space",
                //                         style: pw.TextStyle(
                //                             fontSize: width / 30,
                //                             // color: whitecolor,
                //                             fontWeight: pw.FontWeight.bold))),
                //               ),
                //               pw.Container(
                //                 width: width / 6,
                //                 // color: greencolor,
                //                 child: pw.Center(
                //                     child: pw.Text("Packing",
                //                         style: pw.TextStyle(
                //                             fontSize: width / 30,
                //                             // color: whitecolor,
                //                             fontWeight: pw.FontWeight.bold))),
                //               ),
                //               pw.Container(
                //                 width: width / 6,
                //                 // color: bluecolor,
                //                 child: pw.Center(
                //                     child: pw.Text("Pcs/ctn",
                //                         style: pw.TextStyle(
                //                             fontSize: width / 30,
                //                             //color: whitecolor,
                //                             fontWeight: pw.FontWeight.bold))),
                //               ),
                //               pw.Container(
                //                 // width: width / 5.2,
                //                 //   color: redcolor,
                //                 child: pw.Center(
                //                     child: pw.Text("Price",
                //                         style: pw.TextStyle(
                //                             fontSize: width / 30,
                //                             // color: whitecolor,
                //                             fontWeight: pw.FontWeight.bold))),
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //     // ... pricelistdata(),
                //      // pricelistdata(1),

                //     ],
                //   ),
                // ),

                pw.Table.fromTextArray(
                  context: context,
                  cellStyle: const pw.TextStyle(fontSize: 8),
                  headerAlignment: pw.Alignment.center,
                  cellAlignment: pw.Alignment.centerLeft,
                  data: <List<String>>[
                    <String>[
                      'Origin       ',
                      'Category',
                      'Item',
                      'Specification',
                      'Packing',
                      'Pcs/ctn',
                      'Price   '
                    ],
                    for (int i = 0; i < priceList.length; i++)
                      <String>[
                        '${priceList[i].country}',
                        // '${productsapilist[i]['ItemName']}'
                        '${priceList[i].category}',
                        //"brands"
                        '${priceList[i].item}',
                        '${priceList[i].specification}',
                        '${priceList[i].packing}',
                        '${priceList[i].ctn}',
                        '${double.parse(priceList[i].price.toString())}',
                      ],
                  ],
                ),
              ]),

      //  index: 4
    );

    Uint8List a = await doc.save();

    return a;
    // final appDocDir = await getApplicationDocumentsDirectory();
    // final appDocPath = appDocDir.path;
    // final file = File(appDocPath + '/' + 'Pricelist.pdf');
    // print('Save as file ${file.path} ...');
    // // await file.writeAsBytes(bytes);
    // print('saving file');
    // await file.writeAsBytes(await doc.save());
    // print('opening file');
    // await OpenFile.open(file.path);
  }

  Widget totalAmountInvoice(totalCtn,totalPcs,grandTotal) {
    final height = 1.sh;
    final width = 1.sw;
    var pdfblackcolor = pd.PdfColors.black;
    return Container(
      height: height / 25,
      //color: pdfappthemecolor,
      //width: width,
      //  width:
      //      width / 1.62 + width / 10 + width / 10 + width / 2.9,
      // decoration: BoxDecoration(
      //   border: Border.all(color: pdfblackcolor),
      // ),
      child: Row(
        children: [
          Container(
            width: width / 1.62,
            decoration: BoxDecoration(
              border: Border.all(color: pdfblackcolor),
            ),
            //color: pdfappthemecolor,
            child: Center(
              child: Text(
                "Total :",
                textAlign: TextAlign.center,
                style: TextStyle(
                    //color: blackcolor,
                    fontSize: width / 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            width: width / 10,
            decoration: BoxDecoration(
              border: Border.all(color: pdfblackcolor),
            ),
            // color: pdfblackcolor,
            child: Center(
              child: Text(
                totalCtn,
                textAlign: TextAlign.center,
                style: TextStyle(
                    // color: blackcolor,
                    fontSize: width / 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            width: width / 10,
            decoration: BoxDecoration(
              border: Border.all(color: pdfblackcolor),
            ),
            //   color: pdfgreycolor,
            child: Center(
              child: Text(
                totalPcs,
                textAlign: TextAlign.center,
                style: TextStyle(
                    // color: blackcolor,
                    fontSize: width / 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            width: width / 2.9,
            decoration: BoxDecoration(
              border: Border.all(color: pdfblackcolor),
            ),
            // color: pdfappthemecolor,
            child: Center(
              child: Text(
               grandTotal,
                textAlign: TextAlign.center,
                style: TextStyle(
                    //color: blackcolor,
                    fontSize: width / 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget invoiceListDataTableData(
      int length, int countlength, List<InvoiceDetailModel> invoiceDataList) {
    final height = 1.sh;
    final width = 1.sw;
    var pdfBlackColor = pd.PdfColors.black;
    // return ListView.builder(
    //   // padding: EdgeInsets.only(left: width / 5.95),
    //   // itemCount: docentrydatalit.length,
    //   itemCount: countlength,
    //   //physics: NeverScrollableScrollPhysics(),
    //   itemBuilder: (context, int index) {
    // print(index);
    //  ctnstotal = ctnstotal + double.parse(docentrydatalit[index]['Quantity'].toString());
    //  print(ctnstotal);
    return Container(
        //height: height / 25,

        //width: width,
        // width: width / 12 +
        //     width / 4 +
        //     width / 4 +
        //     width / 6 +
        //     width / 8 +
        //     width / 7,
        //  width: width,
        //color: pdfgreycolor,
        child: ListView.builder(
      itemCount: invoiceDataList.length,
      //physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, int index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Container(
            //   color: pdfblackcolor,
            //   width: 50,
            //   height: 10
            // ),
            Container(
                width: width / 12,
                height: height / 25,
                //height: height / 18,
                decoration: BoxDecoration(
                  border: Border.all(color: pdfBlackColor),
                ),
                // decoration: generaldecoration(
                //     blackcolor.withOpacity(0.25),
                //     whitecolor.withOpacity(0),
                //     0),

                child: Center(
                  child: Text(
                    index.toString(),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        //color: blackcolor,
                        fontSize: width / 45),
                  ),
                )),
            Container(
              width: width / 3.7,
              height: height / 25,
              decoration: BoxDecoration(
                //   color: PdfColors.grey300,
                border: Border.all(color: pdfBlackColor),
              ),
              // decoration: generaldecoration(
              //     blackcolor.withOpacity(0.25),
              //     whitecolor.withOpacity(0),
              //     0),

              child: Center(
                child: Text(
                  "${invoiceDataList[index].productName}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      //color: blackcolor,
                      fontSize: width / 45),
                ),
              ),
            ),
            Container(
                width: width / 7.6,
                height: height / 25,
                decoration: BoxDecoration(
                  //  color: PdfColors.grey300,
                  border: Border.all(color: pdfBlackColor),
                ),
                // decoration: generaldecoration(
                //     blackcolor.withOpacity(0.25),
                //     whitecolor.withOpacity(0),
                //     0),

                child: Center(
                  child: Text(
                    "${invoiceDataList[index].type}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        //color: blackcolor,
                        fontSize: width / 45),
                  ),
                )),
            Container(
                width: width / 7.6,
                height: height / 25,
                decoration: BoxDecoration(
                  // color: PdfColors.grey300,
                  border: Border.all(color: pdfBlackColor),
                ),
                // decoration: generaldecoration(
                //     blackcolor.withOpacity(0.25),
                //     whitecolor.withOpacity(0),
                //     0),

                child: Center(
                  child: Text(
                    "${invoiceDataList[index].packing}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        // color: blackcolor,
                        fontSize: width / 45),
                  ),
                )),
            Container(
                width: width / 10,
                height: height / 25,
                decoration: BoxDecoration(
                  // color: PdfColors.grey300,
                  border: Border.all(color: pdfBlackColor),
                ),
                // decoration: generaldecoration(
                //     blackcolor.withOpacity(0.25),
                //     whitecolor.withOpacity(0),
                //     0),

                child: Center(
                  child: Text(
                    "${invoiceDataList[index].pcs}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        // color: blackcolor,
                        fontSize: width / 45),
                  ),
                )),
            Container(
                width: width / 10,
                height: height / 25,
                decoration: BoxDecoration(
                  border: Border.all(color: pdfBlackColor),
                ),
                // decoration: generaldecoration(
                //     blackcolor.withOpacity(0.25),
                //     whitecolor.withOpacity(0),
                //     0),

                child: Center(
                  child: Text(
                    "${invoiceDataList[index].ctn}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        //color: blackcolor,
                        fontSize: width / 45),
                  ),
                )),
            Container(
                width: width / 7,
                height: height / 25,
                decoration: BoxDecoration(
                  border: Border.all(color: pdfBlackColor),
                ),
                // decoration: generaldecoration(
                //     blackcolor.withOpacity(0.25),
                //     whitecolor.withOpacity(0),
                //     0),

                child: Center(
                  child: Text(
                    "${invoiceDataList[index].unitPrice}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        // color: blackcolor,
                        fontSize: width / 45),
                  ),
                )),
            Container(
                width: width / 5,
                height: height / 25,
                decoration: BoxDecoration(
                  border: Border.all(color: pdfBlackColor),
                ),
                // decoration: generaldecoration(
                //     blackcolor.withOpacity(0.25),
                //     whitecolor.withOpacity(0),
                //     0),

                child: Center(
                  child: Text(
                    "${invoiceDataList[index].totalPrice}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        // color: blackcolor,
                        fontSize: width / 45),
                  ),
                )),
          ],
        );
      },
    ));
    // }
    //  },
    // );
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
          padding: invoiceData.type.isEmpty ? EdgeInsets.only(left: 50) : null,
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
          padding: invoiceData.type.isEmpty ? EdgeInsets.only(left: 50) : null,
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

  Widget pdfTitlePriceList(invoiceTitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < invoiceTitle.length; i++)
          Container(
            height: 60.sp,
            width: i == 0 ? 50 : 100.sp,
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
                : priceListData[i].category != null
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
                                priceListData[i].category.toString(),
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
