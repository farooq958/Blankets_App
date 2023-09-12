import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:cross_scroll/cross_scroll.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_linear_datepicker/flutter_datepicker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hbk/Application/Services/Pdf/pdf_downlaod.dart';
import 'package:hbk/Data/AppData/app_preferences.dart';
import 'package:hbk/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:hbk/Data/DataSource/Resources/imports.dart';
import 'package:hbk/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/Statement/Component/pdf_layout.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/Statement/Controller/notifier_dateTime.dart';
import 'package:open_file/open_file.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'Component/customer_statement_date_picker.dart';

import 'Controller/statement_data_cubit.dart';

class CustomerStatementScreen extends StatefulWidget {
  CustomerStatementScreen({super.key});

  @override
  State<CustomerStatementScreen> createState() =>
      _CustomerStatementScreenState();
}

class _CustomerStatementScreenState extends State<CustomerStatementScreen> {
  final List<StatementData> invoiceData = [
    StatementData("Jan, 2023", "", "Rs 0 Cr", 'Rs 10,500 Cr'),

    StatementData("04 Jan, 2023", "Invoice",
        "Online to MBL Gloabl S#3595+3598(5lac+5lac) On 31.1", 'Rs 102,000 Cr'),

    StatementData(
        "04 Jan, 2023", "Invoice", "A/R invoices-C00066", 'Rs 102,000 Cr'),

    StatementData("Feb, 2023", "", "Rs 0 Cr", 'Rs 10,500 Cr'),

    StatementData(
        "04 Feb, 2023", "Invoice", "A/R invoices-C00066", 'Rs 102,000 Cr'),

    StatementData("04 Feb, 2023", "Invoice",
        "Online to MBL Gloabl S#3595+3598(5lac+5lac) On 31.1", 'Rs 102,000 Cr'),

    StatementData("04 Feb, 2023", "Invoice",
        "Online to MBL Global Txt Slip# 3593", 'Rs 102,000 Cr'),
    StatementData("March, 2023", "", "Rs 0 Cr", 'Rs 10,500 Cr'),

    StatementData(
        "04 march, 2023", "Invoice", "A/R invoices-C00066", 'Rs 102,000 Cr'),

    StatementData("04 march, 2023", "Invoice",
        "Online to MBL Gloabl S#3595+3598(5lac+5lac) On 31.1", 'Rs 102,000 Cr'),

    StatementData("04 march, 2023", "Invoice",
        "Online to MBL Global Txt Slip# 3593", 'Rs 102,000 Cr'),

    StatementData("Apr, 2023", "", "Rs 0 Cr", 'Rs 10,500 Cr'),

    StatementData(
        "04 Apr, 2023", "Invoice", "A/R invoices-C00066", 'Rs 102,000 Cr'),

    StatementData("04 Apr, 2023", "Invoice",
        "Online to MBL Gloabl S#3595+3598(5lac+5lac) On 31.1", 'Rs 102,000 Cr'),

    StatementData("04 Apr, 2023", "Invoice",
        "Online to MBL Global Txt Slip# 3593", 'Rs 102,000 Cr'),
    // Add more data for other months

    // Add more data for other months
    // Add more data for other months
  ];
  late StatementListDataSource statementDataSource;

  @override
  void initState() {
    super.initState();
    //employees= getEmployees();
    NotifierDateTime.pickerNotifier.value =
        '${DateTime.now().subtract(const Duration(days: 100)).month.englishName}-${DateTime.now().month.englishName} ${DateTime.now().year}';
    context.read<StatementDataCubit>().getStatementDto(
        DateTime.now().subtract(const Duration(days: 100)).toString(),
        DateTime.now().toString());
    //
  }

