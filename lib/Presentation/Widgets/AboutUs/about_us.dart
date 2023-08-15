import 'package:hbk/Data/DataSource/Resources/imports.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWithBackButton(
        title: AppStrings.aboutUs,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ExpandableTileWidget(
              leadingSvgIcon: true,
              isImageRequired: true,
              imageUrl: Assets.homeIcon,
              text: AppStrings.getStarted,
              expendedContent: Column(
                children: [],
              ),
            ),
            CustomSizedBox.height(10.h),
            const ExpandableTileWidget(
              leadingSvgIcon: true,
              isImageRequired: true,
              imageUrl: Assets.trophy,
              text: AppStrings.achievement,
              expendedContent: Column(
                children: [],
              ),
            ),
            CustomSizedBox.height(10.h),
            const ExpandableTileWidget(
              leadingSvgIcon: true,
              isImageRequired: true,
              imageUrl: Assets.ourVision,
              text: AppStrings.ourVision,
              expendedContent: Column(
                children: [],
              ),
            ),
            CustomSizedBox.height(10.h),
            const ExpandableTileWidget(
              leadingSvgIcon: true,
              isImageRequired: true,
              imageUrl: Assets.flag,
              text: AppStrings.ourMission,
              expendedContent: Column(
                children: [],
              ),
            ),
            CustomSizedBox.height(10.h),
            const ExpandableTileWidget(
              leadingSvgIcon: true,
              isImageRequired: true,
              imageUrl: Assets.handShake,
              text: AppStrings.ourValue,
              expendedContent: Column(
                children: [],
              ),
            ),
            CustomSizedBox.height(10.h),
            const ExpandableTileWidget(
              leadingSvgIcon: true,
              isImageRequired: true,
              imageUrl: Assets.usersThree,
              text:AppStrings.whatMakeUs,
              expendedContent: Column(
                children: [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
