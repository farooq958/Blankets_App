import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_linear_datepicker/flutter_datepicker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Resources/sized_box.dart';
import 'package:hbk/Data/DataSource/Resources/text_styles.dart';
import 'package:hbk/Presentation/Common/app_buttons.dart';
import 'package:hbk/Presentation/Common/app_text.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/Statement/Controller/statement_data_cubit.dart';



Widget buildDateRangePicker(BuildContext context) {
  String startDate='';
  String endDate='';
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


          child: SingleChildScrollView(child: _buildSingleDatePicker(context,(date){
startDate = date;
           // print(startDate);
          }))), // First date picker for "From"
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
              child: SingleChildScrollView(child: _buildSingleDatePicker(context,(date){
               endDate=date;
            //    print(endDate);

              })))),
      CustomSizedBox.height(10),
      CustomButton(onTap: () {

        if(startDate != '' || endDate != '') {
          context.read<StatementDataCubit>().getStatementDto(convertDateString(startDate), convertDateString(endDate));
        }

      }, text: "Apply",horizontalMargin: 15,)// Second date picker for "To"
    ],
  );
}

Widget buildDateSinglePicker(BuildContext context,{VoidCallback? onTap}) {
  return Column(
    children: <Widget>[
      CustomSizedBox.height(10),
      Padding(
        padding:  EdgeInsets.only(top: 8.0,left: 20.sp),
        child: Align(
          alignment: Alignment.centerLeft,
          child: AppText(

            'Date',
            style: Styles.circularStdBold(context,fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      Expanded(
          flex: 1,


          child: SingleChildScrollView(child: _buildSingleDatePicker(context,(s){

            print(s);

          }))), // First date picker for "From"

      CustomButton(onTap:onTap??(){}, text: "Apply",horizontalMargin: 15,)// Second date picker for "To"
    ],
  );
}
Widget _buildSingleDatePicker(context,final void Function(String) getCurrentValue) {
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

      getCurrentValue(date);
     // print(date);

    },);
}

String convertDateString(String inputDateString) {
  // Split the input date string into its components
  List<String> dateComponents = inputDateString.split('/');

  // Ensure that we have exactly three components (year, month, day)
  if (dateComponents.length != 3) {
    throw const FormatException("Invalid date string format");
  }

  // Convert the components to integers
  int year = int.parse(dateComponents[0]);
  int month = int.parse(dateComponents[1]);
  int day = int.parse(dateComponents[2]);

  // Create a DateTime object with the components
  DateTime dateTime = DateTime(year, month, day);

  // Format the DateTime object into the desired format
  String formattedDateString = "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')} ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}:${dateTime.second.toString().padLeft(2, '0')}";

  return formattedDateString;
}