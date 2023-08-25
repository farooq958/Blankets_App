import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hbk/Application/Services/Navigation/navigation.dart';
import 'package:hbk/Data/DataSource/Resources/assets.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Resources/utils.dart';
import 'package:hbk/Domain/Models/orderModel.dart';
import 'package:hbk/Presentation/Common/app_buttons.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/Orders/order_history.dart';

import 'order_card.dart';

class OrderTab extends StatelessWidget {
  final OrderStatus orderStatus;

  const OrderTab({super.key, required this.orderStatus});

  @override
  Widget build(BuildContext context) {
    List<OrderModel> filteredOrders = Utils.orders
        .where((order) => order.orderStatus == orderStatus)
        .toList();

    return Stack(
      children: [
        ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: filteredOrders.length,
          itemBuilder: (context, index) {
            OrderModel order = filteredOrders[index];
            return OrderCard(
              orderModel: order,
            );
          },
        ),
        orderStatus == OrderStatus.Completed
            ? Positioned(
                bottom: 10.h,
                left: 10.w,
                right: 10.w,
                child: CustomButton(
                  borderRadius: 30.r,
                  onTap: () {},
                  text: 'Invoice',
                  leadingIcon: Assets.iconPdf,
                  leadingSvgIcon: true,
                  iconColor: AppColors.whiteColor,
                  gapWidth: 10.w,
                ),
              )
            : const SizedBox()
      ],
    );
  }
}
