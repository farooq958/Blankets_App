import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Resources/sized_box.dart';
import 'package:hbk/Data/DataSource/Resources/text_styles.dart';
import 'package:hbk/Presentation/Common/app_text.dart';

class DrawerRow extends StatelessWidget {
  final String? iconPath;
  final String? screenName;
 final VoidCallback? onTap;

  const DrawerRow({super.key, this.iconPath, this.screenName, this.onTap});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 20.sp,
        child: Row(
          children: <Widget>[
            SvgPicture.asset(iconPath!,width: 20.sp,height: 20.sp,),
            CustomSizedBox.width(10),
            AppText(screenName!, style: Styles.circularStdRegular(context,fontWeight: FontWeight.w400,color: AppColors.whiteColor,fontSize: 15.sp))



          ],
        ),
      ),
    );

  }
}
