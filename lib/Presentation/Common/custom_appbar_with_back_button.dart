import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Resources/text_styles.dart';
import 'package:hbk/Presentation/Common/app_text.dart';
import 'package:hbk/Presentation/Common/circle_icon_button.dart';

class CustomAppBarWithBackButton extends StatefulWidget
    implements PreferredSizeWidget {
  const CustomAppBarWithBackButton({Key? key,this.title})
      : preferredSize = const Size.fromHeight(65),
        super(key: key);
  final String? title;


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
        style: Styles.circularStdBold(context, fontSize: 20.sp),
      ),
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleIconButton(
          icon: Icons.arrow_back,
          onPressed: () {
            Navigator.of(context).pop();
          },
          width: 10.w,
          height: 10.h,
        ),
      ),
    );
  }
}
