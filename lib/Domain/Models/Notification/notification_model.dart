import 'dart:convert';

class NotificationsModel {
  final int? id;
  final String? acode;
  final String? rcode;
  final String? type;
  final String? title;
  final String? notificationMsg;
  final String? imageUrl;
  final String? dateTime;
  final String? pstatus;

  NotificationsModel({
    this.id,
    this.acode,
    this.rcode,
    this.type,
    this.title,
    this.notificationMsg,
    this.imageUrl,
    this.dateTime,
    this.pstatus,
  });

  factory NotificationsModel.fromRawJson(String str) =>
      NotificationsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NotificationsModel.fromJson(Map<String, dynamic> json) =>
      NotificationsModel(
        id: json["id"],
        acode: json["Acode"],
        rcode: json["Rcode"],
        type: json["Type"],
        title: json["Title"],
        notificationMsg: json["NotificationMsg"],
        imageUrl: json["ImageUrl"],
        dateTime: json["DateTime"],
        pstatus: json["pstatus"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Acode": acode,
        "Rcode": rcode,
        "Type": type,
        "Title": title,
        "NotificationMsg": notificationMsg,
        "ImageUrl": imageUrl,
        "DateTime": dateTime,
        "pstatus": pstatus,
      };
}
