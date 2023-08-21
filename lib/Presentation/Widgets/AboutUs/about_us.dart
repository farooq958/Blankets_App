import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hbk/Data/DataSource/Resources/imports.dart';
import 'package:hbk/Presentation/Widgets/ContactUs/Controller/in_out_cubit.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {


  @override
  void initState() {
    Map<int, bool> map = {};
    for (int i = 0; i < 6; i++) {
      map.addAll({i: false});
    }

    ///  {0:false,1:false ...}
    print(map);
    // TODO: implement initState
    context.read<InOutCubit>().inOut(map);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<ExpansionTileController> expansionTileController=List.generate(6, (index) => ExpansionTileController());
    final List<ExpandableTileWidget> tileDataList = [
      ExpandableTileWidget(
        leadingSvgIcon: true,
        isImageRequired: true,
        imageUrl: Assets.homeIcon,
        text: AppStrings.getStarted,
        expendedContent: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              AppStrings.companyAchievement,
              style: Styles.circularStdMedium(context),
              maxLine: 15,
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
      ExpandableTileWidget(
        leadingSvgIcon: true,
        isImageRequired: true,
        imageUrl: Assets.trophy,
        text: AppStrings.achievement,
        expendedContent: Column(
          children: [
            AppText(
              AppStrings.companyAchievement,
              style: Styles.circularStdMedium(context),
              maxLine: 15,
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
      ExpandableTileWidget(
        leadingSvgIcon: true,
        isImageRequired: true,
        imageUrl: Assets.ourVision,
        text: AppStrings.ourVision,
        expendedContent: Padding(
          padding:
          EdgeInsets.only(left: 15.w, right: 15.w, bottom: 5.h),
          child: Column(
            children: [
              AppText(
                AppStrings.companyAchievement,
                style: Styles.circularStdMedium(context),
                maxLine: 15,
                textAlign: TextAlign.left,
              )
            ],
          ),
        ),
      ),
      ExpandableTileWidget(
        leadingSvgIcon: true,
        isImageRequired: true,
        imageUrl: Assets.flag,
        text: AppStrings.ourMission,
        expendedContent: Padding(
          padding:
          EdgeInsets.only(left: 15.w, right: 15.w, bottom: 5.h),
          child: Column(
            children: [
              AppText(
                AppStrings.companyAchievement,
                style: Styles.circularStdMedium(context),
                maxLine: 15,
                textAlign: TextAlign.left,
              )
            ],
          ),
        ),
      ),
      ExpandableTileWidget(
        leadingSvgIcon: true,
        isImageRequired: true,
        imageUrl: Assets.handShake,
        text: AppStrings.ourValue,
        expendedContent: Padding(
          padding:
          EdgeInsets.only(left: 15.w, right: 15.w, bottom: 5.h),
          child: Column(
            children: [
              AppText(
                AppStrings.companyAchievement,
                style: Styles.circularStdMedium(context),
                maxLine: 15,
                textAlign: TextAlign.left,
              )
            ],
          ),
        ),
      ),
      ExpandableTileWidget(
        leadingSvgIcon: true,
        isImageRequired: true,
        imageUrl: Assets.usersThree,
        text: AppStrings.whatMakeUs,
        expendedContent: Padding(
          padding:
          EdgeInsets.only(left: 15.w, right: 15.w, bottom: 5.h),
          child: Column(
            children: [
              AppText(
                AppStrings.companyAchievement,
                style: Styles.circularStdMedium(context),
                maxLine: 15,
                textAlign: TextAlign.left,
              )
            ],
          ),
        ),
      ),
      // ... Add other tile data here
    ];
    return Scaffold(
      appBar: const CustomAppBarWithBackButton(
        title: AppStrings.aboutUs,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.r),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


                   ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: tileDataList.length,
                    itemBuilder: (context, index) {
                      final tileData = tileDataList[index];
                      return Column(
                        children: [
                          ExpandableTileWidget(
                            leadingSvgIcon: tileData.leadingSvgIcon,
                            isImageRequired: tileData.isImageRequired,
                            imageUrl: tileData.imageUrl,
                            text: tileData.text,
                           // index: index,
                            //toUpdate: state,
                            //isExpanded: state[index],
                            //expansionTileController: expansionTileController,
                            expendedContent: Padding(
                              padding: EdgeInsets.only(
                                  left: 15.w, right: 15.w, bottom: 5.h),
                              child: tileData.expendedContent,
                            ),
                          ),
                          CustomSizedBox.height(10.h),
                        ],
                      );
                    },
                  )

            ],
          ),
        ),
      ),
    );
  }
}
