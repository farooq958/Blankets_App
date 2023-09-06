import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hbk/Application/Services/ApiServices/api_services.dart';
import 'package:hbk/Data/AppData/app_preferences.dart';
import 'package:hbk/Data/DataSource/Resources/api_constants.dart';

class OrdersRepo {
  static Future getOrders() async {
    String cardCode = "CardCode=${SharedPrefs.userData!.cardCode}";

    try {
      return Api.getCat(ordersUrl + cardCode).then((value) {
        if (value.runtimeType != int) {
          var data = jsonDecode(value);
          if (data.runtimeType == List<dynamic>) {
            return jsonDecode(value);
          } else {
            return 600;
          }
        } else {
          return value;
        }
      }).catchError((e) {
        throw e;
      });
    } catch (e) {
      rethrow;
    }
  }

  static Future postOrders(data)async{

    print("In Repo Data $data");
    try {
      return await Api.postOrder( data,url:'http://imtxt.sbsolutions.com.pk:44891/api/lookupApi/PostSAPSalesOrders',).then((value) {

        print("value $value");
        return value;
      }).catchError((e) {
        throw e;
      });
    } catch (e) {
      rethrow;
    }
  }
}
