import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hbk/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:hbk/Data/DataSource/Resources/imports.dart';
import 'package:hbk/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:hbk/Presentation/Widgets/AboutUs/Controller/about_us_cubit.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  int _currentIndex = -1;
  late final ExpansionTileController? expansionTileController;

  void toggleExpand(int index) {
    if (_currentIndex == index) {
      setState(() {
        _currentIndex = -1; // Close the currently expanded tile

        expansionTileController!.collapse();
      });
    } else {
      setState(() {
        _currentIndex = index; // Expand the new tile
      });
    }
  }

  @override
  void initState() {
    context.read<AboutUsCubit>().getAboutUsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWithBackButton(
        title: AppStrings.aboutUs,
        exceptional: true,
        // isGuest: ,
      ),
      body: BlocListener<AboutUsCubit, AboutUsState>(
        // listenWhen: (oldState, newState) => oldState != newState,
        listener: (context, state) {
          print("in state");
          print(state);

          if (state is AboutUsLoading) {
            print("in loading");
            LoadingDialog.showLoadingDialog(context);
          }
          if (state is AboutUsSuccess) {
            Navigator.of(context).pop(true);
          }
        },
        child: Padding(
          padding: EdgeInsets.all(20.r),
          child: SingleChildScrollView(
            child: BlocBuilder<AboutUsCubit, AboutUsState>(
              // TODO: implement listener

              builder: (context, state) {
                if (state is AboutUsSuccess) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ExpandableTileWidget(
                        leadingSvgIcon: true,
                        isImageRequired: true,
                        imageUrl: Assets.homeIcon,
                        text: AppStrings.getStarted,
                        expendedContent: Padding(
                            padding: EdgeInsets.only(
                                left: 15.w, right: 15.w, bottom: 5.h),
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  state.aboutUsModel!.introduction ?? "",
                                  style: Styles.circularStdMedium(context),
                                  maxLine: 22,
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            )),
                      ),
                      10.y,
                      ExpandableTileWidget(
                        leadingSvgIcon: true,
                        isImageRequired: true,
                        imageUrl: Assets.trophy,
                        text: AppStrings.achievement,
                        expendedContent: Padding(
                            padding: EdgeInsets.only(
                                left: 15.w, right: 15.w, bottom: 5.h),
                            child: Column(
                              children: [
                                AppText(
                                  state.aboutUsModel!.achievements ?? "",
                                  style: Styles.circularStdMedium(context),
                                  maxLine: 20,
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            )),
                      ),
                      10.y,
                      ExpandableTileWidget(
                        leadingSvgIcon: true,
                        isImageRequired: true,
                        imageUrl: Assets.ourVision,
                        text: AppStrings.ourVision,
                        expendedContent: Padding(
                          padding: EdgeInsets.only(
                              left: 15.w, right: 15.w, bottom: 5.h),
                          child: Column(
                            children: [
                              AppText(
                                state.aboutUsModel!.ourVision ?? "",
                                style: Styles.circularStdMedium(context),
                                maxLine: 20,
                                textAlign: TextAlign.left,
                              )
                            ],
                          ),
                        ),
                      ),
                      10.y,
                      ExpandableTileWidget(
                        leadingSvgIcon: true,
                        isImageRequired: true,
                        imageUrl: Assets.flag,
                        text: AppStrings.ourMission,
                        expendedContent: Padding(
                          padding: EdgeInsets.only(
                              left: 15.w, right: 15.w, bottom: 5.h),
                          child: Column(
                            children: [
                              AppText(
                                state.aboutUsModel!.mission ?? "",
                                style: Styles.circularStdMedium(context),
                                maxLine: 20,
                                textAlign: TextAlign.left,
                              )
                            ],
                          ),
                        ),
                      ),
                      10.y,
                      ExpandableTileWidget(
                        leadingSvgIcon: true,
                        isImageRequired: true,
                        imageUrl: Assets.handShake,
                        text: AppStrings.ourValue,
                        expendedContent: Padding(
                          padding: EdgeInsets.only(
                              left: 15.w, right: 15.w, bottom: 5.h),
                          child: Column(
                            children: [
                              AppText(
                                state.aboutUsModel!.ourValues ?? "",
                                style: Styles.circularStdMedium(context),
                                maxLine: 20,
                                textAlign: TextAlign.left,
                              )
                            ],
                          ),
                        ),
                      ),
                      10.y,
                      ExpandableTileWidget(
                        leadingSvgIcon: true,
                        isImageRequired: true,
                        imageUrl: Assets.usersThree,
                        text: AppStrings.whatMakeUs,
                        expendedContent: Padding(
                          padding: EdgeInsets.only(
                              left: 15.w, right: 15.w, bottom: 5.h),
                          child: Column(
                            children: [
                              AppText(
                                state.aboutUsModel!.whatMakeUsDifferent ?? "",
                                style: Styles.circularStdMedium(context),
                                maxLine: 20,
                                textAlign: TextAlign.left,
                              )
                            ],
                          ),
                        ),
                      ),
                      // ... Add other tile data here

                      // ListView.builder(
                      //   physics: const NeverScrollableScrollPhysics(),
                      //   shrinkWrap: true,
                      //   itemCount: tileDataList.length,
                      //   itemBuilder: (context, index) {
                      //     final tileData = tileDataList[index];
                      //     return Column(
                      //       children: [
                      //         ExpandableTileWidget(
                      //           leadingSvgIcon: tileData.leadingSvgIcon,
                      //           isImageRequired: tileData.isImageRequired,
                      //           imageUrl: tileData.imageUrl,
                      //           text: tileData.text,
                      //           expendedContent: Padding(
                      //             padding: EdgeInsets.only(
                      //                 left: 15.w, right: 15.w, bottom: 5.h),
                      //             child: tileData.expendedContent,
                      //           ),
                      //         ),
                      //         CustomSizedBox.height(10.h),
                      //       ],
                      //     );
                      //   },
                      // )
                    ],
                  );
                } else if (state is AboutUsLoading) {
                  return const SizedBox();
                  // return SizedBox(child: LoadingDialog.loadingWidget(),);
                }
                return const SizedBox();
              },
            ),
          ),
        ),
      ),
    );
  }
}
