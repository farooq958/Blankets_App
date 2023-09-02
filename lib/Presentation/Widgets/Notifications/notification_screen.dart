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
          if (state is NotificationLoading) {
            return Center(child: LoadingDialog.loadingWidget());
          } else if (state is NotificationLoaded) {
            return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.notifications.length,
                itemBuilder: (context, index) {
                  return NotificationTile(
                      notification: state.notifications, index: index);
                });
          } else {
            return Text('Error');
          }
        },
      ),
    );
  }
}
