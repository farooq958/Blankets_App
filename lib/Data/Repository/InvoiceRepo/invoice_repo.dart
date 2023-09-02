import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hbk/Application/Services/ApiServices/api_services.dart';
import 'package:hbk/Data/AppData/app_preferences.dart';
import 'package:hbk/Data/DataSource/Resources/api_constants.dart';

class InvoiceRepo{

  Future<dynamic> getInvoices()async{
    try{
      return await Api.getCat(invoiceUrl+SharedPrefs.userData!.cardCode.toString()).then((value){
        if (kDebugMode) {
          print("all invoices Response $value");
        }
        if(value.runtimeType != int) {
          return jsonDecode(value);
        }
        else {
          // print("here");
          return value;
        }
      }).catchError((e){
        throw e;
      });
    }catch(e){
      rethrow;
    }
  }

  Future<dynamic> getInvoicesDetails(String docEntry)async{
    try{
      return await Api.getCat(invoiceDetailUrl+docEntry).then((value){
        if (kDebugMode) {
          print("detail invoices Response $value");
        }
        if(value.runtimeType != int) {
          return jsonDecode(value);
        }
        else {
          // print("here");
          return value;
        }
      }).catchError((e){
        throw e;
      });
    }catch(e){
      rethrow;
    }
  }



}