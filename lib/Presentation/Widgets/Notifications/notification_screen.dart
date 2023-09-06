import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hbk/Data/DataSource/Resources/imports.dart';

import '../../Common/Dialogs/loading_dialog.dart';
import 'Components/notification_tile.dart';
import 'Controller/notification_cubit.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    context.read<NotificationCubit>().getNotification();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBar(
        title: "Notifications",
        isNotificationScreen: true,
        isShowNotificationButton: true,
      ),
      body: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
          if (state is NotificationError) {
            return Center(
                child: AppText(
              state.error,
              style: Styles.circularStdMedium(context, fontSize: 16),
            ));
          } else if (state is NotificationLoaded) {
            return state.notifications.isNotEmpty
                ? ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.notifications.length,
                    itemBuilder: (context, index) {
                      return NotificationTile(
                          notification: state.notifications, index: index);
                    })
                : Center(
                    child: AppText(
                      'No have any notification',
                      style: Styles.circularStdMedium(context,
                          fontSize: 18, color: AppColors.primaryColor),
                    ),
                  );
          } else {
            return Center(child: LoadingDialog.loadingWidget());
          }
        },
      ),
    );
  }
}
