import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hbk/Application/Services/Navigation/navigation.dart';
import 'package:hbk/Data/DataSource/Resources/assets.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Resources/imports.dart';
import 'package:hbk/Data/DataSource/Resources/utils.dart';
import 'package:hbk/Domain/Models/Order/orders_model.dart';
import 'package:hbk/Domain/Models/orderModel.dart';
import 'package:hbk/Presentation/Common/app_buttons.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/Orders/order_history.dart';

import 'order_card.dart';

class OrderTab extends StatelessWidget {
  final String orderStatus;
  final List<OrdersApiModel> orders;

  const OrderTab({super.key, required this.orderStatus, required this.orders});

  @override
  Widget build(BuildContext context) {
    List filteredOrders =
        orders.where((order) => order.status == orderStatus).toList();

    print(filteredOrders);

    return Stack(
      children: [
        filteredOrders.isNotEmpty
            ? ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: filteredOrders.length,
                itemBuilder: (context, index) {
                  OrdersApiModel order = filteredOrders[index];
                  return OrderCard(
                    orderModel: order,
                    index: index,
                  );
                },
              )
            : Center(
                child: AppText(
                  'No have any order',
                  style: Styles.circularStdMedium(context,
                      fontSize: 18, color: AppColors.primaryColor),
                ),
              ),
        // orderStatus == "Completed"
        //     ? Positioned(
        //         bottom: 10.h,
        //         left: 10.w,
        //         right: 10.w,
        //         child: CustomButton(
        //           borderRadius: 30.r,
        //           onTap: () {},
        //           text: 'Invoice',
        //           leadingIcon: Assets.iconPdf,
        //           leadingSvgIcon: true,
        //           iconColor: AppColors.whiteColor,
        //           gapWidth: 10.w,
        //         ),
        //       )
        //     : const SizedBox()
      ],
    );
  }
}
