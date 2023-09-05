import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hbk/Application/Services/Navigation/navigation.dart';
import 'package:hbk/Data/DataSource/Resources/assets.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Resources/sized_box.dart';
import 'package:hbk/Data/DataSource/Resources/strings.dart';
import 'package:hbk/Data/DataSource/Resources/text_styles.dart';
import 'package:hbk/Domain/Models/Order/orders_model.dart';
import 'package:hbk/Domain/Models/orderModel.dart';
import 'package:hbk/Presentation/Common/app_text.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/Orders/order_details.dart';

class OrderCard extends StatelessWidget {
  final OrdersApiModel orderModel;
  final int index;

  const OrderCard({Key? key, required this.orderModel, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigate.to(
            context,
            OrderDetailsScreen(
              orderModel: orderModel,
              index: index,
            ));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.whiteColor,
              boxShadow: const [
                BoxShadow(
                  color: Color(0x0F000000),
                  blurRadius: 12,
                  offset: Offset(0, 6),
                  spreadRadius: 0,
                )
              ]),
          child: Padding(
            padding: EdgeInsets.only(right: 10.w, left: 10.w),
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
                            AppText('S# ${orderModel.docnum}',
                                style: Styles.circularStdMedium(context)),
                            CustomSizedBox.height(5.h),
                            AppText(
                                'Items ${orderModel.salesorderdetailas!.length}',
                                maxLine: 2,
                                style: Styles.circularStdMedium(context)),
                            CustomSizedBox.height(5.h),
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: 'Total Rs ',
                                  style: Styles.circularStdBold(context,
                                      fontSize: 16.sp)),
                              TextSpan(
                                  text: '${orderModel.docTotal}',
                                  style: Styles.circularStdMedium(context,
                                      fontSize: 20, color: Colors.blue)),
                            ])),
                            // AppText('Total: RS ${orderModel!.totalRS} ',
                            //     style: Styles.circularStdMedium(context,color: Colors.blue)),
                          ],
                        ),
                      ],
                    ),
                    CustomSizedBox.height(10.w),
                    Align(
                      child: Chip(
                        padding: EdgeInsets.symmetric(vertical: 2.sp),
                        side: const BorderSide(color: Colors.white),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r)),
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => _getStatusColor(orderModel.status!)),
                        label: AppText(
                          orderModel!.status.toString().split('.').last,
                          style: Styles.circularStdRegular(context,
                              color: AppColors.whiteColor, fontSize: 11.sp),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: AppText(AppStrings.pleaseCallMe,
                      style: Styles.circularStdMedium(context)),
                ),
                CustomSizedBox.height(10.h),
              ],
            ),
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
