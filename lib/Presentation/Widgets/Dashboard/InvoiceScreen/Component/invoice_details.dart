import 'package:cross_scroll/cross_scroll.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hbk/Application/Services/Pdf/pdf_downlaod.dart';
import 'package:hbk/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Resources/imports.dart';
import 'package:hbk/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:hbk/Presentation/Common/custom_appbar_with_back_button.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/InvoiceScreen/Controller/invoice_detail_cubit.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/InvoiceScreen/invoice_screen.dart';
import 'package:hbk/Presentation/Widgets/pdf_screen.dart';
import 'package:open_file/open_file.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'invoice_tile.dart';

class InvoiceDetails extends StatefulWidget {
  final InvoiceModel invoiceData;

  const InvoiceDetails({super.key, required this.invoiceData});

  @override
  State<InvoiceDetails> createState() => _InvoiceDetailsState();
}

class _InvoiceDetailsState extends State<InvoiceDetails> {
  final List<InvoiceDetailModel> rewardListData = [
    InvoiceDetailModel(
        productName: 'Belpla Teenagers 1 Ply Single Bed Blanket',
        type: '160 x 220 CMS',
        packing: 'Rs 1,754,000',
        ctn: 'Rs 1,754,000',
        pcs: 'Rs 1,754,000',
        unitPrice: 'Rs 1,754,000',
        totalPrice: 'Rs 1,754,00'),
    InvoiceDetailModel(
        productName: 'Belpla Teenagers 1 Ply Single Bed Blanket23',
        type: 'l160 x 220 CMSver',
        packing: 'Rs 1,754,000',
        ctn: 'Rs 1,754,000',
        pcs: 'Rs 1,754,000',
        unitPrice: 'Rs 1,754,000',
        totalPrice: 'Rs 1,754,00'),
    InvoiceDetailModel(
        productName: 'Belpla Teenagers 1 dummy',
        type: 'l160 x 220 CMS',
        packing: 'Rs 1,754,000',
        ctn: 'Rs 1,754,000',
        pcs: 'Rs 1,754,000',
        unitPrice: 'Rs 1,754,000',
        totalPrice: 'Rs 1,754,00'),
    InvoiceDetailModel(
        productName: '01/05/ - 06/06/2023',
        type: 'loyal silver',
        packing: 'Rs 1,754,000',
        ctn: 'Rs 1,754,000',
        pcs: 'Rs 1,754,000',
        unitPrice: 'Rs 1,754,000',
        totalPrice: 'Rs 1,754,00'),
    InvoiceDetailModel(
        productName: 'Dummy Teenagers 1 ',
        type: 'loyal silver',
        packing: 'Rs 1,754,000',
        ctn: 'Rs 1,754,000',
        pcs: 'Rs 1,754,000',
        unitPrice: 'Rs 1,754,000',
        totalPrice: 'Rs 1,754,00'),
    InvoiceDetailModel(
        productName: 'Dummy blanket dummy blanket dummy',
        type: 'loyal silver',
        packing: 'Rs 1,754,000',
        ctn: 'Rs 1,754,000',
        pcs: 'Rs 1,754,000',
        unitPrice: 'Rs 1,754,000',
        totalPrice: 'Rs 1,754,00'),
    InvoiceDetailModel(
        productName: 'Dummy blanket dummy blanket',
        type: 'loyal silver',
        packing: 'Rs 1,754,000',
        ctn: 'Rs 1,754,000',
        pcs: 'Rs 1,754,000',
        unitPrice: 'Rs 1,754,000',
        totalPrice: 'Rs 1,754,00'),
    InvoiceDetailModel(
        productName: 'Dummy blanket dummy blanket',
        type: 'loyal silver',
        packing: 'Rs 1,754,000',
        ctn: 'Rs 1,754,000',
        pcs: 'Rs 1,754,000',
        unitPrice: 'Rs 1,754,000',
        totalPrice: 'Rs 1,754,00'),
    InvoiceDetailModel(
        productName: 'Dummy blanket dummy blanket',
        type: 'loyal silver',
        packing: 'Rs 1,754,000',
        ctn: 'Rs 1,754,000',
        pcs: 'Rs 1,754,000',
        unitPrice: 'Rs 1,754,000',
        totalPrice: 'Rs 1,754,00'),
    InvoiceDetailModel(
        productName: 'Dummy blanket dummy blanket3',
        type: 'loyal silver',
        packing: 'Rs 1,754,000',
        ctn: 'Rs 1,754,000',
        pcs: 'Rs 1,754,000',
        unitPrice: 'Rs 1,754,000',
        totalPrice: 'Rs 1,754,00'),

    InvoiceDetailModel(
        productName: 'Dummy blanket dummy blanket',
        type: 'loyal silver',
        packing: 'Rs 1,754,000',
        ctn: 'Rs 1,754,000',
        pcs: 'Rs 1,754,000',
        unitPrice: 'Rs 1,754,000',
        totalPrice: 'Rs 1,754,00'),
    InvoiceDetailModel(
        productName: 'Dummy blanket dummy blanket',
        type: 'loyal silver',
        packing: 'Rs 1,754,000',
        ctn: 'Rs 1,754,000',
        pcs: 'Rs 1,754,000',
        unitPrice: 'Rs 1,754,000',
        totalPrice: 'Rs 1,754,00'),
    InvoiceDetailModel(
        productName: 'Dummy blanket dummy blanket5',
        type: 'loyal silver',
        packing: 'Rs 1,754,000',
        ctn: 'Rs 1,754,000',
        pcs: 'Rs 1,754,000',
        unitPrice: 'Rs 1,754,000',
        totalPrice: 'Rs 1,754,00'),

    InvoiceDetailModel(
        productName: '    ',
        type: '  ',
        packing: '   ',
        ctn: '    ',
        pcs: '',
        unitPrice: ' ',
        totalPrice: ''),

    // Add more data for other months
  ];

