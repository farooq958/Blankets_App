import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hbk/Data/AppData/app_preferences.dart';
import 'package:hbk/Data/DataSource/Resources/imports.dart';
import 'package:hbk/Presentation/Common/Dialogs/custom_login_dialog.dart';
import 'package:hbk/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/DashboardBottomScreen/Components/bottom_cards.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/DashboardBottomScreen/Components/chart_dashboard.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/DashboardBottomScreen/Components/custom_card.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/DashboardBottomScreen/Controller/dashboard_bottom_cubit.dart';

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

    // if(widget.isGuest==true){
    //   CustomDialog.dialog(context, Column());
    // }
    //
    context.read<DashboardBottomCubit>().getDashboardData();

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
                        text: SharedPrefs.userData!.balance.toString(),
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
              ///
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  // color: Colors.red,
                  height: 150.sp,
                  width: 1.sw / 1,
                  child: Wrap(
                    spacing: 5.sp,
                    runSpacing: 10.sp,
                    alignment: WrapAlignment.start,
                    children: List.generate(Utils.customCardData.length, (index) {
                      return SizedBox(
                        width: (1.sw / 1 - 10.sp) / 3, // Adjust width to fit three items
                        child: CustomCard(
                          name: Utils.customCardData[index].name.toString(),
                          amount: Utils.customCardData[index].amount.toString(),
                        ),
                      );
                    }),
                  ),
                ),
              )
,

              // SizedBox(
              //   // color: Colors.red,
              //   height: 65.sp,
              //   width: 1.sw / 1.15,
              //   child: ListView.separated(
              //       //  shrinkWrap: true,
              //       scrollDirection: Axis.horizontal,
              //       itemBuilder: (context, index) {
              //         return CustomCard(
              //             name: Utils.customCardData[index].name.toString(),
              //             amount:
              //                 Utils.customCardData[index].amount.toString());
              //       },
              //       separatorBuilder: (context, index) {
              //         return SizedBox(
              //           width: 5.sp,
              //         );
              //       },
              //       itemCount: Utils.customCardData.length),
              // ),
              // CustomSizedBox.height(10),
              // SizedBox(
              //   // color: Colors.red,
              //   height: 65.sp,
              //   width: 1.sw / 1.15,
              //   child: ListView.separated(
              //       // shrinkWrap: true,
              //       scrollDirection: Axis.horizontal,
              //       itemBuilder: (context, index) {
              //         return CustomCard(
              //             name: Utils.customCardData1[index].name.toString(),
              //             amount:
              //                 Utils.customCardData1[index].amount.toString());
              //       },
              //       separatorBuilder: (context, index) {
              //         return SizedBox(
              //           width: 5.sp,
              //         );
              //       },
              //       itemCount: Utils.customCardData1.length),
              // ),
              CustomSizedBox.height(10),
              BlocConsumer<DashboardBottomCubit, DashboardBottomState>(
  listener: (context, state) {
    if(state is DashboardLoading)
      {
        LoadingDialog.showLoadingDialog(context);
      }
    if(state is DashboardLoaded)
      {
        Navigate.pop(context);
      }
    if(state is DashboardLogOutState)
      {
        Navigate.pop(context);
        showLoginDialog(context,fromSession: true);
      }
    if(state is DashboardError)
      {
        Navigate.pop(context);
        WidgetFunctions.instance.snackBar(context,text: state.error);

      }
    // TODO: implement listener
  },
  builder: (context, state) {
    if(state is DashboardLoaded) {
      return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: SizedBox(
                  // color: Colors.red,
                  height: (84*3).sp,
                  width: 1.sw,
                  child: Wrap(
                    spacing: 5.sp,
                    runSpacing: 5.sp,
                    alignment: WrapAlignment.start,
                    children: List.generate(Utils.bottomCardData1.length, (index) {
                      return SizedBox(
                        width: (1.sw - 5.sp) / 2, // Adjust width to fit two items
                        child: BottomCards(
                          imageAsset: Utils.bottomCardData1[index].icon!,
                          mainStatus: Utils.bottomCardData1[index].title!,
                          statusValue: Utils.bottomCardData1[index].status!,
                        ),
                      );
                    }),
                  ),
                ),
              );
    }
    else {

      return const SizedBox();
    }
  },
)
// ,
//               CustomSizedBox.height(10),
//               SizedBox(
//                 // color: Colors.red,
//                 height: 100.sp,
//                 width: 1.sw,
//                 child: ListView.separated(
//                     // shrinkWrap: true,
//                     scrollDirection: Axis.horizontal,
//                     itemBuilder: (context, index) {
//                       return BottomCards(
//                           imageAsset: Utils.bottomCardData2[index].icon!,
//                           mainStatus: Utils.bottomCardData2[index].title!,
//                           statusValue: Utils.bottomCardData2[index].status!);
//                     },
//                     separatorBuilder: (context, index) {
//                       return SizedBox(
//                         width: 5.sp,
//                       );
//                     },
//                     itemCount: Utils.bottomCardData2.length),
//               ),
//               CustomSizedBox.height(10),
//               SizedBox(
//                 // color: Colors.red,
//                 height: 100.sp,
//                 width: 1.sw,
//                 child: ListView.separated(
//                     //shrinkWrap: true,
//                     scrollDirection: Axis.horizontal,
//                     itemBuilder: (context, index) {
//                       return BottomCards(
//                           imageAsset: Utils.bottomCardData3[index].icon!,
//                           mainStatus: Utils.bottomCardData3[index].title!,
//                           statusValue: Utils.bottomCardData3[index].status!);
//                     },
//                     separatorBuilder: (context, index) {
//                       return SizedBox(
//                         width: 5.sp,
//                       );
//                     },
//                     itemCount: Utils.bottomCardData3.length),
//               ),
//               CustomSizedBox.height(10),

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
