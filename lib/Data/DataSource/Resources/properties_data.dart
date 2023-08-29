

import 'package:hbk/Domain/Models/HomeScreen/product_model.dart';

class OriginProps {
  //origin
  static const prop1 = "China";
  static const prop2 = "Spain";
  static const prop3 = "Korea";
  static const prop4 = "Vietnam";
  static const prop5 = "UAE";
  static const prop16 = "Pakistan";
  static const prop20 = "Turkey";
  static const prop21 = "Items Property";
}

class CatProps {
  static const prop6 = "General Products";
  static const prop7 = "Flannel Blanket & Bed Cover";
  static const prop8 = "Single Bed & Medium Blanket";
  static const prop9 = "1 PLY Double Bed Blanket";
  static const prop10 = "2 PLY Double Bed Blanket";
  static const prop11 = "Bed Cover Set";
  static const prop12 = "Baby Blanket";
  static const prop22 = "Items Property";
}

class GroupProps {
  static const prop13 = "H";
  static const prop14 = "B";
  static const prop15 = "Common";
}

class GradeProp {
  static const prop17 = "B Grade";
  static const prop18 = "C Grade";
  static const prop19 = "D Grade";
}

class General {
  static const prop23 = "Embossed";
  static const prop24 = "New Arrival";
  static const prop25 = "Show on Customer App";
}

String getCatStringchecking(List<dynamic> productlist, int index) {
  // For Brands
  String cat = "";
  if (productlist[index]['Property6'] == "Y") {
    cat = CatProps.prop6;
  }
  if (productlist[index]['Property7'] == "Y") {
    cat = CatProps.prop7;
  }
  if (productlist[index]['Property8'] == "Y") {
    cat = CatProps.prop8;
  }
  if (productlist[index]['Property9'] == "Y") {
    cat = CatProps.prop9;
  }
  if (productlist[index]['Property10'] == "Y") {
    cat = CatProps.prop10;
  }
  if (productlist[index]['Property11'] == "Y") {
    cat = CatProps.prop11;
  }
  if (productlist[index]['Property12'] == "Y") {
    cat = CatProps.prop12;
  }
  if (productlist[index]['Property22'] == "Y") {
    cat = CatProps.prop22;
  }
  // print("cat is $cat");
  return cat;
}

String getCatStringForPriceList(ProductApiModel productData) {
  // For Brands
  String cat = "";
  if (productData.qryGroup6 == "Y") {
    cat = CatProps.prop6;
  }
  if (productData.qryGroup7 == "Y") {
    cat = CatProps.prop7;
  }
  if (productData.qryGroup8 == "Y") {
    cat = CatProps.prop8;
  }
  if (productData.qryGroup9 == "Y") {
    cat = CatProps.prop9;
  }
  if (productData.qryGroup10 == "Y") {
    cat = CatProps.prop10;
  }
  if (productData.qryGroup11 == "Y") {
    cat = CatProps.prop11;
  }
  if (productData.qryGroup12 == "Y") {
    cat = CatProps.prop12;
  }
  if (productData.qryGroup22 == "Y") {
    cat = CatProps.prop22;
  }
  // print("cat is $cat");
  return cat;
}

 String getOriginString(ProductApiModel productData) {
  // For countries
  String origin = "";
  if (productData.qryGroup1 == "Y") {
    origin = OriginProps.prop1;
  }
  if (productData.qryGroup2 == "Y") {
    origin = OriginProps.prop2;
  }
  if (productData.qryGroup3 == "Y") {
    origin = OriginProps.prop3;
  }
  if (productData.qryGroup4 == "Y") {
    origin = OriginProps.prop4;
  }
  if (productData.qryGroup5 == "Y") {
    origin = OriginProps.prop5;
  }
  if (productData.qryGroup16 == "Y") {
    origin = OriginProps.prop16;
  }
  if (productData.qryGroup20 == "Y") {
    origin = OriginProps.prop20;
  }
  if (productData.qryGroup21 == "Y") {
    origin = OriginProps.prop21;
  }

  print(origin+"originnnn");
  return origin;
}

String getOriginStringforprice(dynamic productlist) {
  // For countries
  String origin = "";
  if (productlist['Property1'] == "Y") {
    origin = OriginProps.prop1;
  }
  if (productlist['Property2'] == "Y") {
    origin = OriginProps.prop2;
  }
  if (productlist['Property3'] == "Y") {
    origin = OriginProps.prop3;
  }
  if (productlist['Property4'] == "Y") {
    origin = OriginProps.prop4;
  }
  if (productlist['Property5'] == "Y") {
    origin = OriginProps.prop5;
  }
  if (productlist['Property16'] == "Y") {
    origin = OriginProps.prop16;
  }
  if (productlist['Property20'] == "Y") {
    origin = OriginProps.prop20;
  }
  if (productlist['Property21'] == "Y") {
    origin = OriginProps.prop21;
  }
  return origin;
}

String getEmbossedString(ProductApiModel productData) {
  String emboss = "";
  if (productData.qryGroup23 == "Y") {
    emboss = "Yes";
  } else {
    emboss = "No";
  }
  return emboss;
}


