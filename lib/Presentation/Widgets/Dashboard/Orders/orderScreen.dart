import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hbk/Data/DataSource/Resources/imports.dart';
import 'package:hbk/Domain/Models/orderModel.dart';
import 'package:hbk/Presentation/Common/Dialogs/loading_dialog.dart';
import 'Components/order_tab.dart';
import 'Controller/orders_cubit.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  void initState() {
    context.read<OrdersCubit>().getOrders();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            elevation: 8,
            shadowColor: Colors.black12,
            backgroundColor: AppColors.whiteColor,
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: AppText(
              'Orders',
              style: Styles.circularStdBold(context, fontSize: 20.sp),
            ),
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleIconButton(
                // isSvg:true,
                icon: Icons.arrow_back_ios,
                iconSize: 16,
                iconColor: AppColors.primaryColor,
                padding: EdgeInsets.only(left: 5.sp),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                width: 15.w,
                height: 15.h,
              ),
            ),
            bottom: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle:
                    Styles.circularStdMedium(context, color: Colors.black26),
                labelColor: AppColors.primaryColor,
                indicatorColor: AppColors.primaryColor,
                tabs: const [
                  Tab(
                    text: 'Pending',
                    height: 40,
                  ),
                  Tab(text: 'Active'),
                  Tab(text: 'Completed'),
                ]),
          ),
          body: BlocConsumer<OrdersCubit, OrdersState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              if (state is OrdersLoading) {
                return Center(child: LoadingDialog.loadingWidget());
              } else if (state is OrdersError) {
                return Center(
                  child: AppText(
                    state.error,
                    style: Styles.circularStdMedium(context, fontSize: 20),
                  ),
                );
              } else if (state is OrdersLoaded) {
                return TabBarView(children: [
                  OrderTab(
                    orderStatus: "Pending",
                    orders: state.model,
                  ),
                  OrderTab(orderStatus: "Active", orders: state.model),
                  OrderTab(
                    orderStatus: "Completed",
                    orders: state.model,
                  ),
                ]);
              } else if (state is OrdersError) {
                return Center(
                  child: AppText(
                    state.error,
                    style: Styles.circularStdMedium(context),
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          )),
    );
  }
}
