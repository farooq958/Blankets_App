import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hbk/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:hbk/Data/DataSource/Resources/imports.dart';
import 'package:hbk/Presentation/Widgets/Notifications/Components/web_view_screen.dart';
import 'package:hbk/Presentation/Widgets/Notifications/Controller/notification_cubit.dart';
import 'package:intl/intl.dart';

import '../../../../Data/DataSource/Resources/api_constants.dart';
import '../../../../Domain/Models/Notification/notification_model.dart';
import '../Controller/read_notification_cubit.dart';

class NotificationTile extends StatelessWidget {
  NotificationTile({Key? key, required this.notification, required this.index})
      : super(key: key);

  int index;
  List<NotificationsModel> notification;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      child: BlocListener<ReadNotificationCubit, ReadNotificationState>(
        listener: (context, state) {
          if (state is ReadNotificationLoaded) {
            context.read<NotificationCubit>().getNotification();
          }
          // TODO: implement listener
        },
        child: InkWell(
          onTap: () {
            if (notification[index].pstatus == '0') {
              context.read<ReadNotificationCubit>().readNotification(
                  notification[index].acode!, notification[index].rcode!);
            }
            String? url = extractUrl(notification[index].notificationMsg!);
            print(url);
            Navigate.to(
                context,
                InAppWebView(
                  url: url!,
                ));
          },
          child: Card(
            elevation: 5.0,
            shadowColor: AppColors.whiteColor,
            color: AppColors.whiteColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r)),
            child: Opacity(
              opacity: notification[index].pstatus == '1' ? 0.5 : 1,
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 8.sp, vertical: 8.sp),
                tileColor: AppColors.whiteColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r)),
                leading: SizedBox(
                  height: 60.h,
                  width: 50.w,
                  child: CachedImage(
                      url: "$imageUrl${notification[index].imageUrl!}",
                      isCircle: false),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(notification[index].title!,
                        style: Styles.circularStdBold(context,
                            fontSize: 16.sp, fontWeight: FontWeight.w500)),
                    AppText(
                        "${getHourFormDateTime(notification[index].dateTime!)}",
                        style: Styles.circularStdBold(context,
                            fontSize: 12.sp, fontWeight: FontWeight.w400))
                  ],
                ),
                subtitle: AppText(
                  extractTextBeforeForFurther(
                      notification[index].notificationMsg!),
                  style: Styles.circularStdMedium(context,
                      color: Colors.grey, fontSize: 14.sp),
                  maxLine: 3,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? extractUrl(String text) {
    // Define a regex pattern to match URLs
    final urlPattern = RegExp(r'https?://[^\s]+');

    // Use the firstMatch method to find the first URL in the text
    final match = urlPattern.firstMatch(text);

    if (match != null) {
      return match.group(0);
    } else {
      return "No URL found";
    }
  }

  getHourFormDateTime(String dateTime) {
    DateTime apiDate = DateFormat("MM/dd/yyyy hh:mm:ss a").parse(dateTime);
    print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>${apiDate}");
    return apiDate.timeAgo(numericDates: false);
  }

  String extractTextBeforeForFurther(String input) {
    // Find the index of "For Further Details"
    int index = input.indexOf("For");
    if (index != -1) {
      // Extract the text before "For Further Details"
      String extractedText = input.substring(0, index);
      return extractedText.trim(); // Trim any leading/trailing whitespace
    } else {
      int index = input.indexOf("To");
      if (index != -1) {
        String extractedText = input.substring(0, index);
        return extractedText.trim();
      }
      return "Not Found";
    }
  }
}
