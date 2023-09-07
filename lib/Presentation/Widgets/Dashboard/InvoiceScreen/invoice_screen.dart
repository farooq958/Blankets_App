import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hbk/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:hbk/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/Statement/Controller/notifier_dateTime.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:cross_scroll/cross_scroll.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linear_datepicker/flutter_datepicker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hbk/Application/Services/Navigation/navigation.dart';
import 'package:hbk/Data/DataSource/Resources/assets.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Resources/sized_box.dart';
import 'package:hbk/Data/DataSource/Resources/strings.dart';
import 'package:hbk/Data/DataSource/Resources/text_styles.dart';
import 'package:hbk/Presentation/Common/app_buttons.dart';
import 'package:hbk/Presentation/Common/app_text.dart';
import 'package:hbk/Presentation/Common/custom_appbar_with_back_button.dart';
import 'package:hbk/Presentation/Common/custom_textfield_with_on_tap.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/InvoiceScreen/Component/invoice_details.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/Statement/Component/customer_statement_date_picker.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'Controller/invoice_cubit.dart';



class InvoiceScreen extends  StatefulWidget {
  const InvoiceScreen({super.key});

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  final List<InvoiceModel> invoiceListData = [
InvoiceModel(date: '04 Jan, 2023',invoiceNo: '8909',noOfCtns: '90',total: 'Rs 2,980,650'),
    InvoiceModel(date: '04 Jan, 2023',invoiceNo: '8908',noOfCtns: '90',total: 'Rs 2,980,650'),
    InvoiceModel(date: '04 Jan, 2023',invoiceNo: '8907',noOfCtns: '89',total: 'Rs 2,980,650'),
    InvoiceModel(date: '04 Jan, 2023',invoiceNo: '8906',noOfCtns: '90',total: 'Rs 2,980,650'),
    InvoiceModel(date: '04 Jan, 2023',invoiceNo: '8905',noOfCtns: '90',total: 'Rs 2,980,650'),
    InvoiceModel(date: '04 Jan, 2023',invoiceNo: '8904',noOfCtns: '90',total: 'Rs 2,980,650'),
    InvoiceModel(date: '04 Jan, 2023',invoiceNo: '8903',noOfCtns: '90',total: 'Rs 2,980,650'),
    InvoiceModel(date: '04 Jan, 2023',invoiceNo: '8902',noOfCtns: '90',total: 'Rs 2,980,650'),
    InvoiceModel(date: '04 Jan, 2023',invoiceNo: '8901',noOfCtns: '90',total: 'Rs 2,980,650'),
    InvoiceModel(date: '04 Jan, 2023',invoiceNo: '8900',noOfCtns: '90',total: 'Rs 2,980,650'),
    InvoiceModel(date: '04 Jan, 2023',invoiceNo: '8920',noOfCtns: '90',total: 'Rs 2,980,650'),
    InvoiceModel(date: '04 Jan, 2023',invoiceNo: '8921',noOfCtns: '90',total: 'Rs 2,980,650'),
    InvoiceModel(date: '04 Jan, 2023',invoiceNo: '8922',noOfCtns: '90',total: 'Rs 2,980,650'),
    InvoiceModel(date: '04 Jan, 2023',invoiceNo: '8909',noOfCtns: '90',total: 'Rs 2,980,650'),




    // Add more data for other months
  ];

  final List<String> invoiceTitle=['Date','Invoice No','No of Ctns','Total'];
  late InvoiceListDataSource invoiceDataSource;

