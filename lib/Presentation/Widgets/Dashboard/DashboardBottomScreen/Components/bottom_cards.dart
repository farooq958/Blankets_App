import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Resources/text_styles.dart';
import 'package:hbk/Presentation/Common/app_text.dart';

class BottomCards extends StatelessWidget {
  final String imageAsset;
  final String mainStatus;
  final String statusValue;
  const BottomCards({super.key, required this.imageAsset, required this.mainStatus, required this.statusValue});

  @override
  Widget build(BuildContext context) {
    return  Container(
        width: 160.w,
        height: 100,
       // padding: const EdgeInsets.symmetric(horizontal: 9.50, vertical: 20),
    decoration: ShapeDecoration(
    color: Colors.white,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
    ),
    shadows: const [
    BoxShadow(
    color: Color(0x0F000000),
    blurRadius: 12,
    offset: Offset(2, 6),
    spreadRadius: 0,
    )
    ],
    ),
    child: Row(
    children: <Widget>[

      Expanded(
        child: Align(
          child: Container(
          width: 40,
          height: 40,
          padding: const EdgeInsets.all(8),
          decoration: ShapeDecoration(
            color: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Center(child: SvgPicture.asset(imageAsset),),

          ),
        ),
      ),
SizedBox(width: 10.sp,),
      Expanded(
        flex: 2,
        child: SizedBox(
          width: 80,
          height: 44,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             AppText(
               mainStatus,
                style: Styles.circularStdBold(context,
                  color: AppColors.primaryColor,
                  fontSize: 14,

                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 3),
              AppText(
                statusValue,
                style: Styles.circularStdBold(context,
                  color: AppColors.primaryColor,
                  fontSize: 14,

                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      )

    ],
    ),

    );
  }
}
