
import 'package:hbk/Data/DataSource/Resources/imports.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      child: Card(
        elevation: 5.0,
        shadowColor: AppColors.whiteColor,
        color: AppColors.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r)
        ),
        child: ListTile(
          tileColor: AppColors.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r)
          ),
          leading: SvgPicture.asset(Assets.notificationImage),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText('Order Successful',
                  style: Styles.circularStdBold(context, fontSize: 16.sp,fontWeight: FontWeight.w700)),
              AppText('1h ago',
                  style: Styles.circularStdBold(context, fontSize: 12.sp,fontWeight: FontWeight.w400))
            ],
          ),
          subtitle: AppText(
            'Congratulations! Your order was successful. Get ready to enjoy your purchase!',
            style: Styles.circularStdMedium(context,
                color: Colors.grey, fontSize: 14.sp),
            maxLine: 3,
          ),
        ),
      ),
    );
  }
}