  //final ScrollController _innerScrollController = ScrollController();
  final List<String> invoiceTitle = [
    "S#",
    "Product Name",
    "Type",
    "Packing",
    "Ctn",
    'Pcs',
    'Unit Price',
    'Total Price'
  ];

  late InvoiceDataSource invoiceDataSource;

  @override
  void initState() {
    super.initState();
    //employees= getEmployees();
    context
        .read<InvoiceDetailCubit>()
        .getInvoiceDetail(widget.invoiceData.invoiceNo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<InvoiceDetailCubit, InvoiceDetailState>(
          listener: (context, state) {
            if (state is InvoiceDetailLoading) {
              LoadingDialog.showLoadingDialog(context);
            }
            if (state is InvoiceDetailLoaded) {
              Navigate.pop(context);
            }
            if (state is InvoiceDetailError) {
              Navigate.pop(context);
              WidgetFunctions.instance.snackBar(context,
                  text: state.error,
                  textStyle:
                  Styles.circularStdMedium(context, color: Colors.white),
                  bgColor: AppColors.primaryColor);
            }
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is InvoiceDetailLoaded) {
              invoiceDataSource = InvoiceDataSource(
                  employees: state.actualInvoiceData, context: context);
              return Stack(
                children: [
                  NestedScrollView(
                    physics: const BouncingScrollPhysics(),
                    // floatHeaderSlivers: false,
                    // handle:NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                    //controller: _innerScrollController,
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      print(innerBoxIsScrolled);
                      return [
                        SliverAppBar(
                          // appBar: const CustomAppBarWithBackButton(title: 'Invoice detail',iconColor: AppColors.primaryColor,iconData: Icons.arrow_back_ios,padding: EdgeInsets.only(left: 5),iconSize: 15,),

                          //primary: true,
                          //  pinned: true,
                          elevation: 0,
                          // forceElevated: innerBoxIsScrolled,
                          //leading: ,
                          automaticallyImplyLeading: false,
                          flexibleSpace: mainColumn(context, state),
                          backgroundColor: AppColors.whiteColor,
                          expandedHeight:
                          MediaQuery
                              .of(context)
                              .size
                              .height * 0.77,
                        ),
                      ];
                    },
                    body: Container(
                        color: AppColors.whiteColor,
                        child: dataTableSfData(context)),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Material(
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
                              await PdfDownload()
                                  .generatePdf(
                                  invoiceTitle,
                                  state.actualInvoiceData,
                                  state.totalCtn,
                                  state.totalPcs,

                                  state.grandTotal)
                                  .then((value) async {
                                Navigate.to(context,
                                    PdfScreen(filePath: value!.absolute.path));
                                // await OpenFile.open(value?.path);
                              });
                            },
                            text: "Download",
                            horizontalMargin: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }

  Widget mainColumn(BuildContext context, InvoiceDetailLoaded state) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 10.sp,
                  ),
                  Align(
                    child: CircleIconButton(
                      icon: Icons.arrow_back_ios,
                      padding: EdgeInsets.only(left: 5.sp),
                      iconColor: AppColors.primaryColor,
                      iconSize: 15,

                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      width: 37.w,
                      // iconSize: 15,
                      height: 37.h,
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(right: 47.0.sp),
                        child: AppText(
                          'Invoice detail',
                          style: Styles.circularStdBold(context,
                              fontSize: 20.sp, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 1.sw,
              height: 60.h,
              padding: EdgeInsets.only(left: 20.sp),
              color: AppColors.lightInvoiceColor,
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: AppText(
                    'Customer details',
                    style: Styles.circularStdBold(context,
                        fontSize: 16, fontWeight: FontWeight.w600),
                  )),
            ),
            //CustomSizedBox.height(10),

            invoiceDetailTile(context,
                text1: 'Customer name',
                text2: state.actualInvoiceData[0].customerName,
                text3: 'Contact person',
                text4: state.actualInvoiceData[0].contactPerson),

            //CustomSizedBox.height(20),
            invoiceDetailTile(context,
                sizeHeight: 105.h,
                text1: 'Phone number',
                text2: state.actualInvoiceData[0].phoneNumber,
                text3: 'Address',
                text4: state.actualInvoiceData[0].address),

            //CustomSizedBox.height(20),
            Container(
              width: 1.sw,
              height: 60.h,
              padding: EdgeInsets.only(left: 20.sp),
              color: AppColors.lightInvoiceColor,
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: AppText(
                    'Invoice',
                    style: Styles.circularStdBold(context,
                        fontSize: 16, fontWeight: FontWeight.w600),
                  )),
            ),
            //CustomSizedBox.height(12),
            invoiceDetailTile(context,
                text1: 'Invoice No',
                text2: state.actualInvoiceData[0].invoiceNo,
                text3: 'Created by',
                text4: state.actualInvoiceData[0].createdBy),
            //CustomSizedBox.height(12),
            invoiceDetailTile(context,
                text1: 'Status',
                text2: state.actualInvoiceData[0].status,
                text3: 'Date',
                text4: state.actualInvoiceData[0].date),
            //CustomSizedBox.height(20),
            invoiceDetailTile(context,
                text1: 'Sale Person',
                text2: state.actualInvoiceData[0].salePerson),
            // CustomSizedBox.height(20),
            ///this should not be in sliver app bar
          ],
        ),
      ),
    );
  }

