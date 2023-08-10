import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hbk/Data/DataSource/Resources/colors_pallete.dart';
import 'package:hbk/Data/DataSource/Resources/text_styles.dart';
import 'package:hbk/Domain/Models/orderModel.dart';
import 'package:hbk/Presentation/Common/app_text.dart';
import 'package:hbk/Presentation/Common/circle_icon_button.dart';
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
              child: CircleIconButton(
                icon: Icons.arrow_back,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                width: 10.w,
                height: 10.h,
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


