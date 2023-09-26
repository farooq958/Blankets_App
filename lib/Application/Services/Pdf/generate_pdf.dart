import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:hbk/Data/AppData/app_permision.dart';
import 'package:hbk/Data/DataSource/Resources/imports.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/PriceListScreen/price_list_screen.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:url_launcher/url_launcher.dart';

class GeneratePDF {
  // static final pdf = Document();

  static Future<void> generateDocumentForPriceList(
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
                              child: pw.Text('Haris Akhtar',
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

    final appDocDir = await getApplicationDocumentsDirectory();
    final appDocPath = appDocDir.path;
    final file = File(appDocPath + '/' + 'Pricelist.pdf');
    print('Save as file ${file.path} ...');
    // await file.writeAsBytes(bytes);
    print('saving file');
    await file.writeAsBytes(await doc.save());
    print('opening file');
    await OpenFile.open(file.path);
  }

  static Future<File?> hbkInvoice(Uint8List data) async {
    File? file;
    if (Platform.isIOS) {
      Directory? tempDir = await getApplicationDocumentsDirectory();
      print("here");
      File? tempFile = await File(
              '${tempDir.path}/${DateTime.now().year}_${DateTime.now().month}${DateTime.now().millisecond}_${DateTime.now().month}${DateTime.now().millisecond}.pdf')
          .create(recursive: false);
      //print("filee ${file!.path}");

      file = await tempFile.writeAsBytes(data);

      //await file.writeAsBytes(data);

      return file;
    } else {
      bool check =
          await AppPermissions.hasStoragePermission(onSuccess: () async {
        // print()
        //file=temp;
        //print("filee2 ${temp!.path}");

        // await FileDownloader.download(file.uri.path);
      });
      //  print("nooo ${file?.absolute}");

      if (check == true) {
        Directory? tempDir = await AppPermissions.prepareSaveDir();
        print("here in hbk data ${tempDir.path}");
        // File? tempFile = await File(
        //         '${tempDir!.parent.parent.parent.parent.path}/Documents/${DateTime.now().year}_${DateTime.now().month}${DateTime.now().millisecond}_${DateTime.now().month}${DateTime.now().millisecond}.pdf')
        //     .create(recursive: false);
        //print("filee ${file!.path}");
        File? tempFile = await File(
                '${tempDir.path}/${DateTime.now().year}_${DateTime.now().month}${DateTime.now().millisecond}_${DateTime.now().month}${DateTime.now().millisecond}.pdf')
            .create(recursive: false);
        file = await tempFile.writeAsBytes(data);

        //await file.writeAsBytes(data);

        return file;
      } else {
        return null;
      }
    }
  }

  ///PDF UI for coach side play Attendance
  static playerInvoice() {}
}
