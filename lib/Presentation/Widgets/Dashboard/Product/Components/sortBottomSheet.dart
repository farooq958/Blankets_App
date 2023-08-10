import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hbk/Data/DataSource/Resources/text_styles.dart';
import 'package:hbk/Presentation/Common/app_text.dart';
import 'package:hbk/Presentation/Common/custom_radio_button.dart';

class SortSheet  {



  static void  showBottomSheet(BuildContext context,Widget messageWidget,String title) {
    showCupertinoModalPopup(
      context: context,

      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title:  FractionallySizedBox(
            widthFactor: 1.2,
            child: Align(

                alignment: Alignment.centerLeft,
                child:
                AppText(title, style: Styles.circularStdRegular(context,letterSpacing: 1.1,fontWeight:
                FontWeight.w600,fontSize: 19.sp),)),
          ),
          message: FractionallySizedBox(
              widthFactor: 1.2,
              child: messageWidget),
          // actions: <Widget>[
          //   // CupertinoActionSheetAction(
          //   //   child: Text('Option 1'),
          //   //   onPressed: () {
          //   //     Navigator.pop(context, 'Option 1');
          //   //   },
          //   // ),
          //   // CupertinoActionSheetAction(
          //   //   child: const Text('Option 2'),
          //   //   onPressed: () {
          //   //     Navigator.pop(context, 'Option 2');
          //   //   },
          //   // ),
          // ],

        );
      },
    );
  }
}
