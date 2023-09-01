import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:cross_scroll/cross_scroll.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_linear_datepicker/flutter_datepicker.dart';
import 'package:hbk/Application/Services/Pdf/generate_pdf.dart';
import 'package:hbk/Application/Services/Pdf/pdf_downlaod.dart';
import 'package:hbk/Data/DataSource/Resources/imports.dart';
import 'package:hbk/Data/DataSource/Resources/properties_data.dart';
import 'package:hbk/Data/DataSource/Resources/strings.dart';
import 'package:hbk/Domain/Models/HomeScreen/product_model.dart';
import 'package:hbk/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:hbk/Presentation/Common/custom_appbar_with_back_button.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/SearchScreen/Controller/all_products_cubit.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/Statement/Component/pdf_layout.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:open_file/open_file.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class PriceListScreen extends StatefulWidget {
  const PriceListScreen({super.key});

  @override
  State<PriceListScreen> createState() => _PriceListScreenState();
}

class _PriceListScreenState extends State<PriceListScreen>   with AutomaticKeepAliveClientMixin<PriceListScreen>{
  final List<PriceListModel> priceListData = [
    PriceListModel(
      "",
      "",
      '',
      country: 'China',
      sNo: "",
      price: "",
      ctn: "",
    ),
    PriceListModel(null, "", '',
        category: "Single bed & Medium blanket", ctn: "", price: "", sNo: ""),
    PriceListModel(
        "Baby Perla Gold 1 Ply Blanket ( Large )", "160 x 120 CMS", 'Gift box',
        sNo: "1", ctn: "12 pcs", price: "Rs 10,500"),

    PriceListModel("Burjjan 1 ply Double bed embossed blanket", "160 x 120 CMS",
        'Gift box',
        sNo: "2", ctn: "12 pcs", price: "Rs 10,500"),
    PriceListModel(
      "",
      "",
      '',
      country: 'Spain',
      sNo: "",
      price: "",
      ctn: "",
    ),
    PriceListModel(null, "", '',
        category: "Single bed & Medium blanket", ctn: "", price: "", sNo: ''),
    PriceListModel(
        "Baby Perla Gold 1 Ply Blanket ( Large )", "160 x 120 CMS", 'Gift box',
        sNo: "3", ctn: "12 pcs", price: "Rs 10,500"),

    PriceListModel(
      "",
      "",
      '',
      country: 'India',
      sNo: "",
      price: "",
      ctn: "",
    ),
    PriceListModel(null, "", '',
        category: "Single bed & Medium blanket", ctn: "", price: "", sNo: ""),
    PriceListModel(
        "Baby Perla Gold 1 Ply Blanket ( Large )", "160 x 120 CMS", 'Gift box',
        sNo: "1", ctn: "12 pcs", price: "Rs 10,500"),
    PriceListModel(
      "",
      "",
      '',
      country: 'Pakistan',
      sNo: "",
      price: "",
      ctn: "",
    ),
    PriceListModel(null, "", '',
        category: "Single bed & Medium blanket", ctn: "", price: "", sNo: ""),
    PriceListModel(
        "Baby Perla Gold 1 Ply Blanket ( Large )", "160 x 120 CMS", 'Gift box',
        sNo: "1", ctn: "12 pcs", price: "Rs 10,500"),

    // Add more data for other months
  ];
 // GlobalKey<> scrollControllerKey1 = GlobalKey<>();

//  GlobalKey<LinkedScrollControllerState> scrollControllerKey2 = GlobalKey<LinkedScrollControllerState>();

  final List<String> invoiceTitle = [
    "#",
    "Item",
    "Specification",
    "Packing",
    "Pcs/Ctn",
    "Price"
  ];

  final TextEditingController searchControllerPrice = TextEditingController();
  late PriceListDataSource priceListDataSource;
  late  LinkedScrollControllerGroup _controllers=LinkedScrollControllerGroup();
  ScrollController horizontalScrollController=ScrollController();
  ScrollController horizontalScrollControllerTitle=ScrollController();
@override
  void dispose() {
// horizontalScrollController.dispose();
// horizontalScrollControllerTitle.dispose();
//BlocProvider.of<AllProductsCubit>(context).close();

//  context.read<AllProductsCubit>().getAllProducts(dispose: true);
    // TODO: implement dispose
    super.dispose();
  }
  double _horizontalScrollOffset = 0;

