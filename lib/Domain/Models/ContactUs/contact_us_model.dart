// To parse this JSON data, do
//
//     final contactUs = contactUsFromJson(jsonString);

import 'dart:convert';

ContactUs contactUsFromJson(String str) => ContactUs.fromJson(json.decode(str));

String contactUsToJson(ContactUs data) => json.encode(data.toJson());

class ContactUs {
  List<Branch>? branches;

  ContactUs({
    this.branches,
  });

  factory ContactUs.fromJson(Map<String, dynamic> json) => ContactUs(
    branches: json["branches"] == null ? [] : List<Branch>.from(json["branches"]!.map((x) => Branch.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "branches": branches == null ? [] : List<dynamic>.from(branches!.map((x) => x.toJson())),
  };
}

class Branch {
  String? name;
  String? timing;
  String? address;
  String? phone;
  String? mobile;
  String? email;

  Branch({
    this.name,
    this.timing,
    this.address,
    this.phone,
    this.mobile,
    this.email,
  });

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
    name: json["name"],
    timing: json["timing"],
    address: json["address"],
    phone: json["phone"],
    mobile: json["Mobile"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "timing": timing,
    "address": address,
    "phone": phone,
    "Mobile": mobile,
    "email": email,
  };
}
