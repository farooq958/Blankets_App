
import 'package:hbk/Data/DataSource/Resources/imports.dart';

class ListTileWidget extends StatelessWidget {
  final String? tileTitle;
  final String? icon;
  final VoidCallback? onTap;

  const ListTileWidget({Key? key, this.tileTitle, this.icon, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return

      ListTile(

        title: AppText(
          tileTitle!,
          style: Styles.circularStdMedium(context, fontSize: 18.sp),
        ),
        leading: SvgPicture.asset(
          icon!,
          color: AppColors.primaryColor,
        ),
        onTap: onTap!,
      );
  }
}