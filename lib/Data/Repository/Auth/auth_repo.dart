import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hbk/Application/Services/ApiServices/api_services.dart';
import 'package:hbk/Data/AppData/app_preferences.dart';

class AuthRepo {
  Future<dynamic> loginToken(body) async {
    try {
      var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
      return await Api.post("http://imtxt.sbsolutions.com.pk:44891/token", body,
              header: headers)
          .then((value) {
        if (kDebugMode) {
          print("P Response ${value}");
        }

        return value;
      }).catchError((e) {
        throw e;
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> loginIt(username, password) async {
    try {
      var body = {
        'grant_type': 'password',
        'username': username,
        'password': password
      };
      return await loginToken(body).then((value1) async {
        print('value1');
        print(value1['body']);
        if (value1['access_token'] != null) {
          await SharedPrefs.setUserToken(token: value1['access_token']);
          print("---user--token---${SharedPrefs.getUserToken()}");
          return await Api.getCat(
                  'http://imtxt.sbsolutions.com.pk:44891/api/lookupApi/LoginSAPCustomer?CustomerCode=$username&password=$password')
              .then((value) {
            if (kDebugMode) {
              print("login Response $value");
            }
            if (value.runtimeType != int && value.runtimeType == String) {
              return jsonDecode(value);
            } else {
              return value;
            }
          }).catchError((e) {
            throw e;
          });
        }
        if (value1['body'] != null) {
          return jsonDecode(value1['body']);
        }
        if (value1['success'] != null) {
          return value1;
        }
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> updateSharedPref(username, password) async {
    try {
      return await Api.getCat(
              'http://imtxt.sbsolutions.com.pk:44891/api/lookupApi/LoginSAPCustomer?CustomerCode=$username&password=$password')
          .then((value) {
        if (kDebugMode) {
          print("login Response $value");
        }
        if (value.runtimeType != int && value.runtimeType == String) {
          return jsonDecode(value);
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
