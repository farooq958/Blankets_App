import 'package:hbk/Data/DataSource/Resources/imports.dart';
import 'package:url_launcher/url_launcher.dart';

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
                                  onTap: () async {

                                    Uri phoneNo = Uri.parse('tel:+923008542950');
                                    if (await launchUrl(phoneNo)) {
                                    //dialer opened
                                    }else{
                                    //dailer is not opened
                                    }

                                  },
                                  text: '+92 300 85 42 950',
                                  horizontalMargin: 20.w,
                                  leadingIcon: Assets.calling,
                                  leadingSvgIcon: true,
                                  gapWidth: 10.sp,
                                  iconColor: AppColors.primaryColor,
                                  bgColor: AppColors.whiteColor,
                                  textColor: AppColors.blackColor,
                                ),
                                CustomSizedBox.height(20.h),
                                CustomButton(
                                  onTap: () async {

                                    Uri phoneNo = Uri.parse('tel:+9291111222550');
                                    if (await launchUrl(phoneNo)) {
                                    //dialer opened
                                    }else{
                                    //dailer is not opened
                                    }

                                  },
                                  gapWidth: 10.sp,
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
                                  onTap: () async {

                                    Uri phoneNo = Uri.parse('tel:+923008542950');
                                    if (await launchUrl(phoneNo)) {
                                      //dialer opened
                                    }else{
                                      //dailer is not opened
                                    }

                                  },
                                  text: '+92 300 85 42 950',
                                  horizontalMargin: 20.w,
                                  leadingIcon: Assets.calling,
                                  leadingSvgIcon: true,
                                  gapWidth: 10.sp,
                                  iconColor: AppColors.primaryColor,
                                  bgColor: AppColors.whiteColor,
                                  textColor: AppColors.blackColor,
                                ),
                                CustomSizedBox.height(20.h),
                                CustomButton(
                                  onTap: () async {

                                    Uri phoneNo = Uri.parse('tel:+9291111222550');
                                    if (await launchUrl(phoneNo)) {
                                      //dialer opened
                                    }else{
                                      //dailer is not opened
                                    }

                                  },
                                  gapWidth: 10.sp,
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
                  button2Text: 'Lahore@hbkblankets.com',

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
                                  onTap: () async {

                                    Uri phoneNo = Uri.parse('tel:+923008542950');
                                    if (await launchUrl(phoneNo)) {
                                      //dialer opened
                                    }else{
                                      //dailer is not opened
                                    }

                                  },
                                  text: '+92 300 85 42 950',
                                  horizontalMargin: 20.w,
                                  leadingIcon: Assets.calling,
                                  leadingSvgIcon: true,
                                  gapWidth: 10.sp,
                                  iconColor: AppColors.primaryColor,
                                  bgColor: AppColors.whiteColor,
                                  textColor: AppColors.blackColor,
                                ),
                                CustomSizedBox.height(20.h),
                                CustomButton(
                                  onTap: () async {

                                    Uri phoneNo = Uri.parse('tel:+9291111222550');
                                    if (await launchUrl(phoneNo)) {
                                      //dialer opened
                                    }else{
                                      //dailer is not opened
                                    }

                                  },
                                  gapWidth: 10.sp,
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
                  button2Text: 'Karachi@hbkblankets.com',

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
                                  onTap: () async {

                                    Uri phoneNo = Uri.parse('tel:+923008542950');
                                    if (await launchUrl(phoneNo)) {
                                      //dialer opened
                                    }else{
                                      //dailer is not opened
                                    }

                                  },
                                  text: '+92 300 85 42 950',
                                  horizontalMargin: 20.w,
                                  leadingIcon: Assets.calling,
                                  leadingSvgIcon: true,
                                  gapWidth: 10.sp,
                                  iconColor: AppColors.primaryColor,
                                  bgColor: AppColors.whiteColor,
                                  textColor: AppColors.blackColor,
                                ),
                                CustomSizedBox.height(20.h),
                                CustomButton(
                                  onTap: () async {

                                    Uri phoneNo = Uri.parse('tel:+9291111222550');
                                    if (await launchUrl(phoneNo)) {
                                      //dialer opened
                                    }else{
                                      //dailer is not opened
                                    }

                                  },
                                  gapWidth: 10.sp,
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
                  button2Text: 'factory@hbkblankets.com',

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


