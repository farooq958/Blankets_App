import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hbk/Data/DataSource/Resources/text_styles.dart';
import 'package:hbk/Presentation/Common/app_text.dart';

class CustomInfoWidget extends StatelessWidget {
  final String nameInfo;
  final String nameInfoValue;
  const CustomInfoWidget({super.key, required this.nameInfo, required this.nameInfoValue});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110.w,
      height: 59,
      child:  Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            nameInfo,
            style: Styles.circularStdBold(
              context,
              color: const Color.fromRGBO(0, 0, 0, 0.4), // Equivalent to black with 40% opacity
              fontSize: 15.sp,

              fontWeight: FontWeight.w500,

            ),
          ),
          const SizedBox(height: 2),
           Expanded(
             flex: 2,
             child: AppText(
               nameInfoValue,
              maxLine: 2,
              style: Styles.circularStdBold(context,
                color: Colors.black, // Regular black color
                fontSize: 16.sp,

                fontWeight: FontWeight.w500,
              ),
          ),
           ),
        ],
      ),
    );
  }
}