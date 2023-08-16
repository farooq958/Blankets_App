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
        padding: EdgeInsets.all(20.r),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ExpandableTileWidget(
                leadingSvgIcon: true,
                isImageRequired: true,
                imageUrl: Assets.homeIcon,
                text: AppStrings.getStarted,
                expendedContent: Padding(
                  padding:
                      EdgeInsets.only(left: 15.w, right: 15.w, bottom: 5.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
              CustomSizedBox.height(10.h),
               ExpandableTileWidget(
                leadingSvgIcon: true,
                isImageRequired: true,
                imageUrl: Assets.trophy,
                text: AppStrings.achievement,
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
              CustomSizedBox.height(10.h),
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
              CustomSizedBox.height(10.h),
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
              CustomSizedBox.height(10.h),
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
              CustomSizedBox.height(10.h),
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
            ],
          ),
        ),
      ),
    );
  }
}