  ///data table builtinin
//    List<DataColumn> generateDataColumns(BuildContext context) {
//      return List.generate(8, (index) {
//        String label = '';
//        switch (index) {
//          case 0:
//            label = 'S#';
//            break;
//          case 1:
//            label = 'Product Name';
//            break;
//          case 2:
//            label = 'Type';
//            break;
//          case 3:
//            label = 'Packing';
//            break;
//          case 4:
//            label = 'Ctn';
//            break;
//          case 5:
//            label = 'Pcs';
//            break;
//          case 6:
//            label = 'Unit Price';
//            break;
//          case 7:
//            label = 'Total Price';
//            break;
//        }
//
//        return DataColumn(
//          label: AppText(
//            label,
//            style: Styles.circularStdRegular(
//              context,
//              fontSize: 15.sp,
//              color: AppColors.whiteColor,
//              fontWeight: FontWeight.w500,
//            ),
//          ),
//        );
//      });
//    }
//
//   Widget dataTableData(BuildContext context) {
//
//     List<DataColumn> dataColumns = generateDataColumns(context);
//     return Column(
//       children: [
//        // CustomSizedBox.height(15),
//
//         Expanded(
//             child:SingleChildScrollView(
//               child: DataTableTheme(
//                 data: DataTableThemeData(
//                //   headingRowColor: MaterialStateColor.resolveWith((states) => AppColors.primaryColor),
//                   //  dataRowColor: MaterialStateColor.resolveWith((states) => Colors.grey.shade100),
//                   headingTextStyle: Styles.circularStdBold(context,fontSize: 15.sp,color: AppColors.primaryColor),
//                   // dataTextStyle: Styles.circularStdBold(context,fontSize: 15.sp,color: AppColors.primaryColor),
//                 ),
//                 child: DataTable(
//                   //fixedTopRows: 1,
//                   horizontalMargin: 10,
//
// //               minWidth: 800,
//                 // smRatio: 0.7,
//
//                  //lmRatio: 10,
//                   columnSpacing: 1.sw/20,
//
//                   dataRowMaxHeight: 65,
//                   headingRowColor: MaterialStateColor.resolveWith((states) => AppColors.primaryColor),
//                   columns: dataColumns,
//                   rows:  [
//                     for(int index=0 ;index<rewardListData.length;index++)
//                       DataRow(
//
//
//                           cells: [
//                             DataCell(SizedBox(
//                                 height: 20,
//
//
//                                 child: AppText(index==rewardListData.length-1?"": index.toString(), style: Styles.circularStdRegular(context,color: AppColors.blackColor),))),
//
//                             DataCell(AppText(rewardListData[index].productName.toString(),
//
//                               style: Styles.circularStdRegular(context,color:AppColors.blackColor),)),
//                             DataCell(SizedBox(
//                               //width: 100.sp,
//                               child: AppText(rewardListData[index].type.toString(),
//                                 maxLine: 5,
//                                 style: Styles.circularStdRegular(context,color: AppColors.blackColor),),
//                             )),
//                             DataCell(AppText(rewardListData[index].packing.toString(), style: Styles.circularStdRegular(context,color: AppColors.blackColor),)),
//                             DataCell(AppText(rewardListData[index].ctn.toString(), style: Styles.circularStdRegular(context,color: AppColors.blackColor),)),
//                             DataCell(AppText(rewardListData[index].pcs.toString(), style: Styles.circularStdRegular(context,color: AppColors.blackColor),)),
//                             DataCell(AppText(rewardListData[index].unitPrice.toString(), style: Styles.circularStdRegular(context,color: AppColors.blackColor),)),
//                             DataCell(AppText(rewardListData[index].totalPrice.toString(), style: Styles.circularStdRegular(context,color: AppColors.blackColor),)),
//
//                           ],
//                           color:MaterialStateColor.resolveWith((states) => AppColors.whiteColor)
//                       ),
//
//
//                   ],
//                   dividerThickness: 0.0,
//                   // dataRowHeight: 32,// Set the thickness of the divider
//
//                 ),
//               ),
//             ) ,
//           ),
//
//
//       ],
//     );
//   }

