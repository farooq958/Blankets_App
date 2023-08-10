

// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Resources/text_styles.dart';

import 'app_shadow.dart';

class CustomDropDownWidget extends StatelessWidget {
  final Widget? prefixIcon;
  final String hintText;
  dynamic value;
  final double vMargin;
  final double hMargin;
  final double? dropDownHeight;
  final String validationText;
  final ValueChanged onChanged;
  final List<DropdownMenuItem<Object>> itemsMap;
  final bool isBorderRequired;
  final bool isShadowRequired;
  CustomDropDownWidget({
    super.key,
    this.hMargin = 8,
    this.vMargin = 0,
    this.dropDownHeight,
    required this.prefixIcon,
    required this.hintText,
    required this.value,
    required this.validationText,
    required this.onChanged,
    required this.itemsMap,
    this.isBorderRequired = true,
    this.isShadowRequired = false,
  });

  final double borderRadius = 30;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        //color: Colors.transparent,
          boxShadow: isShadowRequired ? [AppShadow.normal()] : []),
      padding: EdgeInsets.symmetric(vertical: vMargin, horizontal: hMargin).r,
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButtonFormField(
          borderRadius: BorderRadius.circular(15),
          //autovalidateMode: AutovalidateMode.onUserInteraction,
          menuMaxHeight: dropDownHeight,
          validator: (value) {
            if (value == null) {
              return validationText;
            } else {
              return null;
            }
          },
          decoration: InputDecoration(
            fillColor:Colors.transparent,
            filled: true,
            prefixIconConstraints: BoxConstraints(
              maxHeight: 60.w,
              maxWidth: 50.w,
              minHeight: 22.w,
              minWidth: 23.w,
            ),
            prefixIcon: prefixIcon != null
                ? Padding(
              padding: const EdgeInsets.only(left: 10),
              child: prefixIcon,
            )
                : null,
            errorMaxLines: 1,
            contentPadding: EdgeInsets.only(
              top: 13,
              bottom: 13,
              left: prefixIcon != null ? 8 : 6,
              right: prefixIcon != null ? 10 : 12,
            ),

            // EdgeInsets.symmetric(
            //   vertical: 13,
            //   horizontal: prefixIcon != null ? 10 : 6,
            // ).r,
            errorBorder: isBorderRequired
                ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius).r,
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 1.w,
                ))
                : outlineInputBorder(),
            enabledBorder: isBorderRequired
                ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius).r,
                borderSide: BorderSide(
                  color: AppColors.lightGreyColor,
                  width: 1.w,
                ))
                : outlineInputBorder(),
            focusedBorder: isBorderRequired
                ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius).r,
                borderSide: BorderSide(
                  color: AppColors.lightGreyColor,
                  width: 1.w,
                ))
                : outlineInputBorder(),
            focusedErrorBorder: isBorderRequired
                ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius).r,
                borderSide: BorderSide(
                  color: AppColors.lightGreyColor,
                  width: 1.w,
                ))
                : outlineInputBorder(),
          ),
          hint: Text(
            hintText,
            style: Styles.circularStdRegular(
              context,
              color: AppColors.greyColor,
              fontSize: 14.sp,
            ),
          ),
          dropdownColor: Colors.white,
          icon:  Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.greyColor,
          ),
          iconSize: 28.r,
          isExpanded: true,
          style: Styles.circularStdRegular(
            context,
            fontSize: 14.sp,
          ),
          value: value,
          onChanged: onChanged,
          items: itemsMap,
        ),
      ),
    );
  }

  outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius.r),
      borderSide: const BorderSide(color: Colors.transparent),
    );
  }
}
