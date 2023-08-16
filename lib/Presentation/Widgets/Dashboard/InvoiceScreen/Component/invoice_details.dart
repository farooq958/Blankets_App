import 'package:cross_scroll/cross_scroll.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Resources/imports.dart';
import 'package:hbk/Presentation/Common/custom_appbar_with_back_button.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/InvoiceScreen/invoice_screen.dart';

import 'invoice_tile.dart';

class InvoiceDetails extends StatelessWidget {
   InvoiceDetails({super.key, required InvoiceModel invoiceData});

  final List<InvoiceDetailModel> rewardListData = [

    InvoiceDetailModel(productName: 'Belpla Teenagers 1 Ply Single Bed Blanket',type: '160 x 220 CMS',packing: 'Rs 1,754,000',ctn: 'Rs 1,754,000',pcs: 'Rs 1,754,000',unitPrice: 'Rs 1,754,000',totalPrice: 'Rs 1,754,00'),
    InvoiceDetailModel(productName: 'Belpla Teenagers 1 Ply Single Bed Blanket23',type: 'l160 x 220 CMSver',packing: 'Rs 1,754,000',ctn: 'Rs 1,754,000',pcs: 'Rs 1,754,000',unitPrice: 'Rs 1,754,000',totalPrice: 'Rs 1,754,00'),
    InvoiceDetailModel(productName: '01/05/2023',type: 'l160 x 220 CMS',packing: 'Rs 1,754,000',ctn: 'Rs 1,754,000',pcs: 'Rs 1,754,000',unitPrice: 'Rs 1,754,000',totalPrice: 'Rs 1,754,00'),InvoiceDetailModel(productName: '01/05/ - 06/06/2023',type: 'loyal silver',packing: 'Rs 1,754,000',ctn: 'Rs 1,754,000',pcs: 'Rs 1,754,000',unitPrice: 'Rs 1,754,000',totalPrice: 'Rs 1,754,00'),
    InvoiceDetailModel(productName: '01/05/ - 06/06/2023',type: 'loyal silver',packing: 'Rs 1,754,000',ctn: 'Rs 1,754,000',pcs: 'Rs 1,754,000',unitPrice: 'Rs 1,754,000',totalPrice: 'Rs 1,754,00'),
    InvoiceDetailModel(productName: '01/05/ - 06/06/2023',type: 'loyal silver',packing: 'Rs 1,754,000',ctn: 'Rs 1,754,000',pcs: 'Rs 1,754,000',unitPrice: 'Rs 1,754,000',totalPrice: 'Rs 1,754,00'),
    InvoiceDetailModel(productName: '01/05/ - 06/06/2023',type: 'loyal silver',packing: 'Rs 1,754,000',ctn: 'Rs 1,754,000',pcs: 'Rs 1,754,000',unitPrice: 'Rs 1,754,000',totalPrice: 'Rs 1,754,00'),
    InvoiceDetailModel(productName: '01/05/ - 06/06/2023',type: 'loyal silver',packing: 'Rs 1,754,000',ctn: 'Rs 1,754,000',pcs: 'Rs 1,754,000',unitPrice: 'Rs 1,754,000',totalPrice: 'Rs 1,754,00'),
    InvoiceDetailModel(productName: '01/05/ - 06/06/2023',type: 'loyal silver',packing: 'Rs 1,754,000',ctn: 'Rs 1,754,000',pcs: 'Rs 1,754,000',unitPrice: 'Rs 1,754,000',totalPrice: 'Rs 1,754,00'),
    InvoiceDetailModel(productName: '01/05/ - 06/06/2023',type: 'loyal silver',packing: 'Rs 1,754,000',ctn: 'Rs 1,754,000',pcs: 'Rs 1,754,000',unitPrice: 'Rs 1,754,000',totalPrice: 'Rs 1,754,00'),


    // Add more data for other months
  ];

   //final ScrollController _innerScrollController = ScrollController();
  final List<String> invoiceTitle=["S#","Product Name","Type","Packing","Ctn",'Pcs','Unit Price','Total Price'];

