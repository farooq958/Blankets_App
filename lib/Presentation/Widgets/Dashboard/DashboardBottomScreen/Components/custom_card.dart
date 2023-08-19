import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hbk/Data/DataSource/Resources/text_styles.dart';
import 'package:hbk/Presentation/Common/app_text.dart';

class CustomCard extends StatelessWidget {
  final String name;
  final String amount;

  const CustomCard({super.key, required this.name, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110.w,
      height: 61.h,
      padding: const EdgeInsets.only(
        top: 10,
        left: 15,
        right: 10.50,
        bottom: 10,
      ),
      decoration: ShapeDecoration(
        color: const Color(0xFF0C4A9F),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 12,
            offset: Offset(0, 6),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         const SizedBox(height: 5),
          AppText(
             name,
             maxLine: 2,
             style: Styles.circularStdBold(
               context,
               color: Colors.white,
               fontSize: 12.sp,

               fontWeight: FontWeight.w500,
             ),
           ),
          const SizedBox(height:5 ),
          Expanded(
            child: AppText(
             "Rs $amount",

              style: Styles.circularStdBold(
                context,
                color: Colors.white,
                fontSize: 13.sp,

                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}