import 'package:hbk/Data/DataSource/Resources/imports.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWithBackButton(
        title: AppStrings.contactUs,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              /// expandable widget

              ExpandableTileWidget(
                isImageRequired: true,
                imageUrl: Assets.appLogo,
                expendedContent: ExpandableContents(
                  button1onTap: () {
                    CustomDialog.dialog(
                        context,
                        SizedBox(
                            width: 1.sw,
                            height: 1.sh / 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomButton(
                                  onTap: () {},
                                  text: '+92 300 85 42 950',
                                  horizontalMargin: 20.w,
                                  leadingIcon: Assets.calling,
                                  leadingSvgIcon: true,
                                  iconColor: AppColors.primaryColor,
                                  bgColor: AppColors.whiteColor,
                                  textColor: AppColors.blackColor,
                                ),
                                CustomSizedBox.height(20.h),
                                CustomButton(
                                  onTap: () {},
                                  text: '+92 91 111 222 550',
                                  horizontalMargin: 20.w,
                                  leadingIcon: Assets.calling,
                                  leadingSvgIcon: true,
                                  iconColor: AppColors.primaryColor,
                                  bgColor: AppColors.whiteColor,
                                  textColor: AppColors.blackColor,
                                ),
                              ],
                            )));
                  },
                  button1Text: 'Call',
                  button2Text: 'info@hbkblankets.com',
                  button2Tap: () {},
                ),
              ),
              CustomSizedBox.height(10.h),
              ExpandableTileWidget(
                isImageRequired: true,
                imageUrl: Assets.appLogo,
                text: 'Lahore Office',

                expendedContent: ExpandableContents(
                  button1onTap: () {
                    CustomDialog.dialog(
                        context,
                        SizedBox(
                            width: 1.sw,
                            height: 1.sh / 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomButton(
                                  onTap: () {},
                                  text: '(+92) 42 373 805 50',
                                  horizontalMargin: 20.w,
                                  leadingIcon: Assets.calling,
                                  leadingSvgIcon: true,
                                  iconColor: AppColors.primaryColor,
                                  bgColor: AppColors.whiteColor,
                                  textColor: AppColors.blackColor,
                                ),
                                CustomSizedBox.height(20.h),
                                CustomButton(
                                  onTap: () {},
                                  text: '(+92) 300 85 62 950',
                                  horizontalMargin: 20.w,
                                  leadingIcon: Assets.calling,
                                  leadingSvgIcon: true,
                                  iconColor: AppColors.primaryColor,
                                  bgColor: AppColors.whiteColor,
                                  textColor: AppColors.blackColor,
                                ),
                              ],
                            )));
                  },
                  button1Text: 'Call',
                  button2Text: 'Lahore@hbkblankets.com',
                  button2Tap: () {},
                  location:
                      'Hall # 1, 3rd Floor New Azam Cloth Market(plaza) inside Sheran wala Gate Lahore, Pakistan.',
                ),
              ),
              CustomSizedBox.height(10.h),
              ExpandableTileWidget(
                isImageRequired: true,
                imageUrl: Assets.appLogo,
                text: 'Karachi Office',
                expendedContent: ExpandableContents(
                  button1onTap: () {
                    CustomDialog.dialog(
                        context,
                        SizedBox(
                            width: 1.sw,
                            height: 1.sh / 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomButton(
                                  onTap: () {},
                                  text: '+92) 2132360150',
                                  horizontalMargin: 20.w,
                                  leadingIcon: Assets.calling,
                                  leadingSvgIcon: true,
                                  iconColor: AppColors.primaryColor,
                                  bgColor: AppColors.whiteColor,
                                  textColor: AppColors.blackColor,
                                ),
                                CustomSizedBox.height(20.h),
                                CustomButton(
                                  onTap: () {},
                                  text: '+92)300 85 93 150',
                                  horizontalMargin: 20.w,
                                  leadingIcon: Assets.calling,
                                  leadingSvgIcon: true,
                                  iconColor: AppColors.primaryColor,
                                  bgColor: AppColors.whiteColor,
                                  textColor: AppColors.blackColor,
                                ),
                              ],
                            )));
                  },
                  button1Text: 'Call',
                  button2Text: 'Karachi@hbkblankets.com',
                  button2Tap: () {},
                  location:
                      'PLOT # S-95 Behind Good Luck Flour mill,Hawksbay Road,S.I.T.E Karachi Pakistan.',
                ),
              ),
              CustomSizedBox.height(10.h),
              ExpandableTileWidget(
                isImageRequired: true,
                imageUrl: Assets.appLogo,
                text: 'Faisalabad Office',
                expendedContent: ExpandableContents(
                  button1onTap: () {
                    CustomDialog.dialog(
                        context,
                        SizedBox(
                            width: 1.sw,
                            height: 1.sh / 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomButton(
                                  onTap: () {},
                                  text: '+92) 91 111 222 550',
                                  horizontalMargin: 20.w,
                                  leadingIcon: Assets.calling,
                                  leadingSvgIcon: true,
                                  iconColor: AppColors.primaryColor,
                                  bgColor: AppColors.whiteColor,
                                  textColor: AppColors.blackColor,
                                ),
                                CustomSizedBox.height(20.h),
                                CustomButton(
                                  onTap: () {},
                                  text: '(+92) 300 8581550',
                                  horizontalMargin: 20.w,
                                  leadingIcon: Assets.calling,
                                  leadingSvgIcon: true,
                                  iconColor: AppColors.primaryColor,
                                  bgColor: AppColors.whiteColor,
                                  textColor: AppColors.blackColor,
                                ),
                              ],
                            )));
                  },
                  button1Text: 'Call',
                  button2Text: 'factory@hbkblankets.com',
                  button2Tap: () {},
                  location:
                      'Address: Plot # 300, Phase II, M-3 Industrial City, Sahinwala, Faisalabad,Pakistan.',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