  @override
  Widget build(BuildContext context) {
    return    Scaffold(
      appBar: const CustomAppBarWithBackButton(title: 'Invoice detail',iconColor: AppColors.primaryColor,iconData: Icons.arrow_back_ios,padding: EdgeInsets.only(left: 5),iconSize: 15,),
      backgroundColor: AppColors.whiteColor,

      body: NestedScrollView(
        //controller: _innerScrollController,
        headerSliverBuilder: (BuildContext context,
            bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              flexibleSpace:    mainColumn(context),
              backgroundColor: AppColors.whiteColor,
              expandedHeight: MediaQuery
                  .of(context)
                  .size
                  .height * 0.56,
            ),
          ];
        },
        body:     dataTableData(context),
      ),

    );
  }

  Widget mainColumn(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[

          Container(width: 1.sw,height: 60.h,

            padding: EdgeInsets.only(left: 20.sp),
            color: AppColors.lightInvoiceColor,child: Align(

              alignment: Alignment.centerLeft,
              child: AppText('Customer details',style: Styles.circularStdBold(context,fontSize: 16,fontWeight: FontWeight.w600),)),),
          CustomSizedBox.height(10),

        invoiceDetailTile(context,text1: 'Customer name',text2: 'Shama Cloth House',text3: 'Contact person',text4: 'Ahmad Ali / Rizwan'),

          CustomSizedBox.height(20),
          invoiceDetailTile(context,text1: 'Phone number',text2: '0300-57106687',text3: 'Address',text4: 'Shama Cloth House Shaheen Market Bank Road Mardan, Pakistan'),

          CustomSizedBox.height(20),
          Container(width: 1.sw,height: 60.h,

            padding: EdgeInsets.only(left: 20.sp),
            color: AppColors.lightInvoiceColor,child: Align(

                alignment: Alignment.centerLeft,
                child: AppText('Invoice',style: Styles.circularStdBold(context,fontSize: 16,fontWeight: FontWeight.w600),)),),
          CustomSizedBox.height(12),
          invoiceDetailTile(context,text1: 'Invoice No',text2: '6874',text3: 'Created by',text4: 'Ahmad Ali / Rizwan'),
          CustomSizedBox.height(12),
          invoiceDetailTile(context,text1: 'Status',text2: 'Gold',text3: 'Date',text4: '12 Jan,2023'),
          CustomSizedBox.height(20),
          invoiceDetailTile(context,text1: 'Sale Person',text2: 'Ahmed Ali'),
          CustomSizedBox.height(20),
         ///this should not be in sliver app bar





        ],
      ),
    );
  }

  Widget dataTableData(BuildContext context) {
    return Column(
      children: [
        CustomSizedBox.height(15),
        Expanded(
            child: CrossScroll(
              verticalBar: const CrossScrollBar(thickness: 0),
horizontalBar: const CrossScrollBar(thickness: 2),
             // verticalScrollController: _innerScrollController,
              horizontalScroll: CrossScrollDesign(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(
                    left: 1.0,
                    right: 9.0,
                  )),
              verticalScroll: CrossScrollDesign(
                  physics: const BouncingScrollPhysics(),
                  padding:
                  const EdgeInsets.only(top: 10, bottom: 70))
,

              child: Container(
                // padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[


                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        for (var i = 0; i < invoiceTitle.length; i++)
                          Container(
                            height: 60.sp,
                            width: i==0? 40.sp:180.sp,
                             //padding: EdgeInsets.only(right: 30),

                            alignment: Alignment.center,
                            padding: EdgeInsets.only(left: 10.sp,),
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
                    Padding(

                        padding: EdgeInsets.only(right: 0.sp),
                        child: showInvoiceDetailListData(context)),


                  ],
                ),),

            ),
          ),
        SizedBox(
          width: 1.sw,
          child: FractionallySizedBox(
            widthFactor: 1,
            child: CustomButton(gapWidth: 10,textFontWeight: FontWeight.w400, imageWidth: 20.sp,imageHeight: 20,leadingSvgIcon: true,leadingIcon:(Assets.downloadIcon),onTap: (){}, text: "Download",horizontalMargin: 20,),
          ),
        ),
        CustomSizedBox.height(10)
      ],
    );
  }

  Padding invoiceDetailTile(BuildContext context,{String? text1,String? text2,String? text3,String? text4,}) {
    return Padding(
          padding:  EdgeInsets.only(left: 20.0.sp),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(text1??'', style: Styles.circularStdBold(context,fontWeight: FontWeight.w500,fontSize: 14.sp)),
                    CustomSizedBox.height(10),
                    AppText(text2??'',
                        maxLine: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.circularStdBold(context,fontWeight: FontWeight.w600,fontSize: 15.sp)),
                    //SizedBox(width: 20,)


                  ],
                ),
              ),
              CustomSizedBox.width(10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(text3??'', style: Styles.circularStdBold(context,fontWeight: FontWeight.w500,fontSize: 14.sp)),
                    CustomSizedBox.height(10),
                    AppText(text4??'',
                        maxLine: 4,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.circularStdBold(context,fontWeight: FontWeight.w600,fontSize: 15.sp)),
                    //SizedBox(width: 20,)


                  ],
                ),
              )

            ],
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

     for(int i=0;i<rewardListData.length;i++){
       List<Widget> textWidget = [];

       textWidget.add(Container(
           alignment: Alignment.centerLeft,
           //  width: 130,
           width: 40,
           padding: const EdgeInsets.only(right: 10),
           // color: Colors.red,
            //margin: EdgeInsets.only(right: 200.sp),
           child: AppText(i.toString(), style: Styles.circularStdRegular(context,color: AppColors.blackColor,fontWeight: FontWeight.normal))));
       //textWidget.add(SizedBox(width: 10.sp,));
       //  textWidget.add(SizedBox(width: 10.sp,));
     //  textWidget.add(SizedBox(width: 40.sp,));
       textWidget.add(Container(
         width: 180.sp,
         //   color: Colors.black,
           alignment: Alignment.centerLeft,
           padding: const EdgeInsets.only(left: 10),
           //  padding: EdgeInsets.only(right: 100.sp),

           child: AppText(rewardListData[i].productName.toString(),
                maxLine: 4,
               style: Styles.circularStdRegular(context,color:  AppColors.blackColor,fontWeight: FontWeight.normal))));
       textWidget.add(SizedBox(width: 5.sp,));
   //    textWidget.add(SizedBox(width: 40.sp,));
       textWidget.add(Container(
         // padding: priceListData[i].item==""? EdgeInsets.only(left: 50.sp):null,
         // height: 50.sp,
          width: 180,
         alignment: Alignment.centerLeft,
         // padding: EdgeInsets.only(right: 10.sp),

         // margin: const EdgeInsets.only(left: 20),
         child:  Center(
           child: SingleChildScrollView(
             child: AppText(rewardListData[i].type.toString(),
                 style: Styles.circularStdRegular(context,color: AppColors.blackColor,fontWeight:  FontWeight.normal)),
           ),
         ),
       ));
//       textWidget.add(SizedBox(width: 40.sp,));
       textWidget.add(SizedBox(width: 10.sp,));

       textWidget.add(Container(
           padding: const EdgeInsets.only(left: 10),
         // padding: priceListData[i].item==""? EdgeInsets.only(left: 50.sp):null,
           alignment: Alignment.centerLeft, width: 180,
           //padding: const EdgeInsets.only(right: 60),
           //padding: EdgeInsets.only(right: 30.sp),
           child: AppText(rewardListData[i].packing.toString(), style: Styles.circularStdRegular(context,color:AppColors.blackColor,fontWeight: FontWeight.normal))));
       textWidget.add(SizedBox(width: 10.sp,));
      // textWidget.add(SizedBox(width: 40.sp,));
       textWidget.add(Container(
         // padding: priceListData[i].item==""? EdgeInsets.only(left: 50.sp):null,
           alignment: Alignment.centerLeft,
           width: 180,
           //padding: EdgeInsets.only(right: 30.sp),
           child: AppText(rewardListData[i].ctn.toString(), style: Styles.circularStdRegular(context,color:AppColors.blackColor,fontWeight: FontWeight.normal))));
       textWidget.add(SizedBox(width: 10.sp,));
    //   textWidget.add(SizedBox(width: 40.sp,));
       textWidget.add(Container(
           padding: const EdgeInsets.only(right: 40),
         // padding: priceListData[i].item==""? EdgeInsets.only(left: 50.sp):null,
           alignment: Alignment.centerLeft,
          // margin: EdgeInsets.only(left: 10.sp),
           //padding: EdgeInsets.only(right: 30.sp),
           child: AppText(rewardListData[i].pcs.toString(), style: Styles.circularStdRegular(context,color:AppColors.blackColor,fontWeight: FontWeight.normal))));
       textWidget.add(SizedBox(width: 30.sp,));
      // textWidget.add(SizedBox(width: 40.sp,));
       textWidget.add(Container(
         // padding: priceListData[i].item==""? EdgeInsets.only(left: 50.sp):null,
           alignment: Alignment.center,
           margin: EdgeInsets.only(left: 10.sp),
           //padding: EdgeInsets.only(right: 30.sp),
           child: AppText(rewardListData[i].unitPrice.toString(), style: Styles.circularStdRegular(context,color:AppColors.blackColor,fontWeight: FontWeight.normal))));
       textWidget.add(SizedBox(width: 30.sp,));
     //  textWidget.add(SizedBox(width: 40.sp,));
       textWidget.add(Container(
         width: 180,
         // padding: priceListData[i].item==""? EdgeInsets.only(left: 50.sp):null,
           alignment: Alignment.centerLeft,
          //margin: EdgeInsets.only(left: 10.sp),
           padding: EdgeInsets.only(left: 90.sp),
           child: AppText(rewardListData[i].totalPrice.toString(), style: Styles.circularStdRegular(context,color:AppColors.blackColor,fontWeight: FontWeight.normal))));
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
           SizedBox(height: 20.sp,)
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
  final String? unitPrice;
  final String? totalPrice;

  InvoiceDetailModel(   {this.productName,this.type, this.packing, this.ctn, this.pcs, this.unitPrice,this.totalPrice});
}
