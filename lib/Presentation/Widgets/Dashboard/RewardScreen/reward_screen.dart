import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:cross_scroll/cross_scroll.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_linear_datepicker/flutter_datepicker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hbk/Application/Services/Pdf/pdf_downlaod.dart';
import 'package:hbk/Data/DataSource/Resources/assets.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Resources/imports.dart';
import 'package:hbk/Data/DataSource/Resources/sized_box.dart';
import 'package:hbk/Data/DataSource/Resources/strings.dart';
import 'package:hbk/Data/DataSource/Resources/text_styles.dart';
import 'package:hbk/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:hbk/Presentation/Common/app_buttons.dart';
import 'package:hbk/Presentation/Common/app_text.dart';
import 'package:hbk/Presentation/Common/custom_appbar_with_back_button.dart';
import 'package:hbk/Presentation/Common/custom_textfield_with_on_tap.dart';
import 'package:hbk/Presentation/Common/serverDownWidget.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/RewardScreen/Controller/reward_controller_cubit.dart';
import 'package:hbk/Presentation/Widgets/pdf_screen.dart';
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class RewardScreen extends StatefulWidget {
  RewardScreen({super.key});

  @override
  State<RewardScreen> createState() => _RewardScreenState();
}

class _RewardScreenState extends State<RewardScreen> {
  final List<RewardModel> rewardListData = [
    RewardModel(
        session: '01/05/ - 06/06/2023',
        status: 'loyal silver',
        netSale: 'Rs 1,754,000',
        bonusReward: 'Rs 1,754,000',
        loyalReward: 'Rs 1,754,000',
        totalReward: 'Rs 1,754,000'),
    RewardModel(
        session: '01/05/ - 06/06/2023',
        status: 'loyal silver',
        netSale: 'Rs 1,754,000',
        bonusReward: 'Rs 1,754,000',
        loyalReward: 'Rs 1,754,000',
        totalReward: 'Rs 1,754,000'),
    RewardModel(
        session: '01/05/ - 06/06/2023',
        status: 'loyal silver',
        netSale: 'Rs 1,754,000',
        bonusReward: 'Rs 1,754,000',
        loyalReward: 'Rs 1,754,000',
        totalReward: 'Rs 1,754,000'),
    RewardModel(
        session: '01/05/ - 06/06/2023',
        status: 'loyal silver',
        netSale: 'Rs 1,754,000',
        bonusReward: 'Rs 1,754,000',
        loyalReward: 'Rs 1,754,000',
        totalReward: 'Rs 1,754,000'),
    RewardModel(
        session: '01/05/ - 06/06/2023',
        status: 'loyal silver',
        netSale: 'Rs 1,754,000',
        bonusReward: 'Rs 1,754,000',
        loyalReward: 'Rs 1,754,000',
        totalReward: 'Rs 1,754,000'),
    RewardModel(
        session: '01/05/ - 06/06/2023',
        status: 'loyal silver',
        netSale: 'Rs 1,754,000',
        bonusReward: 'Rs 1,754,000',
        loyalReward: 'Rs 1,754,000',
        totalReward: 'Rs 1,754,000'),
    RewardModel(
        session: '01/05/ - 06/06/2023',
        status: 'loyal silver',
        netSale: 'Rs 1,754,000',
        bonusReward: 'Rs 1,754,000',
        loyalReward: 'Rs 1,754,000',
        totalReward: 'Rs 1,754,000'),

    RewardModel(
        session: '01/05/ - 06/06/2023',
        status: 'loyal silver',
        netSale: 'Rs 1,754,000',
        bonusReward: 'Rs 1,754,000',
        loyalReward: 'Rs 1,754,000',
        totalReward: 'Rs 1,754,000'),
    RewardModel(
        session: '01/05/ - 06/06/2023',
        status: 'loyal silver',
        netSale: 'Rs 1,754,000',
        bonusReward: 'Rs 1,754,000',
        loyalReward: 'Rs 1,754,000',
        totalReward: 'Rs 1,754,000'),
    RewardModel(
        session: '01/05/ - 06/06/2023',
        status: 'loyal silver',
        netSale: 'Rs 1,754,000',
        bonusReward: 'Rs 1,754,000',
        loyalReward: 'Rs 1,754,000',
        totalReward: 'Rs 1,754,000'),
    RewardModel(
        session: '01/05/ - 06/06/2023',
        status: 'loyal silver',
        netSale: 'Rs 1,754,000',
        bonusReward: 'Rs 1,754,000',
        loyalReward: 'Rs 1,754,000',
        totalReward: 'Rs 1,754,000'),
    RewardModel(
        session: '01/05/ - 06/06/2023',
        status: 'loyal silver',
        netSale: 'Rs 1,754,000',
        bonusReward: 'Rs 1,754,000',
        loyalReward: 'Rs 1,754,000',
        totalReward: 'Rs 1,754,000'),
    RewardModel(
        session: '01/05/ - 06/06/2023',
        status: 'loyal silver',
        netSale: 'Rs 1,754,000',
        bonusReward: 'Rs 1,754,000',
        loyalReward: 'Rs 1,754,000',
        totalReward: 'Rs 1,754,000'),
    RewardModel(
        session: '01/05/ - 06/06/2023',
        status: 'loyal silver',
        netSale: 'Rs 1,754,000',
        bonusReward: 'Rs 1,754,000',
        loyalReward: 'Rs 1,754,000',
        totalReward: 'Rs 1,754,000'),

    RewardModel(
        session: '01/05/ - 06/06/2023',
        status: 'loyal silver',
        netSale: 'Rs 1,754,000',
        bonusReward: 'Rs 1,754,000',
        loyalReward: 'Rs 1,754,000',
        totalReward: 'Rs 1,754,000'),
    RewardModel(
        session: '01/05/ - 06/06/2023',
        status: 'loyal silver',
        netSale: 'Rs 1,754,000',
        bonusReward: 'Rs 1,754,000',
        loyalReward: 'Rs 1,754,000',
        totalReward: 'Rs 1,754,000'),
    RewardModel(
        session: '01/05/ - 06/06/2023',
        status: 'loyal silver',
        netSale: 'Rs 1,754,000',
        bonusReward: 'Rs 1,754,000',
        loyalReward: 'Rs 1,754,000',
        totalReward: 'Rs 1,754,000'),
    RewardModel(
        session: '01/05/ - 06/06/2023',
        status: 'loyal silver',
        netSale: 'Rs 1,754,000',
        bonusReward: 'Rs 1,754,000',
        loyalReward: 'Rs 1,754,000',
        totalReward: 'Rs 1,754,000'),
    RewardModel(
        session: '01/05/ - 06/06/2023',
        status: 'loyal silver',
        netSale: 'Rs 1,754,000',
        bonusReward: 'Rs 1,754,000',
        loyalReward: 'Rs 1,754,000',
        totalReward: 'Rs 1,754,000'),
    RewardModel(
        session: '01/05/ - 06/06/2023',
        status: 'loyal silver',
        netSale: 'Rs 1,754,000',
        bonusReward: 'Rs 1,754,000',
        loyalReward: 'Rs 1,754,000',
        totalReward: 'Rs 1,754,000'),
    RewardModel(
        session: '01/05/ - 06/06/2023',
        status: 'loyal silver',
        netSale: 'Rs 1,754,000',
        bonusReward: 'Rs 1,754,000',
        loyalReward: 'Rs 1,754,000',
        totalReward: 'Rs 1,754,000'),

    // Add more data for other months
  ];

