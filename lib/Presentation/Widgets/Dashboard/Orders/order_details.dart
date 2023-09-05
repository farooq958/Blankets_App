import 'package:hbk/Data/DataSource/Resources/imports.dart';
import 'package:hbk/Domain/Models/Order/orders_model.dart';
import 'package:hbk/Domain/Models/orderModel.dart';

class OrderDetailsScreen extends StatelessWidget {
  final OrdersApiModel? orderModel;
  final int index;
  const OrderDetailsScreen(
      {Key? key, required this.orderModel, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWithBackButton(
        title: "Order Details",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              Assets.bagIcon,
                              height: 80.h,
                              width: 100.w,
                              color: AppColors.primaryColor,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText('S# ${orderModel!.docnum}',
                                    style: Styles.circularStdMedium(context)),
                                CustomSizedBox.height(5.h),
                                AppText(
                                    'Items ${orderModel!.salesorderdetailas!.length}',
                                    style: Styles.circularStdMedium(context)),
                                CustomSizedBox.height(5.h),
                                RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                      text: 'Total Rs ',
                                      style: Styles.circularStdBold(context,
                                          fontSize: 16.sp)),
                                  TextSpan(
                                      text: '${orderModel!.docTotal}',
                                      style: Styles.circularStdBold(context,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 20,
                                          color: Colors.blue)),
                                ])),
                              ],
                            ),
                          ],
                        ),
                        CustomSizedBox.height(10.h),
                        Chip(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          side: const BorderSide(color: Colors.white),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r)),
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => _getStatusColor(orderModel!.status!)),
                          label: AppText(
                            orderModel!.status.toString().split('.').last,
                            style: Styles.circularStdRegular(context,
                                color: AppColors.whiteColor, fontSize: 10.sp),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.w),
                      child: AppText(AppStrings.pleaseCallMe,
                          style: Styles.circularStdMedium(context)),
                    ),
                    CustomSizedBox.height(15.h),
                    Padding(
                      padding: EdgeInsets.only(left: 8.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText('Item',
                              style: Styles.circularStdBold(context)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText('Quantity',
                                  style: Styles.circularStdBold(context)),
                              CustomSizedBox.width(40.w),
                              AppText('Amount',
                                  style: Styles.circularStdBold(context)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    CustomSizedBox.height(10.h),
                    SizedBox(
                      height: 350.h,
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: orderModel!.salesorderdetailas!.length,
                          itemBuilder: (context, index) {
                            final item = orderModel!.salesorderdetailas![index];
                            return OrderItemRow(
                              item: item,
                            );
                          }),
                    ),
                    CustomSizedBox.height(20.h),
                    RowWidget(
                      title: 'Total Items:',
                      amount: orderModel!.salesorderdetailas!.length.toString(),
                    ),
                    CustomSizedBox.height(10.h),
                    RowWidget(
                      title: 'Total amount',
                      amount: orderModel!.docTotal,
                      isRs: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    if (status == 'Active') {
      return AppColors.primaryColor;
    } else if (status == 'Completed') {
      return Colors.green;
    } else {
      return Colors.yellow.shade700;
    }
  }
}