  @override
  Widget build(BuildContext context) {
    final List<String> invoiceTitle = ["Date", "Type", "Narration", "Amount"];

    return Scaffold(
      appBar: const CustomAppBarWithBackButton(
        title: 'Customer Statement',
        exceptional: true,
        iconColor: AppColors.primaryColor,
        iconData: Icons.arrow_back_ios,
        padding: EdgeInsets.only(left: 5),
        iconSize: 15,
      ),
      body: BlocConsumer<StatementDataCubit, StatementDataState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is StatementLoading) {
            LoadingDialog.showLoadingDialog(context);
          }
          if (state is StatementLoaded) {
            Navigate.pop(context);
          }
        },
        builder: (context, state) {
          if (state is StatementLoaded) {
            statementDataSource = StatementListDataSource(
                employees: state.statementData, context: context);
            return Stack(
              children: [
                Column(
                  children: [
                    CustomSizedBox.height(10),

                    ///Top Row
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          AppText(
                            AppStrings.accountBalance,
                            style: Styles.circularStdRegular(context,
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                          SizedBox(
                            width: 2.sp,
                          ),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: 'Rs ',
                                style: Styles.circularStdBold(context,
                                    fontSize: 16.sp)),
                            TextSpan(
                                text: SharedPrefs.userData!.balance.toString(),
                                style: Styles.circularStdBold(context,
                                    fontWeight: FontWeight.w900, fontSize: 20)),
                          ])),
                          SizedBox(
                            width: 1.sp,
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        Expanded(
                          flex: 2,
                          child: ValueListenableBuilder(
                            builder: (context, dateState, cc) {
                              return Align(
                                alignment: Alignment.centerRight,
                                child: CustomButton(
                                  //  horizontalMargin: 0,

                                  bgColor: AppColors.whiteColor,
                                  borderColor: AppColors.primaryColor,
                                  textColor: AppColors.primaryColor,
                                  textFontWeight: FontWeight.w400,
                                  trailingIcon: Assets.calenderIcon,
                                  borderThickness: 1.5,
                                  trailIconWidth: 19.sp,
                                  trailIconHeight: 19,
                                  onTap: () {
                                    showDatePicker(context);
                                  },
                                  text: dateState,
                                  verticalMargin: 20,
                                  verticalPadding: 10,
                                ),
                              );
                            },
                            valueListenable: NotifierDateTime.pickerNotifier,
                          ),
                        ),
                      ],
                    ),

                    ///sf data grid
                    state.statementData.isEmpty
                        ? Expanded(
                            child: Center(
                            child: AppText(
                              'No Data Found',
                              style: Styles.circularStdMedium(context,
                                  color: AppColors.primaryColor,
                                  fontSize: 16.sp),
                            ),
                          ))
                        : Expanded(
                            child: SfDataGridTheme(
                              data: SfDataGridThemeData(
                                  headerColor: AppColors.primaryColor),
                              child: SfDataGrid(
                                horizontalScrollPhysics:
                                    const BouncingScrollPhysics(),
                                verticalScrollPhysics:
                                    const BouncingScrollPhysics(),
                                gridLinesVisibility: GridLinesVisibility.none,
                                columnSizer: ColumnSizer(),
                                defaultColumnWidth: 130,
                                //columnWidthMode: ColumnWidthMode.none,
                                rowHeight: 60,
                                //  defaultColumnWidth: 100,
                                // source: DataGridSource().buildRow(row),
                                columns: getColumns(context),
                                onCellTap: (details) {
                                  // int selectedRowIndex = details.rowColumnIndex.rowIndex - 1;
                                  // var row =
                                  // invoiceDataSource.effectiveRows.elementAt(selectedRowIndex);
                                  // Navigate.to(context, InvoiceDetails(invoiceData: invoiceListData[selectedRowIndex]));
                                  // print("${row.getCells()[1].columnName}:${row.getCells()[1].value}");
                                },
                                headerRowHeight: 65,

                                // headerGridLineStrokeWidth: 0.0,

                                frozenRowsCount: 0,
                                frozenColumnsCount: 0,
                                source:
                                    statementDataSource, // Number of frozen columns (sticky columns)
                              ),
                            ),
                          ),

                    ///cross scroll
                    //      Expanded(
                    //        child: CrossScroll(
                    //          horizontalScroll: CrossScrollDesign(
                    //              physics: const BouncingScrollPhysics(),
                    //              padding: const EdgeInsets.only(
                    //                left: 1.0,
                    //                right: 9.0,
                    //              )),
                    //          verticalScroll: CrossScrollDesign(
                    //              physics: const BouncingScrollPhysics(),
                    //              padding:
                    //              const EdgeInsets.only(top: 10, bottom: 70))
                    //
                    //        ,
                    //          child: Container(
                    //           // padding: const EdgeInsets.all(2),
                    //            decoration: BoxDecoration(
                    //                color: AppColors.whiteColor,
                    //                borderRadius: BorderRadius.circular(10)),
                    //            child: Column(
                    //            children: <Widget>[
                    //
                    //              Row(
                    //                mainAxisAlignment: MainAxisAlignment.start,
                    //                children: [
                    //
                    //                  for (var i = 0; i < invoiceTitle.length; i++)
                    //                    Container(
                    //                      height: 60.sp,
                    //                     width: 110.sp,
                    //                     // margin: EdgeInsets.only(right: 0),
                    //
                    //                      alignment: Alignment.center,
                    //                      padding: EdgeInsets.only(right: 20.sp),
                    //                      color: AppColors.primaryColor,
                    //                      child: AppText(
                    //                        invoiceTitle[i],
                    //                        textAlign: TextAlign.center,
                    //                        style: Styles.circularStdBold(context,
                    //                            fontSize: 13.sp,
                    //                            fontWeight: FontWeight.w500,
                    //                            color: AppColors.whiteColor),
                    //                      ),
                    //                    ),
                    //
                    //
                    //
                    //
                    //
                    //
                    //
                    //                ],
                    //              ),
                    //               showInvoiceData(context),
                    //              SizedBox(
                    //                width: 1.sw,
                    //                child: FractionallySizedBox(
                    //                  widthFactor: 1,
                    //                  child: CustomButton(gapWidth: 10,textFontWeight: FontWeight.w400, imageWidth: 20.sp,imageHeight: 20,leadingSvgIcon: true,leadingIcon:(Assets.downloadIcon),onTap: () async {
                    //
                    // await PdfDownload().generatePdf(invoiceTitle,invoiceData,PDFLayouts().showCustomerStatementDataPdf(invoiceData),PDFLayouts().pdfTitleCustomerStatement(invoiceTitle)).then((value) => null);

                    //
                    //
                    //                  }, text: "Download",horizontalMargin: 20,),
                    //                ),
                    //              )
                    //
                    //            ],
                    //          ),),
                    //
                    //        ),
                    //      )
                    ///data table
//               Expanded(
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//
//                   child: DataTableTheme(
//                     data: DataTableThemeData(
//                       headingRowColor: MaterialStateColor.resolveWith((states) => AppColors.primaryColor),
//                       //  dataRowColor: MaterialStateColor.resolveWith((states) => Colors.grey.shade100),
//                       headingTextStyle: Styles.circularStdBold(context,fontSize: 15.sp,color: AppColors.whiteColor),
//                      // dataTextStyle: Styles.circularStdBold(context,fontSize: 15.sp,color: AppColors.primaryColor),
//                     ),
//                     child: DataTable(
//                       horizontalMargin: 10,
//                       columnSpacing: 1.sw/20,
// dataRowMaxHeight: 78,
//                       columns:  [
//                         DataColumn(label: AppText('Date',style:Styles.circularStdRegular(context,fontSize: 15.sp,color: AppColors.whiteColor,fontWeight: FontWeight.w500),)),
//                         DataColumn(label: AppText('Type',style: Styles.circularStdRegular(context,fontSize: 15.sp,color: AppColors.whiteColor,fontWeight: FontWeight.w500),)),
//                         DataColumn(label: AppText(
//
//                           'Narration',
//
//                           style: Styles.circularStdRegular(context,fontSize: 15.sp,color: AppColors.whiteColor,fontWeight: FontWeight.w500),)),
//                         DataColumn(label: AppText('Amount',style:Styles.circularStdRegular(context,fontSize: 15.sp,color: AppColors.whiteColor,fontWeight: FontWeight.w500),)),
//                       ],
//                       rows: [
//                         for(int index=0 ;index<invoiceData.length;index++)
//                           DataRow(
//
//
//                               cells: [
//                             DataCell(SizedBox(
//                               height: 20,
//
//
//                                 child: AppText(invoiceData[index].date, style: Styles.circularStdRegular(context,color: invoiceData[index].type==""? AppColors.primaryColor:AppColors.blackColor),))),
//
//                             DataCell(AppText(invoiceData[index].type,
//
//                               style: Styles.circularStdRegular(context,color: invoiceData[index].type==""? AppColors.primaryColor:AppColors.blackColor),)),
//                             DataCell(SizedBox(
//                               width: 120.sp,
//                               child: AppText(invoiceData[index].narration,
//                                 maxLine: 5,
//                                 style: Styles.circularStdRegular(context,color: invoiceData[index].type==""? AppColors.primaryColor:AppColors.blackColor),),
//                             )),
//                             DataCell(AppText(invoiceData[index].amount.toString(), style: Styles.circularStdRegular(context,color: invoiceData[index].type==""? AppColors.primaryColor:AppColors.blackColor),)),
//
//                           ],
//                               color:MaterialStateColor.resolveWith((states) => invoiceData[index].type==""? AppColors.lightInvoiceColor:AppColors.whiteColor)
//                           ),
//
//
//                       ],
//                       dividerThickness: 0.0,
//                      // dataRowHeight: 32,// Set the thickness of the divider
//
//                     ),
//                   ),
//                 ),
//               ),
                    CustomSizedBox.height(50),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  child: SizedBox(
                    width: 1.sw,
                    child: FractionallySizedBox(
                      widthFactor: 1,
                      child: CustomButton(
                        gapWidth: 10,
                        textFontWeight: FontWeight.w400,
                        imageWidth: 20.sp,
                        imageHeight: 20,
                        leadingSvgIcon: true,
                        leadingIcon: (Assets.downloadIcon),
                        onTap: () async {
                          // await PdfDownload().generatePdf(invoiceTitle,invoiceData,PDFLayouts().showCustomerStatementDataPdf(invoiceData),PDFLayouts().pdfTitleCustomerStatement(invoiceTitle)).then((value) => null);

                          await PdfDownload()
                              .generatePdfForStatement(state.statementData)
                              .then((value) async {
                            if (value != null) {
                              await OpenFile.open(value.path);
                            }
                          });
                        },
                        text: "Download",
                        horizontalMargin: 20,
                      ),
                    ),
                  ),
                )
              ],
            );
          } else {
            return const SizedBox();
          }
        },
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
        columnName: 'Type',
        label: Container(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: AppText(
              'Type',
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
        columnName: 'Narration',
        label: Container(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: AppText(
              'Narration',
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
        columnName: 'Amount',
        label: Container(
          //width: 200,
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: AppText(
              'Amount',
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

  void showDatePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      builder: (BuildContext builder) {
        return SizedBox(
          height: 600,
          width: 1.sw,
          child: buildDateRangePicker(context),
        );
      },
    );
  }

  Widget showInvoiceData(context) {
    List<List<StatementData>> invoiceFinalData = [
      [],
      [],
      [],
      [],
    ];
    List<List<StatementData>> inData = [invoiceData];

    List<Widget> row = [];

    for (int i = 0; i < invoiceData.length; i++) {
      List<Widget> textWidget = [];

      textWidget.add(Container(
          height: 40,
          width: 100,
          padding: EdgeInsets.only(left: 10.sp),
          alignment: Alignment.centerLeft,
//color: AppColors.primaryColor,
          child: AppText(invoiceData[i].date,
              style: Styles.circularStdRegular(context,
                  color: invoiceData[i].type == ""
                      ? AppColors.primaryColor
                      : AppColors.blackColor,
                  fontWeight: invoiceData[i].type == ""
                      ? FontWeight.w500
                      : FontWeight.normal))));
      textWidget.add(SizedBox(
        width: 20.sp,
      ));
      textWidget.add(AppText(invoiceData[i].type,
          style: Styles.circularStdRegular(context,
              color: invoiceData[i].type == ""
                  ? AppColors.primaryColor
                  : AppColors.blackColor,
              fontWeight: invoiceData[i].type == ""
                  ? FontWeight.w500
                  : FontWeight.normal)));
      textWidget.add(SizedBox(
        width: 20.sp,
      ));
      textWidget.add(Container(
        padding:
            invoiceData[i].type == "" ? EdgeInsets.only(left: 50.sp) : null,
        // height: 50.sp,
        width: 100,
        margin: const EdgeInsets.only(left: 20),
        child: invoiceData[i].type == ""
            ? Center(
                child: SingleChildScrollView(
                  child: FittedBox(
                    child: AppText(invoiceData[i].narration,
                        maxLine: 4,
                        style: Styles.circularStdRegular(context,
                            color: invoiceData[i].type == ""
                                ? AppColors.primaryColor
                                : AppColors.blackColor,
                            fontWeight: invoiceData[i].type == ""
                                ? FontWeight.w500
                                : FontWeight.normal)),
                  ),
                ),
              )
            : Center(
                child: SingleChildScrollView(
                  child: AppText(invoiceData[i].narration,
                      maxLine: 4,
                      style: Styles.circularStdRegular(context,
                          color: invoiceData[i].type == ""
                              ? AppColors.primaryColor
                              : AppColors.blackColor,
                          fontWeight: invoiceData[i].type == ""
                              ? FontWeight.w500
                              : FontWeight.normal)),
                ),
              ),
      ));
      textWidget.add(SizedBox(
        width: 20.sp,
      ));
      textWidget.add(Container(
          padding:
              invoiceData[i].type == "" ? EdgeInsets.only(left: 50.sp) : null,
          child: AppText(invoiceData[i].amount,
              style: Styles.circularStdRegular(context,
                  color: invoiceData[i].type == ""
                      ? AppColors.primaryColor
                      : AppColors.blackColor,
                  fontWeight: invoiceData[i].type == ""
                      ? FontWeight.w500
                      : FontWeight.normal))));
      row.add(Column(
        children: [
          Container(
            width: invoiceData[i].type == "" ? 1.sw * 1.15 : null,
            color: invoiceData[i].type == ""
                ? AppColors.lightInvoiceColor
                : AppColors.whiteColor,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...textWidget,
              ],
            ),
          ),
          SizedBox(
            height: 20.sp,
          )
        ],
      ));
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: row,
    );
  }
}

class StatementData {
  final String date;
  final String type;
  final String narration;
  final String amount;

  StatementData(this.date, this.type, this.narration, this.amount);
}

class StatementListDataSource extends DataGridSource {
  final BuildContext context;
  final List<StatementData> employees;

  StatementListDataSource({required this.employees, required this.context}) {
    _employees = List.generate(
        employees.length,
        (index) => DataGridRow(cells: [
              DataGridCell<String>(
                  columnName: 'Date', value: employees[index].date),
              DataGridCell<String>(
                  columnName: 'Type', value: employees[index].type),
              DataGridCell<String>(
                  columnName: 'Narration', value: employees[index].narration),
              DataGridCell<String>(
                  columnName: 'Amount', value: employees[index].amount),
            ]));
  }

  List<DataGridRow> _employees = [];

  @override
  List<DataGridRow> get rows => _employees;

  @override
  DataGridRowAdapter? buildRow(DataGridRow rowsss) {
    Color getBackgroundColor() {
      int index = _employees.indexOf(rowsss) + 1;
      print(index);

      if (employees[index - 1].type == "") {
        return AppColors.lightInvoiceColor;
      } else {
        return Colors.white;
      }
    }

    Color getTextColor() {
      int index = _employees.indexOf(rowsss) + 1;
      print(index);

      if (employees[index - 1].type == "") {
        return AppColors.primaryColor;
      } else {
        return Colors.black;
      }
    }

    Color getTextColor2() {
      int index = _employees.indexOf(rowsss) + 1;
      print(index);

      if (employees[index - 1].type == "") {
        return AppColors.primaryColor;
      } else if (employees[index - 1].type == 'Invoice') {
        return Colors.red;
      } else {
        return Colors.black;
      }
    }

    return DataGridRowAdapter(
        //  color: AppColors.primaryColor,
        color: getBackgroundColor(),
        cells: rowsss.getCells().map<Widget>((dataGridCell) {
          return Container(
            height: 50,
            width: 180,
            // color: AppColors.primaryColor,
            alignment: (dataGridCell.columnName == 'Date')
                ? Alignment.centerRight
                : Alignment.center,
            padding: const EdgeInsets.all(10.0),

            child: dataGridCell.columnName == 'Amount'
                ? AppText(
                    dataGridCell.value.toString(),
                    style: Styles.circularStdRegular(context,
                        color: getTextColor2()),
                    maxLine: 3,
                  )
                : AppText(
                    dataGridCell.value.toString(),
                    style: Styles.circularStdRegular(context,
                        color: getTextColor()),
                    maxLine: 3,
                  ),
          );
        }).toList());
  }
}
