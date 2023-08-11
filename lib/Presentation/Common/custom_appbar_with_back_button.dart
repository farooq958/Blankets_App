import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hbk/Data/DataSource/Resources/assets.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Resources/text_styles.dart';
import 'package:hbk/Presentation/Common/app_text.dart';
import 'package:hbk/Presentation/Common/circle_icon_button.dart';
///use padding optional property to set the child alignment plus if you use svg icon then make typeIconSvg true and pass the svgIconPath
class CustomAppBarWithBackButton extends StatefulWidget
    implements PreferredSizeWidget {
  const CustomAppBarWithBackButton({Key? key,this.title, this.iconData, this.typeIconSvg, this.svgIconPath, this.iconSize, this.padding, this.iconColor})
      : preferredSize = const Size.fromHeight(65),
        super(key: key);
  final String? title;
  final IconData? iconData;
  final bool? typeIconSvg;
  final String? svgIconPath;
  final double? iconSize;
  final Color? iconColor;
  final  EdgeInsetsGeometry? padding;


  @override
  State<CustomAppBarWithBackButton> createState() =>
      _CustomAppBarWithBackButtonState();

  @override
  final Size preferredSize;
}

class _CustomAppBarWithBackButtonState
    extends State<CustomAppBarWithBackButton> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 8,
      shadowColor: Colors.black12,
      backgroundColor: AppColors.whiteColor,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: AppText(
       widget.title?? 'Test',
        style: Styles.circularStdBold(context, fontSize: 20.sp,fontWeight: FontWeight.w500),
      ),
      leading: Padding(
        padding: const EdgeInsets.only(bottom: 8.0,top: 8,left: 8),
        child:  widget.typeIconSvg !=null? SvgPicture.asset(widget.svgIconPath.toString()): CircleIconButton(
          icon: widget.iconData??Icons.arrow_back_sharp,
          padding: widget.padding,
          iconColor: widget.iconColor ,
          iconSize: widget.iconSize,

          onPressed: () {
            Navigator.of(context).pop();
          },
          width: 5.w,
         // iconSize: 15,
          height: 5.h,
        ),
      ),
    );
  }
}