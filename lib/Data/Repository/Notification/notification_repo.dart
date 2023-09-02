import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hbk/Data/AppData/app_preferences.dart';

import '../../../Application/Services/ApiServices/api_services.dart';
import '../../DataSource/Resources/api_constants.dart';

class NotificationRepo {
  Future getNotifications() async {
    try {
      return await Api.getCat(notificationUrl).then((value) {
        if (kDebugMode) {
          print("Notification Response $value");
        }
        if (value.runtimeType != int) {
          return jsonDecode(value);
        } else {
          // print("here");
          return value;
        }
      }).catchError((e) {
        throw e;
      });
    } catch (e) {
      rethrow;
    }
  }

  Future readNotification(String aCode, String rCode) async {
    final _data = {
      'acode': aCode,
      'rcode': rCode,
    };

    var header = {
      "Authorization": "Bearer ${SharedPrefs.getUserToken()}",
      'Content-Type': 'application/x-www-form-urlencoded',
      //'Content-Type': 'application/json'
    };
    return await Api.post(readNotificationUrl, _data, header: header)
        .then((value) {
      print('$value');
    });
  }
}
