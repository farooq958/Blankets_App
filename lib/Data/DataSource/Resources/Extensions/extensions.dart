import 'package:hbk/Data/DataSource/Resources/imports.dart';

extension CustomSizedBoxExt on num {
  SizedBox get x => SizedBox(width: w);
  SizedBox get y => SizedBox(height: h);
}

extension OfficeTimingsExtension on String {
  List<String> getOfficeTimings(String season) {
    // "Office Timing: Summer  (10:00am  08:00pm), Winter  (10:00am  07:00pm)"
    final seasonSplit = season.split("Office Timing:");


    final seasonSplit2 = seasonSplit[1].split(",");

    final summer = seasonSplit2[0].split("Summer")[1];

    final winter = seasonSplit2[1].split("Winter")[1];

    return [summer,winter];

  }
}