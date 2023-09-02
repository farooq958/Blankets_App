// To parse this JSON data, do
//
//     final sliderImages = sliderImagesFromJson(jsonString);

import 'dart:convert';

List<SliderImages> sliderImagesFromJson(String str) => List<SliderImages>.from(json.decode(str).map((x) => SliderImages.fromJson(x)));

String sliderImagesToJson(List<SliderImages> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SliderImages {
  int? rowId;
  String? docNum;
  String? period;
  String? instance;
  String? series;
  String? handwrtten;
  String? canceled;
  String? userSign;
  String? transfered;
  String? status;
  String? createDate;
  String? createTime;
  String? updateDate;
  String? updateTime;
  String? dataSource;
  String? requestStatus;
  String? creator;
  String? remark;
  String? uSliderTitle;
  String? uSliderStatus;
  String? lineId;
  String? visOrder;
  String? uImage;
  String? uEnabled;
  int? slidId;

  SliderImages({
    this.rowId,
    this.docNum,
    this.period,
    this.instance,
    this.series,
    this.handwrtten,
    this.canceled,
    this.userSign,
    this.transfered,
    this.status,
    this.createDate,
    this.createTime,
    this.updateDate,
    this.updateTime,
    this.dataSource,
    this.requestStatus,
    this.creator,
    this.remark,
    this.uSliderTitle,
    this.uSliderStatus,
    this.lineId,
    this.visOrder,
    this.uImage,
    this.uEnabled,
    this.slidId,
  });

  factory SliderImages.fromJson(Map<String, dynamic> json) => SliderImages(
    rowId: json["row_Id"],
    docNum: json["DocNum"],
    period: json["Period"],
    instance: json["Instance"],
    series: json["Series"],
    handwrtten: json["Handwrtten"],
    canceled: json["Canceled"],
    userSign: json["UserSign"],
    transfered: json["Transfered"],
    status: json["Status"],
    createDate: json["CreateDate"],
    createTime: json["CreateTime"],
    updateDate: json["UpdateDate"],
    updateTime: json["UpdateTime"],
    dataSource: json["DataSource"],
    requestStatus: json["RequestStatus"],
    creator: json["Creator"],
    remark: json["Remark"],
    uSliderTitle: json["U_SliderTitle"],
    uSliderStatus: json["U_SliderStatus"],
    lineId: json["LineId"],
    visOrder: json["VisOrder"],
    uImage: json["U_Image"],
    uEnabled: json["U_Enabled"],
    slidId: json["SLID_Id"],
  );

  Map<String, dynamic> toJson() => {
    "row_Id": rowId,
    "DocNum": docNum,
    "Period": period,
    "Instance": instance,
    "Series": series,
    "Handwrtten": handwrtten,
    "Canceled": canceled,
    "UserSign": userSign,
    "Transfered": transfered,
    "Status": status,
    "CreateDate": createDate,
    "CreateTime": createTime,
    "UpdateDate": updateDate,
    "UpdateTime": updateTime,
    "DataSource": dataSource,
    "RequestStatus": requestStatus,
    "Creator": creator,
    "Remark": remark,
    "U_SliderTitle": uSliderTitle,
    "U_SliderStatus": uSliderStatus,
    "LineId": lineId,
    "VisOrder": visOrder,
    "U_Image": uImage,
    "U_Enabled": uEnabled,
    "SLID_Id": slidId,
  };
}
