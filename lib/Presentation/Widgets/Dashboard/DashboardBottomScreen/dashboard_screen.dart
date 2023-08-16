import 'package:hbk/Data/DataSource/Resources/imports.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/DashboardBottomScreen/Components/bottom_cards.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/DashboardBottomScreen/Components/chart_dashboard.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/DashboardBottomScreen/Components/custom_card.dart';

import 'Components/info_card.dart';

class DashboardBottom extends StatefulWidget {
  final bool? isGuest;
  const DashboardBottom({super.key,this.isGuest});

  @override
  State<DashboardBottom> createState() => _DashboardBottomState();
}

class _DashboardBottomState extends State<DashboardBottom> {

  @override
  void initState() {
    // TODO: implement initState

    if(widget.isGuest==true){
      CustomDialog.dialog(context, Column());
    }

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomSizedBox.height(10),

              ///Top Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  AppText(
                    AppStrings.accountBalance,
                    style: Styles.circularStdBold(context,
                        fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: 'Rs ',
                        style:
                            Styles.circularStdBold(context, fontSize: 16.sp)),
                    TextSpan(
                        text: '50,490 ',
                        style: Styles.circularStdBold(context,
                            fontWeight: FontWeight.w900, fontSize: 20)),
                  ]))
                ],
              ),
              CustomSizedBox.height(20),

              ///info widget
              SizedBox(
                // color: Colors.red,
                height: 65.sp,
                width: 1.sw / 1.15,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CustomInfoWidget(
                        nameInfo: Utils.customInfoData[index].amount.toString(),
                        nameInfoValue:
                            Utils.customInfoData[index].name.toString(),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 20.sp,
                      );
                    },
                    itemCount: Utils.customInfoData.length),
              ),

              ///Chart
              FractionallySizedBox(
                widthFactor: 1.07,
                child: VerticalBarChart(),
              ),

              ///row
              SizedBox(
                // color: Colors.red,
                height: 65.sp,
                width: 1.sw / 1.15,
                child: ListView.separated(
                    //  shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CustomCard(
                          name: Utils.customCardData[index].name.toString(),
                          amount:
                              Utils.customCardData[index].amount.toString());
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 5.sp,
                      );
                    },
                    itemCount: Utils.customCardData.length),
              ),
              CustomSizedBox.height(10),
              SizedBox(
                // color: Colors.red,
                height: 65.sp,
                width: 1.sw / 1.15,
                child: ListView.separated(
                    // shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CustomCard(
                          name: Utils.customCardData1[index].name.toString(),
                          amount:
                              Utils.customCardData1[index].amount.toString());
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 5.sp,
                      );
                    },
                    itemCount: Utils.customCardData1.length),
              ),
              CustomSizedBox.height(10),
              SizedBox(
                // color: Colors.red,
                height: 100.sp,
                width: 1.sw,
                child: ListView.separated(
                    //  shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return  BottomCards(
                          imageAsset: Utils.bottomCardData1[index].icon!,
                          mainStatus: Utils.bottomCardData1[index].title!,
                          statusValue: Utils.bottomCardData1[index].status!);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 5.sp,
                      );
                    },
                    itemCount: Utils.bottomCardData1.length),
              ),
              CustomSizedBox.height(10),
              SizedBox(
                // color: Colors.red,
                height: 100.sp,
                width: 1.sw,
                child: ListView.separated(
                    // shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return BottomCards(
                          imageAsset: Utils.bottomCardData2[index].icon!,
                          mainStatus: Utils.bottomCardData2[index].title!,
                          statusValue: Utils.bottomCardData2[index].status!);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 5.sp,
                      );
                    },
                    itemCount: Utils.bottomCardData2.length),
              ),
              CustomSizedBox.height(10),
              SizedBox(
                // color: Colors.red,
                height: 100.sp,
                width: 1.sw,
                child: ListView.separated(
                    //shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return BottomCards(
                          imageAsset: Utils.bottomCardData3[index].icon!,
                          mainStatus: Utils.bottomCardData3[index].title!,
                          statusValue: Utils.bottomCardData3[index].status!);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 5.sp,
                      );
                    },
                    itemCount: Utils.bottomCardData3.length),
              ),
              CustomSizedBox.height(10),

              // SizedBox(
              //   height: 300,
              //   width: 1.sw,
              //   child: GridView.builder(
              //
              //     shrinkWrap: true,
              //     scrollDirection: Axis.horizontal,
              //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: 2, // Display two elements per row
              //       mainAxisSpacing: 5.sp,
              //       crossAxisSpacing: 10.sp// Horizontal spacing between items
              //     ),
              //     itemBuilder: (context, index) {
              //       return const BottomCards(
              //         imageAsset: Assets.rewardIcon, // Your image asset
              //         mainStatus: "Running", // Your main status text
              //         statusValue: "blue", // Your status value
              //       );
              //     },
              //     itemCount: 4, // Total number of items (2 elements in 2 rows)
              //   ),
              // ),
              // Container(
              //   // color: Colors.red,
              //   height: 65.sp,
              //   width: 1.sw/1.15,
              //
              // child: Row(
              //   children: <Widget>[
              //
              //
              //     for (var i in Utils.customCardData1)
              //       Column(
              //         children: [
              //           CustomCard(name: i.name.toString(), amount: i.amount.toString()),
              //           SizedBox(width: 8.sp), // Add spacing between CustomCard widgets
              //         ],
              //       )
              //
              //
              //   ],
              // ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
