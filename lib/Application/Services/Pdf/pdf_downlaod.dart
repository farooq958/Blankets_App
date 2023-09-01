import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:hbk/Application/Services/Downloader/file_downloader.dart';
import 'package:hbk/Application/Services/NotificationServices/notification_services.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/Statement/Component/pdf_layout.dart';
import 'package:pdf/src/widgets/widget.dart' as pd;

import 'generate_pdf.dart';

class PdfDownload{


  Future<File?> generatePdfForStatement(statementDataList) async {
    try{
//       Uint8List pdfData = await PDFLayouts.customerStatement(
// listOfTitle,listOfData,
// pdfWidget,pdfTitleWidget
//
//       );
      Uint8List pdfData=await PDFLayouts().generateDocumentForStatement(statementDataList);
      File? tempFilePath = await GeneratePDF.hbkInvoice(pdfData);
      //print(tempFilePath!.path);
      print(tempFilePath.runtimeType);
      if(tempFilePath != null){

        print("here");
        await FileDownloader.download(tempFilePath.absolute.path);
        Future.delayed(const Duration(seconds: 2)).then((value){

          NotificationServices()
              .showNotification(Random().nextInt(1000), 'PDF Saved', tempFilePath.path, payload: tempFilePath.path);

        });
        return tempFilePath;
      }
      return null;
    }catch(e){
      print('Error : $e');
    }
  }

  Future<File?> generatePdfForPrice(priceList) async {
    try{
//       Uint8List pdfData = await PDFLayouts.customerStatement(
// listOfTitle,listOfData,
// pdfWidget,pdfTitleWidget
//
//       );
      Uint8List pdfData=await PDFLayouts().generateDocumentForPriceList(priceList);
      File? tempFilePath = await GeneratePDF.hbkInvoice(pdfData);
      //print(tempFilePath!.path);
      print(tempFilePath.runtimeType);
      if(tempFilePath != null){

        print("here");
        await FileDownloader.download(tempFilePath.absolute.path);
        Future.delayed(const Duration(seconds: 2)).then((value){

          NotificationServices()
              .showNotification(Random().nextInt(1000), 'PDF Saved', tempFilePath.path, payload: tempFilePath.path);

        });
        return tempFilePath;
      }
      return null;
    }catch(e){
      print('Error : $e');
    }
  }

  Future<File?> generatePdfForReward(rewardList) async {
    try{
//       Uint8List pdfData = await PDFLayouts.customerStatement(
// listOfTitle,listOfData,
// pdfWidget,pdfTitleWidget
//
//       );
      Uint8List pdfData=await PDFLayouts().generateDocumentForReward(rewardList);
      File? tempFilePath = await GeneratePDF.hbkInvoice(pdfData);
      //print(tempFilePath!.path);
      print(tempFilePath.runtimeType);
      if(tempFilePath != null){

        print("here");
        await FileDownloader.download(tempFilePath.absolute.path);
        Future.delayed(const Duration(seconds: 2)).then((value){

          NotificationServices()
              .showNotification(Random().nextInt(1000), 'PDF Saved', tempFilePath.path, payload: tempFilePath.path);

        });
        return tempFilePath;
      }
      return null;
    }catch(e){
      print('Error : $e');
    }
  }


  Future<File?> generatePdf(listOfTitle,listOfData ,pdfWidget,pdfTitleWidget) async {
    try{
//       Uint8List pdfData = await PDFLayouts.customerStatement(
// listOfTitle,listOfData,
// pdfWidget,pdfTitleWidget
//
//       );
      Uint8List pdfData=await PDFLayouts().generateDocumentForInvoice(listOfData);
      File? tempFilePath = await GeneratePDF.hbkInvoice(pdfData);
      //print(tempFilePath!.path);
      print(tempFilePath.runtimeType);
      if(tempFilePath != null){

        print("here");
        await FileDownloader.download(tempFilePath.absolute.path);
        Future.delayed(const Duration(seconds: 2)).then((value){

          NotificationServices()
              .showNotification(Random().nextInt(1000), 'PDF Saved', tempFilePath.path, payload: tempFilePath.path);

        });
        return tempFilePath;
      }
      return null;
    }catch(e){
      print('Error : $e');
    }
  }

}