  @override
  void initState() {
    super.initState();
    //employees= getEmployees();
    NotifierDateTime.pickerNotifier.value='${DateTime.now().subtract(const Duration(days: 150)).month.englishName}-${DateTime.now().month.englishName} ${DateTime.now().year}';

    context.read<InvoiceCubit>().getInvoicesData(DateTime.now().subtract(const Duration(days: 150)).toString(),DateTime.now().toString());
    

  }
  // final TextEditingController searchControllerPrice=TextEditingController();
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: const CustomAppBarWithBackButton(title: 'Invoice list',iconColor: AppColors.primaryColor,iconData: Icons.arrow_back_ios,padding: EdgeInsets.only(left: 5),iconSize: 15,),
      body: Column(
        children: [
// TODO: Use Extension for sizeBox, the below size box code should be 10.y
          CustomSizedBox.height(10),
          ///Top Row
          Row(
            children: [
              const Spacer(),

              Expanded(
                flex: 2,
                child: ValueListenableBuilder(
                  builder: (context,dateState,ch) {
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: CustomButton(
                       // horizontalMargin: 20,
                        bgColor: AppColors.whiteColor,
                        borderColor: AppColors.primaryColor,
                        textColor: AppColors.primaryColor,
                        textFontWeight: FontWeight.w400,
                        trailingIcon: Assets.calenderIcon,
                        borderThickness: 1.5,
                        trailIconWidth: 19.sp,
                        trailIconHeight: 19,
                        onTap: (){
                          showDatePicker(context);

                        }, text: dateState,verticalMargin: 20,verticalPadding: 10,),
                    );
                  }, valueListenable: NotifierDateTime.pickerNotifier,
                ),
              ),
              CustomSizedBox.width(20)
            ],
          ),

          Expanded(
            child:  BlocConsumer<InvoiceCubit, InvoiceState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    if(state is InvoiceLoaded) {
      invoiceDataSource = InvoiceListDataSource(employees: state.actualInvoiceData, context: context);
      return SfDataGridTheme(
              data: SfDataGridThemeData(headerColor: AppColors.primaryColor),
              child: SfDataGrid(
                horizontalScrollPhysics: const BouncingScrollPhysics(),
                verticalScrollPhysics: const BouncingScrollPhysics(),
                gridLinesVisibility: GridLinesVisibility.none,
                columnWidthMode: ColumnWidthMode.auto,
              //  defaultColumnWidth: 100,
                // source: DataGridSource().buildRow(row),
                columns: getColumns(context),
onCellTap: (details){
  int selectedRowIndex = details.rowColumnIndex.rowIndex - 1;
  var row =
  invoiceDataSource.effectiveRows.elementAt(selectedRowIndex);
Navigate.to(context, InvoiceDetails(invoiceData: state.actualInvoiceData[selectedRowIndex]));
  print("${row.getCells()[1].columnName}:${row.getCells()[1].value}");

},
                headerRowHeight: 65,

                // headerGridLineStrokeWidth: 0.0,

                frozenRowsCount: 0,
                frozenColumnsCount: 0, source: invoiceDataSource, // Number of frozen columns (sticky columns)
              ),
            );
    }
    else if( state is InvoiceLoading)
      {
        return LoadingDialog.loadingWidget();
      }
    else if(state is InvoiceError)
      {

        return  Center(child: AppText(state.error.toString(), style: Styles.circularStdMedium(context)));
      }
    else
      {
        return const SizedBox();
      }
  },
),
          ),
          // SizedBox(
          //   width: 1.sw,
          //   child: FractionallySizedBox(
          //     widthFactor: 1,
          //     child: CustomButton(gapWidth: 10,textFontWeight: FontWeight.w400, imageWidth: 20.sp,imageHeight: 20,leadingSvgIcon: true,leadingIcon:(Assets.downloadIcon),onTap: (){}, text: "Download",horizontalMargin: 20,),
          //   ),
          // ),
          // CustomSizedBox.height(10)

          // Row(
          //   children: [
          //     Expanded(
          //       child: SingleChildScrollView(
          //         scrollDirection: Axis.horizontal,
          //
          //         child: DataTableTheme(
          //           data: DataTableThemeData(
          //             headingRowColor: MaterialStateColor.resolveWith((states) => AppColors.primaryColor),
          //             //  dataRowColor: MaterialStateColor.resolveWith((states) => Colors.grey.shade100),
          //             headingTextStyle: Styles.circularStdBold(context,fontSize: 15.sp,color: AppColors.whiteColor),
          //            // dataTextStyle: Styles.circularStdBold(context,fontSize: 15.sp,color: AppColors.primaryColor),
          //           ),
          //           child: DataTable(
          //             horizontalMargin: 10,
          //             columnSpacing: 1.sw/20,
          //
          //             columns:  [
          //               DataColumn(label: AppText('Date',style:Styles.circularStdRegular(context,fontSize: 15.sp,color: AppColors.whiteColor,fontWeight: FontWeight.w500),)),
          //               DataColumn(label: AppText('Type',style: Styles.circularStdRegular(context,fontSize: 15.sp,color: AppColors.whiteColor,fontWeight: FontWeight.w500),)),
          //               DataColumn(label: AppText(
          //
          //                 'Narration',
          //
          //                 style: Styles.circularStdRegular(context,fontSize: 15.sp,color: AppColors.whiteColor,fontWeight: FontWeight.w500),)),
          //               DataColumn(label: AppText('Amount',style:Styles.circularStdRegular(context,fontSize: 15.sp,color: AppColors.whiteColor,fontWeight: FontWeight.w500),)),
          //             ],
          //             rows: [
          //               for(int index=0 ;index<invoiceData.length;index++)
          //                 DataRow(cells: [
          //                   DataCell(SizedBox(
          //                     height: 20,
          //
          //
          //                       child: AppText(invoiceData[index].date, style: Styles.circularStdRegular(context,color: invoiceData[index].type=="start"? AppColors.primaryColor:AppColors.blackColor),))),
          //
          //                   DataCell(AppText(invoiceData[index].type,
          //
          //                     style: Styles.circularStdRegular(context,color: invoiceData[index].type==""? AppColors.primaryColor:AppColors.blackColor),)),
          //                   DataCell(SizedBox(
          //                     width: 100.sp,
          //                     child: SingleChildScrollView(
          //
          //                       child: AppText(invoiceData[index].narration,
          //                         maxLine: 5,
          //                         style: Styles.circularStdRegular(context,color: invoiceData[index].type=="start"? AppColors.primaryColor:AppColors.blackColor),),
          //                     ),
          //                   )),
          //                   DataCell(AppText(invoiceData[index].amount.toString(), style: Styles.circularStdRegular(context,color: invoiceData[index].type=="start"? AppColors.primaryColor:AppColors.blackColor),)),
          //
          //                 ],
          //                     color:MaterialStateColor.resolveWith((states) => invoiceData[index].type=="start"? AppColors.lightInvoiceColor:AppColors.whiteColor)
          //                 ),
          //
          //
          //             ],
          //             dividerThickness: 0.0,
          //             dataRowHeight: 32,// Set the thickness of the divider
          //
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),

        ],
      ),
    );
  }

  List<GridColumn> getColumns(BuildContext context) {
    return [
      GridColumn(
        columnName: 'Date',
        label: Container(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: AppText(
              'Date',
              style: Styles.circularStdRegular(
                context,
                fontSize: 15.sp,
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
      GridColumn(
        columnName: 'Invoice No',
        label: Container(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: AppText(
              'Invoice No',
              maxLine: 2,
              style: Styles.circularStdRegular(
                context,
                fontSize: 15.sp,
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
      GridColumn(
        columnName: 'No Of Ctns',
        label: Container(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: AppText(
              'No Of Ctns',
              style: Styles.circularStdRegular(
                context,
                fontSize: 15.sp,
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
      GridColumn(
        columnName: 'Total',
        label: Container(
          //width: 200,
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: AppText(
              'Total',
              style: Styles.circularStdRegular(
                context,
                fontSize: 15.sp,
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),

      // Add similar columns for other fields
    ];
  }

///old cross scroll
//   CrossScroll(
//   horizontalScroll: CrossScrollDesign(
//   physics: const BouncingScrollPhysics(),
//   padding: const EdgeInsets.only(
//   left: 1.0,
//   right: 9.0,
//   )),
//   verticalScroll: CrossScrollDesign(
//   physics: const BouncingScrollPhysics(),
//   padding:
//   const EdgeInsets.only(top: 10, bottom: 70))
//
//   ,
//   child: Container(
//   // padding: const EdgeInsets.all(2),
//   decoration: BoxDecoration(
//   color: AppColors.whiteColor,
//   borderRadius: BorderRadius.circular(10)),
//   child: Column(
//   mainAxisAlignment: MainAxisAlignment.start,
//   children: <Widget>[
//
//
//   Row(
//   mainAxisAlignment: MainAxisAlignment.start,
//   children: [
//
//   for (var i = 0; i < invoiceTitle.length; i++)
//   Container(
//   height: 60.sp,
//   width: i==1?80.sp:i==2?80:100.sp,
//   // margin: EdgeInsets.only(right: 0),
//
//   alignment: Alignment.centerLeft,
//   padding: EdgeInsets.only(left: 10.sp),
//   color: AppColors.primaryColor,
//   child: AppText(
//   invoiceTitle[i],
//   // textAlign:  TextAlign.center,
//   style: Styles.circularStdBold(context,
//   fontSize: 13.sp,
//   fontWeight: FontWeight.w500,
//   color: AppColors.whiteColor),
//   ),
//   ),
//
//
//
//
//
//
//
//   ],
//   ),
//   Padding(
//
//   padding: EdgeInsets.only(right: 0.sp),
//   child: showRewardListData(context)),
//
//
//   ],
//   ),),
//
//   )

  Widget showRewardListData(context) {
    List<List<InvoiceModel>> invoiceFinalData = [
      [],
      [],
      [],
      [],

    ];
    List<List<InvoiceModel>> inData = [invoiceListData];


    List<Widget> row = [];

    for(int i=0;i<invoiceListData.length;i++){
      List<Widget> textWidget = [];

      textWidget.add(Container(
          alignment: Alignment.centerLeft,
          //  width: 130,
          // color: Colors.red,
          // margin: EdgeInsets.only(right: 50.sp),
          child: AppText(invoiceListData[i].date.toString(), style: Styles.circularStdRegular(context,color: AppColors.blackColor,fontWeight: FontWeight.normal))));
      //  textWidget.add(SizedBox(width: 10.sp,));
      textWidget.add(SizedBox(width: 40.sp,));
      textWidget.add(Container(
        //width: 100.sp,
        //   color: Colors.black,
          alignment: Alignment.centerLeft,
          //  padding: EdgeInsets.only(right: 100.sp),

          child: AppText(invoiceListData[i].invoiceNo.toString(),
              // maxLine: 4,
              style: Styles.circularStdRegular(context,color:  AppColors.blackColor,fontWeight: FontWeight.normal))));
      textWidget.add(SizedBox(width: 40.sp,));
      textWidget.add(Container(
        // padding: priceListData[i].item==""? EdgeInsets.only(left: 50.sp):null,
        // height: 50.sp,
        // width: 100,
        alignment: Alignment.centerLeft,
        // padding: EdgeInsets.only(right: 10.sp),

        // margin: const EdgeInsets.only(left: 20),
        child:  Center(
          child: SingleChildScrollView(
            child: AppText(invoiceListData[i].noOfCtns.toString(),
                style: Styles.circularStdRegular(context,color: AppColors.blackColor,fontWeight:  FontWeight.normal)),
          ),
        ),
      ));
      textWidget.add(SizedBox(width: 40.sp,));


      textWidget.add(Container(
        // padding: priceListData[i].item==""? EdgeInsets.only(left: 50.sp):null,
          alignment: Alignment.centerLeft,
          //padding: EdgeInsets.only(right: 30.sp),
          child: AppText(invoiceListData[i].total.toString(), style: Styles.circularStdRegular(context,color:AppColors.blackColor,fontWeight: FontWeight.normal))));
     // textWidget.add(SizedBox(width: 40.sp,));
      row.add(Column(

        children: [
          CustomSizedBox.height(10.sp),
          GestureDetector(
            onTap: (){
log('index: ${i.toString()}');
log(invoiceListData[i].toString());
Navigate.to(context, InvoiceDetails(invoiceData:invoiceListData[i]));

            },
            child: Container(
              height: 50.sp,
              // width:priceListData[i].title!=null? 1.sw *1.15:null,

                color:i%2==0?AppColors.whiteColor:AppColors.lightInvoiceColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [

                  ...textWidget,


                ],
              ),
            ),
          ),
          SizedBox(height: 5.sp,)
        ],
      ));


    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: row,
    );


  }

  void showDatePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)

      ),
      builder: (BuildContext builder) {
        return SizedBox(
          height: 600,
          width: 1.sw,
          child: buildDateRangePickerForInvoice(context),
        );
      },
    );
  }
}
class InvoiceModel {
  final String? date;
  final String? invoiceNo;
  final String? noOfCtns;
  final String? total;


  InvoiceModel(   {this.date,this.invoiceNo, this.noOfCtns, this.total});
}
class InvoiceListDataSource extends DataGridSource {
  final  BuildContext context;
  InvoiceListDataSource({required List<InvoiceModel> employees,required this.context}) {
    _employees = List.generate(employees.length, (index) => DataGridRow(cells: [

      DataGridCell<String>(columnName: 'Date', value: employees[index].date),
      DataGridCell<String>(columnName: 'Invoice No', value: employees[index].invoiceNo),
      DataGridCell<String>(columnName: 'No Of Ctns', value: employees[index].noOfCtns),
      DataGridCell<String>(columnName: 'Total', value: employees[index].total),


    ]));
  }

  List<DataGridRow>  _employees = [];

  @override
  List<DataGridRow> get rows =>  _employees;

  @override
  DataGridRowAdapter? buildRow(DataGridRow rowsss) {
    Color getBackgroundColor() {
      int index = _employees.indexOf(rowsss) + 1;
      if (index % 2 == 0) {
        return AppColors.lightInvoiceColor;
      } else {
        return Colors.white;
      }
    }

    return DataGridRowAdapter(
    //  color: AppColors.primaryColor,

        cells: rowsss.getCells().map<Widget>((dataGridCell) {
          return Container(
           // color: AppColors.primaryColor,
            color: getBackgroundColor(),
            alignment: (dataGridCell.columnName == 'Date')
                ? Alignment.centerRight
                : Alignment.center,
            padding: const EdgeInsets.all(10.0),
            child: AppText(dataGridCell.value.toString(), style: Styles.circularStdRegular(context),),
          );
        }).toList());
  }
}