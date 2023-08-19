import 'dart:math';
import 'dart:typed_data';


import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hbk/Data/DataSource/Resources/assets.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Resources/text_styles.dart';
import 'package:hbk/Presentation/Common/app_text.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/InvoiceScreen/Component/invoice_details.dart';

import 'package:pdf/pdf.dart' as pd;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PDFLayouts {
  static Future<Uint8List> customerStatement(invoiceTitle,invoiceDataList,Widget? pdfWidget,Widget? pdfTitle) async {
    Document pdf = Document();
    final height=pd.PdfPageFormat.a4.height;
    final width=pd.PdfPageFormat.a4.width;
    var pdfBlackColor= pd.PdfColors.black;
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


          return   Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: pd.PdfColors.white,
                borderRadius: BorderRadius.circular(10)),
            child: invoiceDetailLayout(imageData,imageData2),
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


static Widget invoiceDetailLayout(imageData,imageData2){
    return  Stack(children: [
      Column(
        children: [

        _memoryImage(imageData.buffer.asUint8List(),width: pd.PdfPageFormat.a3.width),
          Container(
              height: 50,
              decoration: const BoxDecoration(

            color: pd.PdfColor.fromInt(0xffC0C0C0),
            border: Border(bottom: BorderSide(color: pd.PdfColors.black,width: 5.0))
          )
          ,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text("Customer's Copy",style:TextStyle(
                fontSize: 25,

               fontWeight: FontWeight.bold
              )),
              Text("Original",style:TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
              )),
              Text("Invoice",style:TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
              ))
              
              
            ]
          ),
        )

    ]

  ),
      Positioned(
        bottom: 0,
        child:      _memoryImage(imageData2.buffer.asUint8List(),fit: BoxFit.fitWidth),
      )
    ]);

}


  Future<Uint8List> generateDocumentForInvoice(invoiceDataList) async {
    //var allStudents = new List.from(absentStudents)..addAll(presentStudents);
    final Document doc = Document();

    final imageJpg =
    (await rootBundle.load(Assets.headerPdf)).buffer.asUint8List();
    final imageJpgfooter =
    (await rootBundle.load(Assets.footerPdf)).buffer.asUint8List();
final height=1.sh;
    final width=1.sw;
   var pdfBlackColor= pd.PdfColors.black;
    doc.addPage(MultiPage(
      // maxPages: 5000,

        pageFormat: PdfPageFormat.a4,
        // PdfPageFormat.letter.copyWith(marginBottom: 1.5 * PdfPageFormat.mm),
        crossAxisAlignment: CrossAxisAlignment.start,
        header: (Context context) {
          return Column(crossAxisAlignment: CrossAxisAlignment.start,
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
          return Column(crossAxisAlignment: CrossAxisAlignment.start,
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
                              padding: EdgeInsets.only(
                                  bottom: height / 100),
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
                                            ? "Sardar Cahse Blanket And Bedding Store"
                                            : index == 1
                                            ? "M. Fayaz / M. Shehzad / M. S"
                                            : index == 2
                                            ? "03244796788"
                                            : "Village Sorha Near Masjid Rahmania Kahna Nao Nishat Milll Ltd Lahore",
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
                              padding: EdgeInsets.only(
                                  bottom: height / 100),
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
                                            ? "Diamond"
                                            : index == 1
                                            ? "Bilal Jabbar"
                                            : index == 2
                                            ? "3979"
                                            : index == 3
                                            ? "25.July.2023"
                                            : "Muhammad Bilal",
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
                                            textAlign:
                                            TextAlign.center,
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
                                            textAlign:
                                            TextAlign.center,
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
                                            textAlign:
                                            TextAlign.center,
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
                                            textAlign:
                                            TextAlign.center,
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
                  invoiceListDataTableData(0, invoiceDataList.length,invoiceDataList),
                  totalAmountInvoice()
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
                      "Two million five hundred eighty-six thousand two hundred and fifty",
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
Widget totalAmountInvoice() {
  final height=1.sh;
  final width=1.sw;
  var pdfblackcolor= pd.PdfColors.black;
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
                "70",
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
                "487",
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
                "34902223",
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

  Widget invoiceListDataTableData(int length, int countlength,List<InvoiceDetailModel> invoiceDataList) {
    final height=1.sh;
    final width=1.sw;
    var pdfBlackColor= pd.PdfColors.black;
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