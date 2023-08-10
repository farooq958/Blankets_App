import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Resources/sized_box.dart';
import 'package:hbk/Data/DataSource/Resources/strings.dart';
import 'package:hbk/Data/DataSource/Resources/text_styles.dart';
import 'package:hbk/Data/DataSource/Resources/utils.dart';

import 'package:hbk/Domain/Models/orderModel.dart';
import 'package:hbk/Presentation/Common/app_text.dart';
import 'package:hbk/Presentation/Common/custom_appbar_with_back_button.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/Orders/Components/order_item_row.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/Orders/Components/row_widget.dart';

class OrderDetailsScreen extends StatelessWidget {
  final OrderModel? orderModel;

  const OrderDetailsScreen({Key? key, required this.orderModel})
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
                              orderModel!.image,
                              height: 80.h,
                              width: 100.w,
                              color: AppColors.primaryColor,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText('S# ${orderModel!.orderNo}',
                                    style: Styles.circularStdMedium(context)),
                                AppText('Items ${orderModel!.noOfItems}',
                                    style: Styles.circularStdMedium(context)),
                                AppText('Total: RS ${orderModel!.totalRS} ',
                                    style: Styles.circularStdMedium(context)),
                              ],
                            ),
                          ],
                        ),
                        CustomSizedBox.height(10.w),
                        Chip(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r)),
                          color: MaterialStateColor.resolveWith((states) =>
                              _getStatusColor(orderModel!.orderStatus)),
                          label: AppText(
                            orderModel!.orderStatus
                                .toString()
                                .split('.')
                                .last,
                            style: Styles.circularStdMedium(context,
                                color: AppColors.whiteColor),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: 8.w),
                      child: AppText(AppStrings.pleaseCallMe,
                          style: Styles.circularStdMedium(context)),
                    ),
                    CustomSizedBox.height(15.h),
                    Padding(
                      padding:  EdgeInsets.only(left: 8.w),
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
                          scrollDirection: Axis.vertical,
                          itemCount: Utils.orderItems.length,
                          itemBuilder: (context, index) {
                            final item = Utils.orderItems[index];
                            return OrderItemRow(
                              item: item,
                            );
                          }),
                    ),
                    CustomSizedBox.height(20.h),
                    const RowWidget(
                      title: 'Total Items:',
                      amount: 07,
                    ),
                    CustomSizedBox.height(10.h),
                    const RowWidget(
                      title: 'Total amount',
                      amount: 50490,
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

  Color _getStatusColor(OrderStatus status) {
    if (status == OrderStatus.Active) {
      return AppColors.primaryColor;
    } else if (status == OrderStatus.Completed) {
      return Colors.green;
    } else {
      return Colors.yellow.shade700;
    }
  }
}
