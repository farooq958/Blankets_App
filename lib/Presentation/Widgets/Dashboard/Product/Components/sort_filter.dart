import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hbk/Data/DataSource/Resources/assets.dart';
import 'package:hbk/Data/DataSource/Resources/sized_box.dart';
import 'package:hbk/Data/DataSource/Resources/text_styles.dart';
import 'package:hbk/Presentation/Common/app_text.dart';

class SortAndFilter extends StatelessWidget {
  final VoidCallback? onSortTap;
  final VoidCallback? onFilterTap;
  const SortAndFilter({super.key, this.onSortTap, this.onFilterTap});

  @override
  Widget build(BuildContext context) {
    return Row(
     // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Align(
            child: GestureDetector(
              onTap: onSortTap,
              child: Container(
                width: 179.67.w,
                height: 53.h,
              //  padding: const EdgeInsets.symmetric(horizontal: 59, vertical: 18),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x0F000000),
                      blurRadius: 12,
                      offset: Offset(0, 6),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(child: Align(

                        alignment: Alignment.centerRight,
                        child: SvgPicture.asset(Assets.sortIcon,width: 7,height: 15,))),
                    CustomSizedBox.width(5),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: AppText(
                          'Sort',
                          style: Styles.circularStdBold(context,fontSize: 16.sp,fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    CustomSizedBox.width(15),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16), // Add some space between the containers
        Expanded(
          child: Align(
            child: GestureDetector(
              onTap: onFilterTap,
              child: Container(
                width: 179.67.w,
                height: 53.h,
          //    padding: const EdgeInsets.symmetric(horizontal: 59, vertical: 18),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x0F000000),
                      blurRadius: 12,
                      offset: Offset(0, 6),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child:  Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(child: Align(

                        alignment: Alignment.centerRight,
                        child: SvgPicture.asset(Assets.filterIcon,width: 19.sp,height: 15.sp,))),

                    CustomSizedBox.width(5),
                    Expanded(
                      flex: 1,
                      child: AppText(
                        'Filter',
                        style: Styles.circularStdBold(context,fontSize: 16.sp,fontWeight: FontWeight.w500),
                      ),
                    ),
                    CustomSizedBox.width(15),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
