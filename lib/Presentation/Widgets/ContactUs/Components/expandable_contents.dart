import 'package:hbk/Data/DataSource/Resources/imports.dart';

class ExpandableContents extends StatelessWidget {
  final String? button1Text;
  final String? button2Text;
  final VoidCallback? button1onTap;
  final VoidCallback? button2Tap;
  final String? leadingIconButton1;
  final String? leadingIconButton2;
  final IconData? iconTime;
  final IconData? iconLocation;
  final String? summerTiming;
  final String? winterTiming;
  final String? location;

  const ExpandableContents(
      {Key? key,
      this.button1Text,
      this.button2Text,
      this.button1onTap,
      this.leadingIconButton1,
      this.leadingIconButton2,
      this.iconTime,
      this.iconLocation,
      this.summerTiming,
      this.winterTiming,
      this.location,
      this.button2Tap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CustomButton(
            onTap: button1onTap!,
            text: button1Text ?? 'text',
            bgColor: AppColors.whiteColor,
            textColor: AppColors.blackColor,
            leadingIcon: leadingIconButton1 ?? Assets.calling,
            iconColor: AppColors.primaryColor,
            leadingSvgIcon: true,
          ),
          CustomButton(
            onTap: button2Tap!,
            text: button2Text ?? 'text',
            bgColor: AppColors.whiteColor,
            textColor: AppColors.blackColor,
            leadingIcon: leadingIconButton2 ?? Assets.calling,
            iconColor: AppColors.primaryColor,
            leadingSvgIcon: true,
            // width: 20.w,
            verticalMargin: 20.h,
            // textSize: 14.sp,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                iconTime ?? Icons.lock_clock,
                color: AppColors.blackColor,
                size: 20.r,
              ),
              CustomSizedBox.width(5.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText('Office timing: ',
                      style: Styles.circularStdMedium(context, fontSize: 16.sp)),
                  CustomSizedBox.height(10.w),
                  AppText('Summer timing',
                      style: Styles.circularStdMedium(context, fontSize: 16.sp)),
                  AppText(summerTiming ?? '09:00 AM - 06:00 PM',
                      style: Styles.circularStdMedium(context, fontSize: 16.sp)),
                  CustomSizedBox.height(10.w),
                  AppText(winterTiming ?? 'Winter timing',
                      style: Styles.circularStdMedium(context, fontSize: 16.sp)),
                  AppText('09:00 AM - 06:00 PM',
                      style: Styles.circularStdMedium(context, fontSize: 16.sp)),
                ],
              )
            ],
          ),
          CustomSizedBox.height(10.w),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                iconLocation ?? Icons.location_on,
                color: AppColors.blackColor,
                size: 20.r,
              ),
              SizedBox(
                width: 270.w,
                child: AppText(
                  location ??
                      'HBK Complex, Main GT Road Nasir Pur Peshawar, Khyber Pakhtunkhwa, Pakistan',
                  style: Styles.circularStdMedium(context, fontSize: 16.sp),
                  maxLine: 3,
                ),
              )
            ],
          ),
          CustomSizedBox.height(10.w),
          AspectRatio(
            aspectRatio: 3 / 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Image.asset(Assets.map),
            ),
          ),
          CustomSizedBox.height(20.w),
        ],
      ),
    );
  }
}
