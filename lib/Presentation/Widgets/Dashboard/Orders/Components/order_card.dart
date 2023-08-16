import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hbk/Application/Services/Navigation/navigation.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Resources/sized_box.dart';
import 'package:hbk/Data/DataSource/Resources/strings.dart';
import 'package:hbk/Data/DataSource/Resources/text_styles.dart';
import 'package:hbk/Domain/Models/orderModel.dart';
import 'package:hbk/Presentation/Common/app_text.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/Orders/order_details.dart';

class OrderCard extends StatelessWidget {
  final OrderModel? orderModel;

  const OrderCard({Key? key, required this.orderModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigate.to(
            context,
            OrderDetailsScreen(
              orderModel: orderModel!,
            ));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          borderRadius: BorderRadius.circular(20),
          elevation: 5,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
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
                              CustomSizedBox.height(5.h),
                              AppText('Items ${orderModel!.noOfItems}',
                                  style: Styles.circularStdMedium(context)),
                              CustomSizedBox.height(5.h),
                              RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: 'Total Rs ',
                                        style: Styles.circularStdBold(context, fontSize: 16.sp)),

                                    TextSpan(
                                        text: '50,490 ',
                                        style: Styles.circularStdBold(context,
                                            fontWeight: FontWeight.w900, fontSize: 20,color: Colors.blue)),
                                  ])),
                              // AppText('Total: RS ${orderModel!.totalRS} ',
                              //     style: Styles.circularStdMedium(context,color: Colors.blue)),
                            ],
                          ),
                        ],
                      ),
                      CustomSizedBox.height(10.w),
                      Chip(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r)),
                        backgroundColor: MaterialStateColor.resolveWith((states) =>
                            _getStatusColor(orderModel!.orderStatus)),
                        label: AppText(
                          orderModel!.orderStatus.toString().split('.').last,
                          style: Styles.circularStdMedium(context,
                              color: AppColors.whiteColor),
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
