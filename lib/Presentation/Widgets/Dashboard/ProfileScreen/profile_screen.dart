import 'package:app_settings/app_settings.dart';
import 'package:hbk/Data/AppData/app_preferences.dart';
import 'package:hbk/Data/DataSource/Resources/imports.dart';
import 'package:hbk/Domain/Models/orderModel.dart';

import 'package:hbk/Presentation/Widgets/Dashboard/Orders/order_history.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/ProfileScreen/Components/list_tile_widget.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/ProfileScreen/manage_account.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/ProfileScreen/privacy_police.dart';

class ProfileScreen extends StatelessWidget {
  final bool isGuest;

  const ProfileScreen({super.key, required this.isGuest});

  @override
  Widget build(BuildContext context) {
    var userData = SharedPrefs.userData;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                AssetImageWidget(
                  url: Assets.user,
                  isCircle: true,
                  radius: 50.r,
                ),
                CustomSizedBox.height(10.h),
                isGuest
                    ? AppText('Guest User',
                        style: Styles.circularStdBold(context, fontSize: 24.sp))
                    : AppText(userData!.cardName!,
                        style:
                            Styles.circularStdBold(context, fontSize: 24.sp)),
                isGuest
                    ? const SizedBox()
                    : AppText(userData!.cardCode!,
                        style:
                            Styles.circularStdMedium(context, fontSize: 16.sp)),
              ],
            ),
          ),
          CustomSizedBox.height(20.h),
          isGuest ? _guestList(context) : _userList(context)
        ],
      ),
    );
  }

  Widget _userList(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTileWidget(
          tileTitle: AppStrings.manageAccount,
          icon: Assets.manageAccountIcon,
          onTap: () {
            Navigate.to(context, const ManageAccount());
          },
        ),
        ListTileWidget(
          tileTitle: AppStrings.orderHistory,
          icon: Assets.orderHistory,
          onTap: () {
            Navigate.to(context, const OrderHistory());
          },
        ),
        ListTileWidget(
          tileTitle: AppStrings.notificationPreferences,
          icon: Assets.notificationPreferences,
          onTap: () async {
            await AppSettings.openAppSettings(
                type: AppSettingsType.notification);
          },
        ),
        ListTileWidget(
          tileTitle: AppStrings.privacyPolicy,
          icon: Assets.privacyPolicy,
          onTap: () {
            Navigate.to(context, const PrivacyPolice());
          },
        ),
      ],
    );
  }

  Widget _guestList(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTileWidget(
          tileTitle: AppStrings.notificationPreferences,
          icon: Assets.salePolicyIcon,
          onTap: () async {
            await AppSettings.openAppSettings(
                type: AppSettingsType.notification);
          },
        ),
        ListTileWidget(
          tileTitle: AppStrings.privacyPolicy,
          icon: Assets.salePolicyIcon,
          onTap: () {
            Navigate.to(context, const PrivacyPolice());
          },
        ),
        ListTileWidget(
          tileTitle: 'Login',
          icon: Assets.logout,
          onTap: () {
            Navigate.to(context, const LoginScreen());
          },
        ),
      ],
    );
  }
}
