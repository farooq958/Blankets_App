import 'package:flutter/material.dart';
import 'package:hbk/Data/DataSource/Resources/utils.dart';
import 'package:hbk/Domain/Models/orderModel.dart';
import 'package:hbk/Presentation/Common/custom_appbar_with_back_button.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/Orders/Components/order_card.dart';

class OrderHistory extends StatefulWidget {
  final OrderStatus? orderStatus;

  const OrderHistory({Key? key, this.orderStatus}) : super(key: key);

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  Widget build(BuildContext context) {
    List<OrderModel> filteredOrders = Utils.orders
        .where((order) => order.orderStatus == widget.orderStatus!)
        .toList();

    return Scaffold(
      appBar: const CustomAppBarWithBackButton(
        title: 'Order History',
      ),
      body: ListView.builder(
        itemCount: filteredOrders.length,
        itemBuilder: (context, index) {
          OrderModel order = filteredOrders[index];
          return OrderCard(
            orderModel: order,
          );
        },
      ),
    );
  }
}
