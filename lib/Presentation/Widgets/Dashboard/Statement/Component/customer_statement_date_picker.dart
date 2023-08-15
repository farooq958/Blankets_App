import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linear_datepicker/flutter_datepicker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Resources/sized_box.dart';
import 'package:hbk/Data/DataSource/Resources/text_styles.dart';
import 'package:hbk/Presentation/Common/app_buttons.dart';
import 'package:hbk/Presentation/Common/app_text.dart';



Widget buildDatePicker(BuildContext context) {
  return Column(
    children: <Widget>[
      CustomSizedBox.height(10),
      Padding(
        padding:  EdgeInsets.only(top: 8.0,left: 20.sp),
        child: Align(
          alignment: Alignment.centerLeft,
          child: AppText(

            'From Date',
            style: Styles.circularStdBold(context,fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      Expanded(
          flex: 1,


          child: SingleChildScrollView(child: _buildSingleDatePicker(context))), // First date picker for "From"
      Padding(
        padding:  EdgeInsets.only(top: 8.0,left: 20.sp),
        child:Align(
          alignment: Alignment.centerLeft,
          child: AppText(

            'To Date',
            style: Styles.circularStdBold(context,fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      Expanded(
          flex: 1,
          child: Align(

              alignment: Alignment.topCenter,
              child: SingleChildScrollView(child: _buildSingleDatePicker(context)))),
      CustomSizedBox.height(10),
      CustomButton(onTap: (){}, text: "Apply",horizontalMargin: 15,)// Second date picker for "To"
    ],
  );
}

Widget _buildSingleDatePicker(context) {
  return LinearDatePicker(
    showLabels: true,
    initialDate: '2023/08/03',
    endDate: '2050/09/01',
    columnWidth: 1.sw/3,
    unselectedRowStyle: Styles.circularStdRegular(context,color: AppColors.lightGreyColor),
    selectedRowStyle: Styles.circularStdRegular(context,color: AppColors.blackColor,fontWeight: FontWeight.w500) ,
    yearText: '',
    monthText: '',
    dayText: '',
    //initialDate: ,
    showMonthName: true,
    dateChangeListener: (String date) {

      print(date);

    },);
}