  final List<String> invoiceTitle = [
    "Session",
    "Status",
    "Net sale",
    "Bonus reward",
    'Loyal reward',
    'Total reward'
  ];
  late RewardListDataSource rewardDataSource;

  @override
  void initState() {
    super.initState();
    //employees= getEmployees();
    context.read<RewardControllerCubit>().getRewardDto();
    // rewardDataSource = RewardListDataSource(employees: rewardListData, context: context);
  }

  // final TextEditingController searchControllerPrice=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWithBackButton(
        title: 'Rewards',
        exceptional: true,
        iconColor: AppColors.primaryColor,
        iconData: Icons.arrow_back_ios,
        padding: EdgeInsets.only(left: 5),
        iconSize: 15,
      ),
      body: Column(
        children: [
          CustomSizedBox.height(10),

          ///Top Row

          Expanded(
            child: BlocConsumer<RewardControllerCubit, RewardControllerState>(
              listener: (context, state) {
                // TODO: implement listener
                if (state is RewardLoading) {
                  LoadingDialog.showLoadingDialog(context);
                }
                if (state is RewardLoaded) {
                  Navigate.pop(context);
                }
                if (state is RewardError) {
                  Navigate.pop(context);
                }
              },
              builder: (context, state) {
                if (state is RewardLoaded) {
                  rewardDataSource = RewardListDataSource(
                      employees: state.actualRewardData, context: context);
                  return SfDataGridTheme(
                    data: SfDataGridThemeData(
                        headerColor: AppColors.primaryColor),
                    child: SfDataGrid(
                      horizontalScrollPhysics: const BouncingScrollPhysics(),
                      verticalScrollPhysics: const BouncingScrollPhysics(),
                      gridLinesVisibility: GridLinesVisibility.none,
                      columnWidthMode: ColumnWidthMode.auto,
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
                          rewardDataSource, // Number of frozen columns (sticky columns)
                    ),
                  );
                }
                // else if(State is RewardLoading)
                //   {
                //     return LoadingDialog.loadingWidget();
                //
                //   }
                else if (state is RewardError) {
                  return ServerDownWidget(
                      errorMessage: state.error,
                      errorTitle: state.status == 30
                          ? 'Internet Error'
                          : 'Server Error',
                      onTap: () {
                        context.read<RewardControllerCubit>().getRewardDto();
                      });
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
          SizedBox(
            width: 1.sw,
            child: FractionallySizedBox(
              widthFactor: 1,
              child: BlocBuilder<RewardControllerCubit, RewardControllerState>(
                builder: (context, state) {
                  if (state is RewardLoaded) {
                    return CustomButton(
                      gapWidth: 10,
                      textFontWeight: FontWeight.w400,
                      imageWidth: 20.sp,
                      imageHeight: 20,
                      leadingSvgIcon: true,
                      leadingIcon: (Assets.downloadIcon),
                      onTap: () async {
                        await PdfDownload()
                            .generatePdfForReward(state.actualRewardData)
                            .then((value) async {
                          if (value != null) {
                            //  await OpenFile.open(value.absolute.path);

                            Navigate.to(context,
                                PdfScreen(filePath: value.absolute.path));
                          }
                          print("valueeeeeeeeeeee ${value?.absolute.path}");
                        });
                      },
                      text: "Download",
                      horizontalMargin: 20,
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
          ),
          CustomSizedBox.height(10)

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
        columnName: 'Session',
        label: Container(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: AppText(
              'Session',
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
        columnName: 'Status',
        label: Container(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: AppText(
              'Status',
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
        columnName: 'Net Sale',
        label: Container(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: AppText(
              'Net Sale',
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
        columnName: 'Bonus Reward',
        label: Container(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: AppText(
              'Bonus Reward',
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
        columnName: 'Loyal Reward',
        label: Container(
          //width: 200,
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: AppText(
              'Loyal Reward',
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
        columnName: 'Total Reward',
        label: Container(
          //width: 200,
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: AppText(
              'Total Reward',
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

  Widget showRewardListData(context) {
    List<List<RewardModel>> invoiceFinalData = [
      [],
      [],
      [],
      [],
    ];
    List<List<RewardModel>> inData = [rewardListData];

    List<Widget> row = [];

    for (int i = 0; i < rewardListData.length; i++) {
      List<Widget> textWidget = [];

      textWidget.add(Container(
          alignment: Alignment.centerLeft,
          //  width: 130,
          // color: Colors.red,
          // margin: EdgeInsets.only(right: 50.sp),
          child: AppText(rewardListData[i].session.toString(),
              style: Styles.circularStdRegular(context,
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.normal))));
      //  textWidget.add(SizedBox(width: 10.sp,));
      textWidget.add(SizedBox(
        width: 40.sp,
      ));
      textWidget.add(Container(
          //width: 100.sp,
          //   color: Colors.black,
          alignment: Alignment.centerLeft,
          //  padding: EdgeInsets.only(right: 100.sp),

          child: AppText(rewardListData[i].status.toString(),
              // maxLine: 4,
              style: Styles.circularStdRegular(context,
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.normal))));
      textWidget.add(SizedBox(
        width: 40.sp,
      ));
      textWidget.add(Container(
        // padding: priceListData[i].item==""? EdgeInsets.only(left: 50.sp):null,
        // height: 50.sp,
        // width: 100,
        alignment: Alignment.centerLeft,
        // padding: EdgeInsets.only(right: 10.sp),

        // margin: const EdgeInsets.only(left: 20),
        child: Center(
          child: SingleChildScrollView(
            child: AppText(rewardListData[i].netSale.toString(),
                style: Styles.circularStdRegular(context,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.normal)),
          ),
        ),
      ));
      textWidget.add(SizedBox(
        width: 40.sp,
      ));

      textWidget.add(Container(
          // padding: priceListData[i].item==""? EdgeInsets.only(left: 50.sp):null,
          alignment: Alignment.centerLeft,
          //padding: EdgeInsets.only(right: 30.sp),
          child: AppText(rewardListData[i].bonusReward.toString(),
              style: Styles.circularStdRegular(context,
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.normal))));
      textWidget.add(SizedBox(
        width: 40.sp,
      ));
      textWidget.add(Container(
          // padding: priceListData[i].item==""? EdgeInsets.only(left: 50.sp):null,
          alignment: Alignment.centerLeft,
          //padding: EdgeInsets.only(right: 30.sp),
          child: AppText(rewardListData[i].loyalReward.toString(),
              style: Styles.circularStdRegular(context,
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.normal))));
      textWidget.add(SizedBox(
        width: 40.sp,
      ));
      textWidget.add(Container(
          // padding: priceListData[i].item==""? EdgeInsets.only(left: 50.sp):null,
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(left: 10.sp),
          //padding: EdgeInsets.only(right: 30.sp),
          child: AppText(rewardListData[i].totalReward.toString(),
              style: Styles.circularStdRegular(context,
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.normal))));
      row.add(Column(
        children: [
          CustomSizedBox.height(10.sp),
          Container(
            // width:priceListData[i].title!=null? 1.sw *1.15:null,

            //  color: priceListData[i].title!=null?AppColors.lightInvoiceColor:AppColors.whiteColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
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

class RewardModel {
  final String? session;
  final String? status;
  final String? netSale;
  final String? bonusReward;
  final String? loyalReward;
  final String? totalReward;

  RewardModel({
    this.session,
    this.status,
    this.netSale,
    this.bonusReward,
    this.loyalReward,
    this.totalReward,
  });
}

///crooss scroll
// CrossScroll(
// horizontalScroll: CrossScrollDesign(
// physics: const BouncingScrollPhysics(),
// padding: const EdgeInsets.only(
// left: 1.0,
// right: 9.0,
// )),
// verticalScroll: CrossScrollDesign(
// physics: const BouncingScrollPhysics(),
// padding:
// const EdgeInsets.only(top: 10, bottom: 70))
//
// ,
// child: Container(
// // padding: const EdgeInsets.all(2),
// decoration: BoxDecoration(
// color: AppColors.whiteColor,
// borderRadius: BorderRadius.circular(10)),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.start,
// children: <Widget>[
//
//
// Row(
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
//
// for (var i = 0; i < invoiceTitle.length; i++)
// Container(
// height: 60.sp,
// width: i==0? 150.sp:120.sp,
// // margin: EdgeInsets.only(right: 0),
//
// alignment: Alignment.centerLeft,
// padding: EdgeInsets.only(left: 25.sp),
// color: AppColors.primaryColor,
// child: AppText(
// invoiceTitle[i],
// // textAlign:  TextAlign.center,
// style: Styles.circularStdBold(context,
// fontSize: 13.sp,
// fontWeight: FontWeight.w500,
// color: AppColors.whiteColor),
// ),
// ),
//
//
//
//
//
//
//
// ],
// ),
// Padding(
//
// padding: EdgeInsets.only(right: 0.sp),
// child: showRewardListData(context)),
//
//
// ],
// ),),
//
// )

class RewardListDataSource extends DataGridSource {
  final BuildContext context;

  RewardListDataSource(
      {required List<RewardModel> employees, required this.context}) {
    _employees = List.generate(
        employees.length,
        (index) => DataGridRow(cells: [
              DataGridCell<String>(
                  columnName: 'Session', value: employees[index].session),
              DataGridCell<String>(
                  columnName: 'Status', value: employees[index].status),
              DataGridCell<String>(
                  columnName: 'Net Sale', value: employees[index].netSale),
              DataGridCell<String>(
                  columnName: 'Bonus Reward',
                  value: employees[index].bonusReward),
              DataGridCell<String>(
                  columnName: 'Loyal Reward',
                  value: employees[index].loyalReward),
              DataGridCell<String>(
                  columnName: 'Total Reward',
                  value: employees[index].totalReward),
            ]));
  }

  List<DataGridRow> _employees = [];

  @override
  List<DataGridRow> get rows => _employees;

  @override
  DataGridRowAdapter? buildRow(DataGridRow rowsss) {
    Color getBackgroundColor() {
      int index = _employees.indexOf(rowsss) + 1;

      return Colors.white;
    }

    return DataGridRowAdapter(
        //  color: AppColors.primaryColor,

        cells: rowsss.getCells().map<Widget>((dataGridCell) {
      return Container(
        // color: AppColors.primaryColor,
        color: getBackgroundColor(),
        alignment: (dataGridCell.columnName == 'Session')
            ? Alignment.centerRight
            : Alignment.center,
        padding: const EdgeInsets.all(10.0),
        child: AppText(
          dataGridCell.value.toString(),
          style: Styles.circularStdRegular(context),
        ),
      );
    }).toList());
  }
}
