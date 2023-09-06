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
}
