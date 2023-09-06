import 'dart:convert';
//import 'dart:ffi';
import 'package:hbk/Data/AppData/app_preferences.dart';
import 'package:hbk/Domain/Models/Auth/user_data.dart';
import 'package:http/http.dart' as http;

class Api {
  static Map<String, String> _authMiddleWare() {
    String? us = SharedPrefs.getUserToken();
    print(us);

    return us != null
        ? {
            "Authorization": "Bearer $us",
            //'Content-Type': 'application/json',
            //'Content-Type': 'application/json'
          }
        : {
            'Content-Type': 'application/json',
          };
  }

  static Future<Map<String, dynamic>> get(String url,
      {Map<String, String>? headers}) async {
    try {
      http.Response res = await http.get(
        Uri.parse(url),
        headers: headers ?? _authMiddleWare(),
      );
      if (res.statusCode == 200) {
        Map<String, dynamic> decode = jsonDecode(res.body);
        return decode;
      }
      return {"success": false, "error": res.body, "body": null};
    } catch (e) {
      rethrow;
    }
  }

  static getCat(String url, {Map<String, String>? header}) async {
    var request = http.Request('GET', Uri.parse(url));
    request.headers.addAll(header ?? _authMiddleWare());

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print();
      return await response.stream.bytesToString();
    } else if (response.statusCode == 401) {
      print(response.reasonPhrase);
      return 401;
    }
  }

  static Future<Map<String, dynamic>> post(
      String url, Map<String, dynamic> body,
      {Map<String, String>? header}) async {
    try {
      // final headers = {'Content-Type': 'application/json'};

      http.Response res = await http.post(
        Uri.parse(url),
        headers: header ?? _authMiddleWare(),
        body: (body),
      );
      print("Response ${res.body}");
      if (res.statusCode == 200 || res.statusCode == 201) {
        Map<String, dynamic> decode = jsonDecode(res.body);
        return decode;
      }

      return {
        "success": false,
        "error": "${res.statusCode} ${res.reasonPhrase}",
        "body": res.body
      };
    } catch (e) {
      return Future.error(e);
    }
  }

  static Future<Map<String, dynamic>> postMultipart(
      String url, Map<String, dynamic> body, List<String?> filesPath,
      {Map<String, String>? header,
      String? requestMethod,
      String? imagePathName}) async {
    try {
      print("here2");
      // //  UserData? us = SharedPrefs.getUserLoginData();
      //   print(us?.token);
      //   print(us?.user.id);
      // final headers = {'authorization': 'Bearer ${us!.token}'};
      var request =
          http.MultipartRequest(requestMethod ?? 'POST', Uri.parse(url));
      //request.fields.addAll(body);

      for (var str in body.entries) {
        if (str.value != null) {
          if (str.value.runtimeType is bool || str.key.runtimeType is bool) {
            print("herewe");
            request.fields[str.key.toString()] = str.value.toString();
          } else {
            request.fields[str.key] = str.value;
          }
          print(str.key);
        }
      }
      // request.fields.addEntries(body.entries);

      //request.headers.addAll(headers);
      for (String? e in filesPath) {
        //print(e);
        request.files.add(
            await http.MultipartFile.fromPath(imagePathName ?? 'files', e!));
      }

      http.StreamedResponse res = await request.send();
      // print(res.statusCode.toString() +"status code");
      if (res.statusCode == 200 || res.statusCode == 201) {
        Map<String, dynamic> decode =
            jsonDecode(await res.stream.bytesToString());
        return decode;
      }

      return {
        "success": false,
        "error": "${res.statusCode} ${res.reasonPhrase}",
        "body": null
      };
    } catch (e) {
      return Future.error(e);
    }
  }

  static Future<Map<String, dynamic>> postMultipartFeedback(
      String url,
      Map<String, dynamic> body,
      List<String?> filesPath,
      List<String?> thumbnailImages,
      {Map<String, String>? header,
      String? requestMethod,
      String? imagePathName}) async {
    try {
      // print("here2");
      // UserData? us = SharedPrefs.getUserLoginData();
      // print(us?.token);
      // print(us?.user.id);
      //     final headers = {'authorization': 'Bearer ${us!.token}'};
      var request =
          http.MultipartRequest(requestMethod ?? 'POST', Uri.parse(url));
      //request.fields.addAll(body);

      for (var str in body.entries) {
        if (str.value != null) {
          if (str.value.runtimeType is bool || str.key.runtimeType is bool) {
            // print("herewe");
            request.fields[str.key.toString()] = str.value.toString();
          } else {
            request.fields[str.key] = str.value;
          }
          //  print(str.key);
        }
      }
      // request.fields.addEntries(body.entries);

      //  request.headers.addAll(headers);

      if (filesPath.isNotEmpty) {
        for (String? e in filesPath) {
          //print(e);
          request.files.add(
              await http.MultipartFile.fromPath(imagePathName ?? 'files', e!));
        }
      }
      if (thumbnailImages.isNotEmpty) {
        for (String? e in thumbnailImages) {
          //print(e);
          request.files.add(await http.MultipartFile.fromPath('thumbnail', e!));
        }
      }

      http.StreamedResponse res = await request.send();
      // print(res.statusCode.toString() +"status code");
      if (res.statusCode == 200 || res.statusCode == 201) {
        Map<String, dynamic> decode =
            jsonDecode(await res.stream.bytesToString());
        return decode;
      }

      return {
        "success": false,
        "error": "${res.statusCode} ${res.reasonPhrase}",
        "body": jsonDecode(await res.stream.bytesToString())
      };
    } catch (e) {
      return Future.error(e);
    }
  }

  static Future<Map<String, dynamic>> postMultipart2(
      String url, Map<String, dynamic> body, List<String?> filesPath,
      {Map<String, String>? header,
      String? requestMethod,
      String? imagePathName}) async {
    try {
      print("here2");
      // UserData? us = SharedPrefs.getUserLoginData();
      // print(us?.token);
      // print(us?.user.id);
      // final headers = {'authorization': 'Bearer ${us!.token}'};
      var request =
          http.MultipartRequest(requestMethod ?? 'POST', Uri.parse(url));
      //request.fields.addAll(body);
      print(body);
      for (var str in body.entries) {
        if (str.value != null) {
          if (str.value.runtimeType is bool || str.key.runtimeType is bool) {
            // print("herewe");
            request.fields[str.key.toString()] = str.value.toString();
          } else {
            request.fields[str.key] = str.value;
          }
          print(str.key);
        }
      }
      // request.fields.addEntries(body.entries);

      //  request.headers.addAll(headers);
      for (String? e in filesPath) {
        //print(e);
        request.files.add(
            await http.MultipartFile.fromPath(imagePathName ?? 'files', e!));
      }

      http.StreamedResponse res = await request.send();
      // print(res.statusCode.toString() +"status code");
      if (res.statusCode == 200 || res.statusCode == 201) {
        Map<String, dynamic> decode =
            jsonDecode(await res.stream.bytesToString());
        return decode;
      }

      return {
        "success": false,
        "error": "${res.statusCode} ${res.reasonPhrase}",
        "body": null
      };
    } catch (e) {
      return Future.error(e);
    }
  }

  static Future post1(
    Map<String, dynamic> body, {
    required String url,
  }) async {
    try {
      final response = await http.post(Uri.parse(url),
          headers: _authMiddleWare(), body: jsonEncode(body));

      print("Response status ${response.statusCode}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return 200;
      } else {
        throw Exception('Failed to sign up user');
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  static Future<Map<String, dynamic>> put(
      String url, Map<String, dynamic>? body,
      {Map<String, String>? headers}) async {
    try {
      //print(body);
      http.Response res = await http.put(
        Uri.parse(url),
        headers: headers ?? _authMiddleWare(),
        body: jsonEncode(body),
        //encoding: Encoding.getByName("application/x-www-form-urlencoded")
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        Map<String, dynamic> decode = jsonDecode(res.body);
        return decode;
      }

      return {
        "success": false,
        "error": "${res.statusCode} ${res.reasonPhrase}",
        "body": null
      };
    } catch (e) {
      return Future.error(e);
    }
  }

  static Future<int> putPublic(String url, Map<String, dynamic>? body,
      {Map<String, String>? headers}) async {
    try {
      //print(body);
      http.Response res = await http.put(
        Uri.parse(url),
        // headers: headers ?? _authMiddleWare(),
        //body: jsonEncode(body),
        //encoding: Encoding.getByName("application/x-www-form-urlencoded")
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        Map<String, dynamic> decode = jsonDecode(res.body);
      }

      return res.statusCode;
    } catch (e) {
      return Future.error(e);
    }
  }

  static Future<Map<String, dynamic>> delete(String url, String id,
      {Map<String, String>? headers}) async {
    try {
      http.Response res = await http.delete(
        Uri.parse("$url/$id"),
        headers: headers ?? _authMiddleWare(),
      );
      if (res.statusCode == 200 || res.statusCode == 201) {
        Map<String, dynamic> decode = jsonDecode(res.body);
        return decode;
      }
      return {
        "success": false,
        "error": "${res.statusCode} ${res.reasonPhrase}",
        "body": null
      };
    } catch (e) {
      return Future.error(e);
    }
  }
}
