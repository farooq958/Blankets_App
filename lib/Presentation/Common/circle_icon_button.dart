import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';

class CircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final Color? color;
  final Color? iconColor;
  final double? iconSize;
final  EdgeInsetsGeometry? padding;
  const CircleIconButton(
      {super.key, required this.icon, required this.onPressed,this.width,this.height,this.color,this.iconColor, this.iconSize, this.padding});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width?? 50.w,
         height: height?? 30.h,
       padding: padding?? EdgeInsets.zero,
       // margin: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color?? Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(icon, size:iconSize?? 25,color: iconColor??AppColors.blackColor,),
      ),
    );
  }
}