  ///sf data grid
  Widget dataTableSfData(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SfDataGridTheme(
            data: SfDataGridThemeData(headerColor: AppColors.primaryColor),
            child: SfDataGrid(
              gridLinesVisibility: GridLinesVisibility.none,
              columnWidthMode: ColumnWidthMode.auto,
              horizontalScrollPhysics: const BouncingScrollPhysics(),
              verticalScrollPhysics: const BouncingScrollPhysics(),
              // source: DataGridSource().buildRow(row),
              columns: getColumns(context),

              headerRowHeight: 65,

              // headerGridLineStrokeWidth: 0.0,

              frozenRowsCount: 0,
              frozenColumnsCount: 0,
              source:
              invoiceDataSource, // Number of frozen columns (sticky columns)
            ),
          ),
        ),
      ],
    );
  }

  List<GridColumn> getColumns(BuildContext context) {
    return [
      GridColumn(
        columnName: 'S#',
        label: Container(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: AppText(
              'S#',
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
        columnName: 'Product Name',
        label: Container(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: AppText(
              'Product Name',
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
        columnName: 'Type',
        label: Container(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: AppText(
              'Type',
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
        columnName: 'Packing',
        label: Container(
          //width: 200,
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: AppText(
              'Packing',
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
        columnName: 'Ctn',
        label: Container(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: AppText(
              'Ctn',
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
        columnName: 'Pcs',
        label: Container(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: AppText(
              'Pcs',
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
        columnName: 'Unit Price',
        label: Container(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: AppText(
              'Unit Price',
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
        columnName: 'Total Price',
        label: Container(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: AppText(
              'Total Price',
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
  // CrossScroll(
  // verticalBar: const CrossScrollBar(thickness: 0),
  // horizontalBar: const CrossScrollBar(thickness: 2),
  // // verticalScrollController: _innerScrollController,
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
  // ,
  //
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
  // crossAxisAlignment: CrossAxisAlignment.start,
  // children: [
  //
  // for (var i = 0; i < invoiceTitle.length; i++)
  // Container(
  // height: 60.sp,
  // width: i==0? 40.sp:180.sp,
  // //padding: EdgeInsets.only(right: 30),
  //
  // alignment: Alignment.center,
  // padding: EdgeInsets.only(left: 10.sp,),
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
  // child: showInvoiceDetailListData(context)),
  //
  //
  // ],
  // ),),
  //
  // )
  Widget invoiceDetailTile(BuildContext context,
      {String? text1,
        String? text2,
        String? text3,
        String? text4,
        double? sizeHeight}) {
    return SizedBox(
      height: sizeHeight ?? 65.h,
      child: Padding(
        padding: EdgeInsets.only(left: 20.0.sp),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: AppText(text1 ?? '',
                          style: Styles.circularStdRegular(context,
                              fontWeight: FontWeight.w600, fontSize: 14.sp))),
                  CustomSizedBox.height(2),
                  Expanded(
                    flex: 2,
                    child: AppText(text2 ?? '',
                        maxLine: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.circularStdBold(context,
                            fontWeight: FontWeight.w600, fontSize: 15.sp)),
                  ),
                  //SizedBox(width: 20,)
                ],
              ),
            ),
            CustomSizedBox.width(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: AppText(text3 ?? '',
                          style: Styles.circularStdRegular(context,
                              fontWeight: FontWeight.w600, fontSize: 14.sp))),
                  CustomSizedBox.height(2),
                  Expanded(
                    flex: 2,
                    child: AppText(text4 ?? '',
                        maxLine: 4,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.circularStdBold(context,
                            fontWeight: FontWeight.w600, fontSize: 15.sp)),
                  ),
                  //SizedBox(width: 20,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget showInvoiceDetailListData(context) {
    // // List<List<RewardModel>> invoiceFinalData = [
    //    [],
    //    [],
    //    [],
    //    [],
    //
    //  ];
    //  //List<List<RewardModel>> inData = [rewardListData];

    List<Widget> row = [];

    for (int i = 0; i < rewardListData.length; i++) {
      List<Widget> textWidget = [];

      textWidget.add(Container(
          alignment: Alignment.centerLeft,
          //  width: 130,
          width: 40,
          //margin: const EdgeInsets.only(right: 40),
          //  padding: const EdgeInsets.only(left: 10),
          margin: EdgeInsets.only(right: 40.w),
          padding: EdgeInsets.only(left: 2.w),
          // color: Colors.red,
          //margin: EdgeInsets.only(right: 200.sp),
          child: AppText(i.toString(),
              style: Styles.circularStdRegular(context,
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.normal))));
      //textWidget.add(SizedBox(width: 10.sp,));
      //  textWidget.add(SizedBox(width: 10.sp,));
      //  textWidget.add(SizedBox(width: 40.sp,));
      textWidget.add(Container(
          width: 180.sp,
          //   color: Colors.black,
          alignment: Alignment.centerLeft,
          //  padding: const EdgeInsets.only(left: 10),
          // padding: const EdgeInsets.only(left: 10),
          //  padding: EdgeInsets.only(right: 100.sp),

          child: AppText(rewardListData[i].productName.toString(),
              maxLine: 4,
              style: Styles.circularStdRegular(context,
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.normal))));
      textWidget.add(SizedBox(
        width: 5.sp,
      ));
      //    textWidget.add(SizedBox(width: 40.sp,));
      textWidget.add(Container(
        // padding: priceListData[i].item==""? EdgeInsets.only(left: 50.sp):null,
        // height: 50.sp,
        width: 180.sp,
        alignment: Alignment.centerLeft,
        // padding: EdgeInsets.only(right: 10.sp),

        // margin: const EdgeInsets.only(left: 20),
        child: AppText(rewardListData[i].type.toString(),
            style: Styles.circularStdRegular(context,
                color: AppColors.blackColor, fontWeight: FontWeight.normal)),
      ));
//       textWidget.add(SizedBox(width: 40.sp,));
      textWidget.add(SizedBox(
        width: 10.sp,
      ));

      textWidget.add(Container(
        // padding: const EdgeInsets.only(left: 10),
        // padding: priceListData[i].item==""? EdgeInsets.only(left: 50.sp):null,
          alignment: Alignment.centerLeft,
          width: 180.sp,
          //padding: const EdgeInsets.only(right: 60),
          //padding: EdgeInsets.only(right: 30.sp),
          child: AppText(rewardListData[i].packing.toString(),
              style: Styles.circularStdRegular(context,
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.normal))));
      textWidget.add(SizedBox(
        width: 10.sp,
      ));
      // textWidget.add(SizedBox(width: 40.sp,));
      textWidget.add(Container(
        // padding: priceListData[i].item==""? EdgeInsets.only(left: 50.sp):null,
          alignment: Alignment.centerLeft,
          width: 180.sp,
          //padding: EdgeInsets.only(right: 30.sp),
          child: AppText(rewardListData[i].ctn.toString(),
              style: Styles.circularStdRegular(context,
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.normal))));
      textWidget.add(SizedBox(
        width: 10.sp,
      ));
      //   textWidget.add(SizedBox(width: 40.sp,));
      textWidget.add(Container(
          padding: const EdgeInsets.only(right: 40),
          // padding: priceListData[i].item==""? EdgeInsets.only(left: 50.sp):null,
          alignment: Alignment.centerLeft,
          // margin: EdgeInsets.only(left: 10.sp),
          //padding: EdgeInsets.only(right: 30.sp),
          child: AppText(rewardListData[i].pcs.toString(),
              style: Styles.circularStdRegular(context,
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.normal))));
      textWidget.add(SizedBox(
        width: 30.sp,
      ));
      // textWidget.add(SizedBox(width: 40.sp,));
      textWidget.add(Container(
        // padding: priceListData[i].item==""? EdgeInsets.only(left: 50.sp):null,
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 10.sp),
          //padding: EdgeInsets.only(right: 30.sp),
          child: AppText(rewardListData[i].unitPrice.toString(),
              style: Styles.circularStdRegular(context,
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.normal))));
      textWidget.add(SizedBox(
        width: 30.sp,
      ));
      //  textWidget.add(SizedBox(width: 40.sp,));
      textWidget.add(Container(
          width: 180.sp,
          // padding: priceListData[i].item==""? EdgeInsets.only(left: 50.sp):null,
          alignment: Alignment.centerLeft,
          //margin: EdgeInsets.only(left: 10.sp),
          padding: EdgeInsets.only(left: 90.sp),
          child: AppText(rewardListData[i].totalPrice.toString(),
              style: Styles.circularStdRegular(context,
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.normal))));
      // textWidget.add(SizedBox(width: 30.sp,));
      row.add(Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: row,
    );
  }
}

class InvoiceDetailModel {
  final String? productName;
  final String? type;
  final String? packing;
  final String? ctn;
  final String? pcs;
  final String? customerName;
  final String? contactPerson;
  final String? phoneNumber;
  final String? address;
  final String? createdBy;
  final String? status;
  final String? invoiceNo;
  final String? date;
  final String? salePerson;

  final String? unitPrice;
  final String? totalPrice;

  InvoiceDetailModel({
    this.productName,
    this.type,
    this.packing,
    this.ctn,
    this.pcs,
    this.unitPrice,
    this.totalPrice,
    this.customerName,
    this.contactPerson,
    this.phoneNumber,
    this.address,
    this.createdBy,
    this.status,
    this.invoiceNo,
    this.date,
    this.salePerson,
  });
}

class InvoiceDataSource extends DataGridSource {
  final BuildContext context;

  InvoiceDataSource(
      {required List<InvoiceDetailModel> employees, required this.context}) {
    _employees = List.generate(
        employees.length,
            (index) =>
            DataGridRow(cells: [
              DataGridCell<String>(columnName: 'S#', value: index.toString()),
              DataGridCell<String>(
                  columnName: 'Product Name',
                  value: employees[index].productName),
              DataGridCell<String>(
                  columnName: 'Type', value: employees[index].type),
              DataGridCell<String>(
                  columnName: 'Packing', value: employees[index].packing),
              DataGridCell<String>(
                  columnName: 'Ctn', value: employees[index].ctn),
              DataGridCell<String>(
                  columnName: 'Pcs', value: employees[index].pcs),
              DataGridCell<String>(
                  columnName: 'Unit Price', value: employees[index].unitPrice),
              DataGridCell<String>(
                  columnName: 'Total Price',
                  value: employees[index].totalPrice),
            ]));
  }

  List<DataGridRow> _employees = [];

  @override
  List<DataGridRow> get rows => _employees;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
          return Container(
            alignment: (dataGridCell.columnName == 'S#')
                ? Alignment.centerRight
                : Alignment.centerLeft,
            padding: const EdgeInsets.all(16.0),
            child: AppText(
              dataGridCell.value.toString(),
              style: Styles.circularStdRegular(context),
            ),
          );
        }).toList());
  }
}
