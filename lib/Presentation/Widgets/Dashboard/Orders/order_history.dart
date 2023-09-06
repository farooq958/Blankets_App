import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hbk/Data/DataSource/Resources/imports.dart';
import 'package:hbk/Data/DataSource/Resources/utils.dart';
import 'package:hbk/Domain/Models/Order/orders_model.dart';
import 'package:hbk/Domain/Models/orderModel.dart';
import 'package:hbk/Presentation/Common/custom_appbar_with_back_button.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/Orders/Controller/orders_cubit.dart';

import '../../../Common/Dialogs/loading_dialog.dart';
import 'Components/order_card.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  void initState() {
    context.read<OrdersCubit>().getOrders();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWithBackButton(
        title: 'Order History',
      ),
      body: BlocConsumer<OrdersCubit, OrdersState>(listener: (context, state) {
        // TODO: implement listener
      }, builder: (context, state) {
        if (state is OrdersLoading) {
          return Center(child: LoadingDialog.loadingWidget());
        } else if (state is OrdersLoaded) {
          List filteredOrders = state.model
              .where((order) => order.status == 'Completed')
              .toList();
          return ListView.builder(
            itemCount: filteredOrders.length,
            itemBuilder: (context, index) {
              OrdersApiModel order = filteredOrders[index];
              return OrderCard(
                orderModel: order,
                index: index,
              );
            },
          );
        } else if (state is OrdersError) {
          return AppText(
            state.error,
            style: Styles.circularStdMedium(context),
          );
        } else {
          return SizedBox();
        }
      }),
    );
  }
}
