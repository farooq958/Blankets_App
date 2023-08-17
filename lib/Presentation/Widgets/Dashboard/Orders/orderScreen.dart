
import 'package:hbk/Data/DataSource/Resources/imports.dart';
import 'Components/order_tab.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
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
            title: AppText('Orders',style: Styles.circularStdBold(context,fontSize: 20.sp),),
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: CircleIconButton(
                  isSvg:true,
                  icon: Icons.arrow_back,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  width: 15.w,
                  height: 15.h,
                ),
              ),
            ),
            bottom:   TabBar(
              labelStyle: Styles.circularStdMedium(context,color: Colors.black26),
              labelColor: AppColors.primaryColor,
              indicatorColor: AppColors.primaryColor,
                tabs: const[
              Tab(text: 'Active'),
              Tab(text: 'Pending'),
              Tab(text: 'Completed'),
            ]),
          ),
          body: const TabBarView(children: [
            OrderTab(orderStatus: OrderStatus.Active),
            OrderTab(orderStatus: OrderStatus.Pending),
            OrderTab(orderStatus: OrderStatus.Completed,),
          ])),
    );
  }
}


