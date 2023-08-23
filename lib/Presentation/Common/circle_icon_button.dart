import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hbk/Data/DataSource/Resources/assets.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';

class CircleIconButton extends StatelessWidget {
  final IconData? icon;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final Color? color;
  final Color? iconColor;
  final double? iconSize;
  final String? svgIcon;
  final bool? isSvg;
  final EdgeInsetsGeometry? padding;
  final bool? isBorderRequired;
  final double? svgIconHeight;
  final double? svgIconWidth;

  const CircleIconButton(
      {super.key,
       this.icon,
      required this.onPressed,
      this.width,
      this.height,
      this.color,
      this.iconColor,
      this.iconSize,
      this.padding,
        this.svgIcon,
        this.isBorderRequired,
        this.svgIconHeight,
        this.svgIconWidth,
      this.isSvg});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width ?? 50.w,
        height: height ?? 30.h,
        padding: padding ?? EdgeInsets.zero,
        alignment: Alignment.center,
        // margin: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: isBorderRequired!=null? Border.all(color: AppColors.greyColor):null,
          color: color ?? Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color(0x0F000000),
              blurRadius: 12,
              offset: Offset(0, 6),
              spreadRadius: 0,
            )
          ],
        ),
        child: isSvg != null
            ? SvgPicture.asset(
                svgIcon!,
                width: svgIconWidth?? 20.w,
                height: svgIconHeight?? 20.h,
          alignment: Alignment.center,
          fit: BoxFit.fill,

              )
            : Icon(
                icon,
                size: iconSize ?? 25,
                color: iconColor ?? AppColors.blackColor,
              ),
      ),
    );
  }
}