  @override
  bool get wantKeepAlive => true;
  @override
  void initState() {

    //employees= getEmployees();
if(mounted)
  {
    horizontalScrollController = _controllers.addAndGet();
    horizontalScrollControllerTitle = _controllers.addAndGet();
    // _controllers = LinkedScrollControllerGroup()..addOffsetChangedListener(() {
    //   _horizontalScrollOffset = _controllers.offset;
    // });

    //BlocProvider.of<AllProductsCubit>(context).getAllProducts();
  }
    // priceListDataSource =
    //     PriceListDataSource(employees: priceListData, context: context);
    super.initState();

  }

  List<ProductApiModel> tempSearchData=[];
  bool? tempSearchChange;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WillPopScope(
      onWillPop: ()async { return true; },
      child: Scaffold(
        // appBar: const CustomAppBarWithBackButton(
        //   title: 'Price list',
        //   iconColor: AppColors.primaryColor,
        //   iconData: Icons.arrow_back_ios,
        //   padding: EdgeInsets.only(left: 6),
        //   iconSize: 15,
        // ),
        body: SafeArea(
          child: SizedBox(
            width: 1.sw,
            height: 1.sh,
            child: Stack(
              children: [

                 Column(
                  children: [
                //    CustomSizedBox.height(10),

                    ///Top Row
                    SizedBox(
                      height: 1.sh *0.26,
                      child: Column(
                        children: [

                          SizedBox(
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(width: 10.sp,)
                                ,      Align(
                                  child: CircleIconButton(

                                    icon: Icons.arrow_back_ios,
                                    padding: EdgeInsets.only(left: 5.sp),
                                    iconColor: AppColors.primaryColor ,
                                    iconSize: 15,


                                    onPressed: () {
                                      dispose();
                                      _controllers.removeOffsetChangedListener(() { });
                                      _controllers.resetScroll();
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
                                      padding:  EdgeInsets.only(right: 47.0.sp),
                                      child: AppText(
                                        'Price List',
                                        style: Styles.circularStdBold(context, fontSize: 20.sp,fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),

                          ),
                          SizedBox(height: 10.sp,),
                          BlocBuilder<AllProductsCubit, AllProductsState>(
                            builder: (context, state) {
                              return SizedBox(
                                height: 80,
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                    child: CustomTextFieldWithOnTap2(
                                        isShadowRequired: true,
                                        prefixIcon: SvgPicture.asset(
                                          Assets.searchIcon,
                                          color: AppColors.greyColor,
                                        ),
                                        isBorderRequired: false,
                                        onChanged: (query) {
                                          ///tobe evaluated
                                          ///
                                          if(state is AllProductsLoaded) {

                                            setState(() {

                                              tempSearchData=state.allProductsData.where((model) {


                                                final nameLower = model.itemName?.toLowerCase().toString();
                                                final category = model.cat?.toLowerCase().toString();
                                                final price=model.price?.toLowerCase().toString();
                                                final trimmedString = price?.replaceAll(RegExp(r'\.0+$'), '');// Convert age to string for comparison
                                                final queryLower = query.toLowerCase();

                                                return nameLower!.contains(queryLower) || category!.contains(queryLower) || trimmedString!.contains(queryLower);

                                              }).toList();
                                              tempSearchChange=true;

                                            });
                                          }
                                        },
                                        borderRadius: 30.sp,
                                        hintTextColor: AppColors.greyColor,
                                        controller: searchControllerPrice,
                                        hintText: 'Search Products Price Category Title',
                                        textInputType: TextInputType.text),
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: 60,
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                //key: ObjectKey() ,
                                controller: horizontalScrollControllerTitle,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    for (var i = 0; i < invoiceTitle.length; i++)
                                      Container(
                                        height: 60.sp,
                                        width: i == 0 ? 50 : 100.sp,
                                        // margin: EdgeInsets.only(right: 0),

                                        alignment: Alignment.centerLeft,
                                        padding: EdgeInsets.only(
                                            left: i == 0 ? 30.sp : 10),
                                        color: AppColors.primaryColor,
                                        child: AppText(
                                          invoiceTitle[i],
                                          // textAlign:  TextAlign.center,
                                          style: Styles.circularStdBold(context,
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.whiteColor),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    Expanded(
                      child: BlocBuilder<AllProductsCubit, AllProductsState>(

  builder: (context, state) {

      if(state is AllProductsLoaded) {

        tempSearchData = tempSearchChange==null? state.allProductsData:tempSearchChange==true? tempSearchData: [];

       var data= filterData(tempSearchData);

        return CrossScroll(
                        horizontalBar: const CrossScrollBar(thickness: 0),
                        verticalBar: const CrossScrollBar(thickness: 0),
                        horizontalScrollController: horizontalScrollController,
                        horizontalScroll: CrossScrollDesign(
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.only(
                              left: 1.0,
                              right: 9.0,
                            )),
                        verticalScroll: CrossScrollDesign(
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.only(top: 0, bottom: 70)),
                        child: Container(
                          // padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: <Widget>[
                              Visibility(
                                visible: false,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    for (var i = 0; i < invoiceTitle.length; i++)
                                      Container(
                                        height: 60.sp,
                                        width: i == 0 ? 50 : 100.sp,
                                        // margin: EdgeInsets.only(right: 0),

                                        alignment: Alignment.centerLeft,
                                        padding: EdgeInsets.only(
                                            left: i == 0 ? 30.sp : 10),
                                        color: AppColors.primaryColor,
                                        child: AppText(
                                          invoiceTitle[i],
                                          // textAlign:  TextAlign.center,
                                          style: Styles.circularStdBold(context,
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.whiteColor),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              showPriceListData(context,data),
                              // SizedBox(
                              //   width: 1.sw,
                              //   child: FractionallySizedBox(
                              //     widthFactor: 1,
                              //     child: CustomButton(gapWidth: 10,textFontWeight: FontWeight.w400, imageWidth: 20.sp,imageHeight: 20,leadingSvgIcon: true,leadingIcon:(Assets.downloadIcon),onTap: () async {
                              //
                              //       // await PdfDownload().generatePdf(invoiceTitle,priceListData,PDFLayouts().showPdfPriceListData(priceListData),PDFLayouts().pdfTitlePriceList(invoiceTitle)).then((value) => null);
                              //
                              //
                              //     }, text: "Download",horizontalMargin: 20,),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      );
      }
      else if(state is AllProductsLoading)
        {
          return  LoadingDialog.loadingWidget();
        }
      else{


        return SizedBox(height: 0.sp,width: 0.sp,);
      }
  },
),
                    )

                    ///
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


                Positioned(
                  bottom: 0,
                  child: SizedBox(
                    width: 1.sw,
                    child: FractionallySizedBox(
                      widthFactor: 1,
                      child: BlocBuilder<AllProductsCubit, AllProductsState>(
  builder: (context, state) {

    if(state is AllProductsLoaded){
      List<PriceListModel> priceList = filterDataForDownload(state.allProductsData);
      return CustomButton(
        gapWidth: 10,
        textFontWeight: FontWeight.w400,
        imageWidth: 20.sp,
        imageHeight: 20,
        leadingSvgIcon: true,
        leadingIcon: (Assets.downloadIcon),
        onTap: () async {
          // await PdfDownload().generatePdf(invoiceTitle,invoiceData,PDFLayouts().showCustomerStatementDataPdf(invoiceData),PDFLayouts().pdfTitleCustomerStatement(invoiceTitle)).then((value) => null);


          // await GeneratePDF.generateDocumentForPriceList(priceList);
          await PdfDownload().generatePdfForPrice(priceList).then((value) async{
            if(value!=null){
              await OpenFile.open(value.path);
            }
          });
        },
        text: "Download",
        horizontalMargin: 20,
      );
    }
    else{
      return const SizedBox();
    }




  },
),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///sfdatagrid
  // SfDataGridTheme(
  // data: SfDataGridThemeData(headerColor: AppColors.primaryColor),
  // child: SfDataGrid(
  // gridLinesVisibility: GridLinesVisibility.none,
  // columnWidthMode: ColumnWidthMode.fitByCellValue,
  //
  // //  defaultColumnWidth: 100,
  // // columnResizeMode: ColumnResizeMode.onResize,
  // // source: DataGridSource().buildRow(row),
  // columns: getColumns(context),
  // onCellTap: (details){
  // // int selectedRowIndex = details.rowColumnIndex.rowIndex - 1;
  // // var row =
  // // invoiceDataSource.effectiveRows.elementAt(selectedRowIndex);
  // // Navigate.to(context, InvoiceDetails(invoiceData: invoiceListData[selectedRowIndex]));
  // // print("${row.getCells()[1].columnName}:${row.getCells()[1].value}");
  //
  // },
  // headerRowHeight: 65,
  //
  // // headerGridLineStrokeWidth: 0.0,
  //
  // frozenRowsCount: 0,
  // frozenColumnsCount: 0, source: priceListDataSource, // Number of frozen columns (sticky columns)
  // ),
  // ),
  /// old cross scroll
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
//   children: <Widget>[
//
//   Row(
//   mainAxisAlignment: MainAxisAlignment.start,
//   children: [
//
//   for (var i = 0; i < invoiceTitle.length; i++)
//   Container(
//   height: 60.sp,
//   width: i==0?50:100.sp,
//   // margin: EdgeInsets.only(right: 0),
//
//   alignment: Alignment.centerLeft,
//   padding: EdgeInsets.only(left: i==0?30.sp:10),
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
//   showPriceListData(context),
//   // SizedBox(
//   //   width: 1.sw,
//   //   child: FractionallySizedBox(
//   //     widthFactor: 1,
//   //     child: CustomButton(gapWidth: 10,textFontWeight: FontWeight.w400, imageWidth: 20.sp,imageHeight: 20,leadingSvgIcon: true,leadingIcon:(Assets.downloadIcon),onTap: () async {
//   //
//   //       // await PdfDownload().generatePdf(invoiceTitle,priceListData,PDFLayouts().showPdfPriceListData(priceListData),PDFLayouts().pdfTitlePriceList(invoiceTitle)).then((value) => null);
//   //
//   //
//   //     }, text: "Download",horizontalMargin: 20,),
//   //   ),
//   // )
//
//   ],
//   ),),
//
//   ),
  List<GridColumn> getColumns(BuildContext context) {
    return [
      GridColumn(
        columnName: '#',
        label: Container(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: AppText(
              '#',
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
        columnName: 'Item',
        label: Container(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: AppText(
              'Item',
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
        columnName: 'Specification',
        label: Container(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: AppText(
              'Specification',
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
        columnName: 'Pcs/Ctn',
        label: Container(
          //width: 200,
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: AppText(
              'Pcs/Ctn',
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
        columnName: 'Price',
        label: Container(
          //width: 200,
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: AppText(
              'Price',
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

  Widget showPriceListData(context, Map<String?, Map<String?, List<PriceListModel>>> data) {
    List<List<PriceListModel>> invoiceFinalData = [
      [],
      [],
      [],
      [],
    ];
    List<List<PriceListModel>> inData = [priceListData];

    List<Widget> row = [];


    for(var main in data.entries)
      {

        var country = main.key;
        print(main.key);
row.add(Column(children: [
  CustomSizedBox.height(10.sp),
  Container(
    alignment: Alignment.centerLeft,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          //color: AppColors.primaryColor,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 30.sp),
          width: 1.sw * 1.57,
          child: (AppText(country.toString(),
              style: Styles.circularStdRegular(context,
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 19.sp))),
        )
      ],
    ),
  )

],));
        for(var sub in main.value.entries)
          {

            var category= sub.key;
            print(sub.key);
            row.add(Column(children: [
              CustomSizedBox.height(10.sp),
              Container(
                height: 50,
                color: AppColors.lightInvoiceColor,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 30.sp),
                      width: 1.sw * 1.57,
                      child: (AppText(category.toString(),
                          style: Styles.circularStdRegular(context,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp))),
                    )
                  ],
                ),
              )

            ],));
            for (int i = 0; i < sub.value.length; i++)
              {
                List<Widget> textWidget = [];
                print(sub.value);


                textWidget.add(Container(
                    padding: EdgeInsets.only(left: 20.sp),
                    child: AppText(i.toString(),
                        style: Styles.circularStdRegular(context,
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.normal))));
                textWidget.add(SizedBox(
                  width: 20.sp,
                ));
                textWidget.add(Container(
                    width: 100.sp,
                    //   color: Colors.black,

                    child: AppText(sub.value[i].item.toString(),
                        maxLine: 4,
                        style: Styles.circularStdRegular(context,
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.normal))));
                textWidget.add(SizedBox(
                  width: 10.sp,
                ));
                textWidget.add(Container(
                  // padding: priceListData[i].item==""? EdgeInsets.only(left: 50.sp):null,
                  // height: 50.sp,
                  width: 100,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(right: 10.sp),

                  // margin: const EdgeInsets.only(left: 20),
                  child: sub.value[i].item == ""
                      ? Center(
                    child: SingleChildScrollView(
                      child: FittedBox(
                        child: AppText(priceListData[i].specification,
                            maxLine: 4,
                            style: Styles.circularStdRegular(context,
                                color: AppColors.blackColor,
                                fontWeight: FontWeight.normal)),
                      ),
                    ),
                  )
                      : Center(
                    child: SingleChildScrollView(
                      child: AppText(sub.value[i].specification,
                          maxLine: 4,
                          style: Styles.circularStdRegular(context,
                              color: sub.value[i].item == ""
                                  ? AppColors.primaryColor
                                  : AppColors.blackColor,
                              fontWeight:sub.value[i].item == ""
                                  ? FontWeight.w500
                                  : FontWeight.normal)),
                    ),
                  ),
                ));
                textWidget.add(SizedBox(
                  width: 10.sp,
                ));
                textWidget.add(Container(
                  // padding: priceListData[i].item==""? EdgeInsets.only(left: 50.sp):null,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(right: 30.sp),
                    child: AppText(sub.value[i].packing,
                        style: Styles.circularStdRegular(context,
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.normal))));
                textWidget.add(SizedBox(
                  width: 10.sp,
                ));
                textWidget.add(Container(
                  // padding: priceListData[i].item==""? EdgeInsets.only(left: 50.sp):null,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(right: 30.sp),
                    child: AppText(sub.value[i].ctn.toString(),
                        style: Styles.circularStdRegular(context,
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.normal))));
                textWidget.add(SizedBox(
                  width: 10.sp,
                ));
                textWidget.add(Container(
                  // padding: priceListData[i].item==""? EdgeInsets.only(left: 50.sp):null,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(right: 30.sp),
                    child: AppText(sub.value[i].price.toString(),
                        style: Styles.circularStdRegular(context,
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.normal))));

                row.add(Column(children: [
                 // CustomSizedBox.height(10.sp),
                  Container(
                    // width:priceListData[i].title!=null? 1.sw *1.15:null,

                    //  color: priceListData[i].title!=null?AppColors.lightInvoiceColor:AppColors.whiteColor,
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

                ],));


              }

          }

      }

    // for (int i = 0; i < priceListData.length; i++) {
    //   List<Widget> textWidget = [];
    //
    //   textWidget.add(Container(
    //       padding: EdgeInsets.only(left: 20.sp),
    //       child: AppText(i.toString(),
    //           style: Styles.circularStdRegular(context,
    //               color: AppColors.blackColor,
    //               fontWeight: FontWeight.normal))));
    //   textWidget.add(SizedBox(
    //     width: 20.sp,
    //   ));
    //   textWidget.add(Container(
    //       width: 100.sp,
    //       //   color: Colors.black,
    //
    //       child: AppText(priceListData[i].item.toString(),
    //           maxLine: 4,
    //           style: Styles.circularStdRegular(context,
    //               color: AppColors.blackColor,
    //               fontWeight: FontWeight.normal))));
    //   textWidget.add(SizedBox(
    //     width: 10.sp,
    //   ));
    //   textWidget.add(Container(
    //     // padding: priceListData[i].item==""? EdgeInsets.only(left: 50.sp):null,
    //     // height: 50.sp,
    //     width: 100,
    //     alignment: Alignment.centerLeft,
    //     padding: EdgeInsets.only(right: 10.sp),
    //
    //     // margin: const EdgeInsets.only(left: 20),
    //     child: priceListData[i].item == ""
    //         ? Center(
    //             child: SingleChildScrollView(
    //               child: FittedBox(
    //                 child: AppText(priceListData[i].specification,
    //                     maxLine: 4,
    //                     style: Styles.circularStdRegular(context,
    //                         color: AppColors.blackColor,
    //                         fontWeight: FontWeight.normal)),
    //               ),
    //             ),
    //           )
    //         : Center(
    //             child: SingleChildScrollView(
    //               child: AppText(priceListData[i].specification,
    //                   maxLine: 4,
    //                   style: Styles.circularStdRegular(context,
    //                       color: priceListData[i].item == ""
    //                           ? AppColors.primaryColor
    //                           : AppColors.blackColor,
    //                       fontWeight: priceListData[i].item == ""
    //                           ? FontWeight.w500
    //                           : FontWeight.normal)),
    //             ),
    //           ),
    //   ));
    //   textWidget.add(SizedBox(
    //     width: 10.sp,
    //   ));
    //   textWidget.add(Container(
    //       // padding: priceListData[i].item==""? EdgeInsets.only(left: 50.sp):null,
    //       alignment: Alignment.centerLeft,
    //       padding: EdgeInsets.only(right: 30.sp),
    //       child: AppText(priceListData[i].packing,
    //           style: Styles.circularStdRegular(context,
    //               color: AppColors.blackColor,
    //               fontWeight: FontWeight.normal))));
    //   textWidget.add(SizedBox(
    //     width: 10.sp,
    //   ));
    //   textWidget.add(Container(
    //       // padding: priceListData[i].item==""? EdgeInsets.only(left: 50.sp):null,
    //       alignment: Alignment.centerLeft,
    //       padding: EdgeInsets.only(right: 30.sp),
    //       child: AppText(priceListData[i].ctn.toString(),
    //           style: Styles.circularStdRegular(context,
    //               color: AppColors.blackColor,
    //               fontWeight: FontWeight.normal))));
    //   textWidget.add(SizedBox(
    //     width: 10.sp,
    //   ));
    //   textWidget.add(Container(
    //       // padding: priceListData[i].item==""? EdgeInsets.only(left: 50.sp):null,
    //       alignment: Alignment.centerLeft,
    //       padding: EdgeInsets.only(right: 30.sp),
    //       child: AppText(priceListData[i].price.toString(),
    //           style: Styles.circularStdRegular(context,
    //               color: AppColors.blackColor,
    //               fontWeight: FontWeight.normal))));
    //   row.add(Column(
    //     children: [
    //       CustomSizedBox.height(10.sp),
    //       priceListData[i].country != null
    //           ? Container(
    //               alignment: Alignment.centerLeft,
    //               child: Row(
    //                 mainAxisSize: MainAxisSize.min,
    //                 children: <Widget>[
    //                   Container(
    //                     alignment: Alignment.centerLeft,
    //                     padding: EdgeInsets.only(left: 30.sp),
    //                     width: 1.sw * 1.57,
    //                     child: (AppText(priceListData[i].country.toString(),
    //                         style: Styles.circularStdRegular(context,
    //                             color: AppColors.blackColor,
    //                             fontWeight: FontWeight.w500,
    //                             fontSize: 19.sp))),
    //                   )
    //                 ],
    //               ),
    //             )
    //           : priceListData[i].category != null
    //               ? Container(
    //                   height: 50,
    //                   color: AppColors.lightInvoiceColor,
    //                   child: Row(
    //                     mainAxisSize: MainAxisSize.min,
    //                     children: <Widget>[
    //                       Container(
    //                         alignment: Alignment.centerLeft,
    //                         padding: EdgeInsets.only(left: 30.sp),
    //                         width: 1.sw * 1.57,
    //                         child: (AppText(priceListData[i].category.toString(),
    //                             style: Styles.circularStdRegular(context,
    //                                 color: AppColors.primaryColor,
    //                                 fontWeight: FontWeight.w500,
    //                                 fontSize: 14.sp))),
    //                       )
    //                     ],
    //                   ),
    //                 )
    //               : Container(
    //                   // width:priceListData[i].title!=null? 1.sw *1.15:null,
    //
    //                   //  color: priceListData[i].title!=null?AppColors.lightInvoiceColor:AppColors.whiteColor,
    //                   child: Row(
    //                     mainAxisSize: MainAxisSize.min,
    //                     children: [
    //                       ...textWidget,
    //                     ],
    //                   ),
    //                 ),
    //       SizedBox(
    //         height: 20.sp,
    //       )
    //     ],
    //   ));
    // }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: row,
    );
  }

  Map<String?, Map<String?, List<PriceListModel>>> filterData(List<ProductApiModel> allProductsData) {
    List<PriceListModel> productsListDta =[];
    print(allProductsData.length.toString()+"productslength");
    for(var i in allProductsData)
      {
        productsListDta.add(PriceListModel(i.itemName, i.uGoodstype.toString(), i.uPacking.toString(),category: i.cat,country: getOriginString(i),ctn: i.defaultSalesUom,price: i.price));

      }

    Map<String?, Map<String?, List<PriceListModel>>> dto=groupedAndFilter(productsListDta);
print(dto);
return dto;
  }

  List<PriceListModel> filterDataForDownload(List<ProductApiModel> allProductsData) {
    List<PriceListModel> productsListDta =[];
    print(allProductsData.length.toString()+"productslength");
    for(var i in allProductsData)
    {
      productsListDta.add(PriceListModel(i.itemName, i.uGoodstype.toString(), i.uPacking.toString(),category: i.cat,country: getOriginString(i),ctn: i.defaultSalesUom,price: i.price));

    }


    return productsListDta;
  }

  Future<void> readData() async {
    print('calleddto');
    await Future.delayed(const Duration(seconds: 2));
    BlocProvider.of<AllProductsCubit>(context).getAllProducts();


  }


}
Map<String?, Map<String?, List<PriceListModel>>> groupedAndFilter(List<PriceListModel> products) {
  Map<String?, Map<String?, List<PriceListModel>>> productsByCountryAndCategory = {};
  //Map<String?, Map<String?, List<Product>>> productsByCountryAndCategory = {};

  for (var product in products) {
    var country = product.country;
    var category = product.category;

    productsByCountryAndCategory.putIfAbsent(country, () => {});

    if (productsByCountryAndCategory[country]![category] == null) {
      productsByCountryAndCategory[country]![category] = [];
    }

    productsByCountryAndCategory[country]![category]!.add(product);
  }



  return productsByCountryAndCategory;
}

class PriceListModel {
  final String? sNo;
  final String? item;
  final String specification;
  final String packing;
  final String? ctn;
  final String? price;
  final String? country;
  final String? category;

  PriceListModel(this.item, this.specification, this.packing,
      {this.country, this.category, this.sNo, this.ctn, this.price});
}

class PriceListDataSource extends DataGridSource {
  final BuildContext context;
  final List<PriceListModel> employees;
  PriceListDataSource({required this.employees, required this.context}) {
    _employees = List.generate(
        employees.length,
        (index) => DataGridRow(cells:
                // employees[index].title!= null?[
                //   DataGridCell<String>(columnName: 'Title', value: employees[index].title),
                //
                // ] : employees[index].country!= null?[
                //
                //   DataGridCell<String>(columnName: 'Country', value: employees[index].country),
                // ]:
                [
              DataGridCell<String>(
                  columnName: '#', value: employees[index].sNo.toString()),
              DataGridCell<String>(
                  columnName: 'Item', value: employees[index].item),
              DataGridCell<String>(
                  columnName: 'Specification',
                  value: employees[index].specification),
              DataGridCell<String>(
                  columnName: 'Packing', value: employees[index].packing),
              DataGridCell<String>(
                  columnName: 'Pcs/Ctn', value: employees[index].ctn),
              DataGridCell<String>(
                  columnName: 'Price', value: employees[index].price),
            ]));
  }

  List<DataGridRow> _employees = [];

  @override
  List<DataGridRow> get rows => _employees;
  int index = -1;

  Color getBackgroundColor(int index) {
    // int index = _employees.indexOf(rowsss) + 1;
    if (index > employees.length) {
      return AppColors.whiteColor;
    } else {
      if (employees[index].category != null) {
        return AppColors.lightInvoiceColor;
      } else {
        return AppColors.whiteColor;
      }
    }
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow rowsss) {
    if (index <= employees.length) {
      index++;
    }

    print(index);
    return DataGridRowAdapter(
        //  color: AppColors.primaryColor,

        cells: rowsss.getCells().map<Widget>((dataGridCell) {
      print(dataGridCell.columnName == "Item" && dataGridCell.value == null);
      return Container(
        // color: AppColors.primaryColor,
        //  width: 50,
        color: getBackgroundColor(index),
        alignment:
            employees[index].country != null || employees[index].category != null
                ? Alignment.centerLeft
                : (dataGridCell.columnName == '#')
                    ? Alignment.centerRight
                    : Alignment.center,
        padding: const EdgeInsets.all(10.0),
        child: dataGridCell.columnName == 'Item' && dataGridCell.value == ""
            ? AppText(employees[index].country.toString(),
                style: Styles.circularStdBold(context, fontSize: 19.sp))
            : dataGridCell.columnName == "Item" && dataGridCell.value == null
                ? AppText(employees[index].category.toString(),
                    style: Styles.circularStdBold(context,
                        color: AppColors.primaryColor, fontSize: 16.sp))
                : AppText(
                    dataGridCell.value.toString(),
                    style: Styles.circularStdRegular(context, fontSize: 15.sp),
                  ),
      );
    }).toList());
  }
}
