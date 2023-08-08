import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hbk/Data/DataSource/Static/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Static/text_styles.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarChartData {
  final String day;

  final int pendingValue;
  final int completedValue;

  BarChartData(this.day,  this.pendingValue,this.completedValue,);
}
class VerticalBarChart extends StatelessWidget {
  final List<BarChartData> chartData = [
    BarChartData('Mon', 100, 150),
    BarChartData('Tue', 120, 150),
    BarChartData('Wed', 140, 200),
    BarChartData('Thu', 300, 400),
    BarChartData('Fri', 89, 190),
    BarChartData('Sat', 200, 550),
    BarChartData('Sun', 100, 300),
    // Add more data as needed
  ];

   VerticalBarChart({super.key});
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(  labelStyle: Styles.circularStdBold(context,fontWeight: FontWeight.w500,color: AppColors.greyLightColor)),
      primaryYAxis: NumericAxis(isVisible: true,
maximumLabels: 2,
          maximum: 600,

          // Number of ticks on Y-axis
          majorTickLines: const MajorTickLines(size: 0)
      ),
      series: <ColumnSeries<BarChartData, String>>[
        ColumnSeries<BarChartData, String>(
          dataSource: chartData,
          xValueMapper: (BarChartData data, _) => data.day,
          yValueMapper: (BarChartData data, _) => data.pendingValue,
          name: 'Pending',
          color: AppColors.lightGraphColor,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10.sp),topRight: Radius.circular(10.sp)), // Dark blue color for completed
// Light blue color for pending


        ),
        ColumnSeries<BarChartData, String>(
          dataSource: chartData,
          xValueMapper: (BarChartData data, _) => data.day,
          yValueMapper: (BarChartData data, _) => data.completedValue,
          name: 'Completed',
          color: AppColors.primaryColor,


          borderRadius: BorderRadius.only(topLeft: Radius.circular(10.sp),topRight: Radius.circular(10.sp)), // Dark blue color for completed
        ),

      ],
      legend:  Legend(isVisible: true,position: LegendPosition.bottom,textStyle: Styles.circularStdBold(context,color: AppColors.primaryColor,fontWeight: FontWeight.w600)),
    );
  }
}

