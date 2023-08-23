import 'package:hbk/Data/DataSource/Resources/imports.dart';

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              maxLine: 20,
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
              maxLine: 20,
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
          padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 5.h),
          child: Column(
            children: [
              AppText(
                AppStrings.companyAchievement,
                style: Styles.circularStdMedium(context),
                maxLine: 20,
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
          padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 5.h),
          child: Column(
            children: [
              AppText(
                AppStrings.companyAchievement,
                style: Styles.circularStdMedium(context),
                maxLine: 20,
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
          padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 5.h),
          child: Column(
            children: [
              AppText(
                AppStrings.companyAchievement,
                style: Styles.circularStdMedium(context),
                maxLine: 20,
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
          padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 5.h),
          child: Column(
            children: [
              AppText(
                AppStrings.companyAchievement,
                style: Styles.circularStdMedium(context),
                maxLine: 20,
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
