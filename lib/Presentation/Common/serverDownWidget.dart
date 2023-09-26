import 'package:hbk/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:hbk/Data/DataSource/Resources/imports.dart';

class ServerDownWidget extends StatelessWidget {
  final String errorMessage;
  final String errorTitle;
  final VoidCallback onTap;
  final double? height;
  final double? width;

  const ServerDownWidget(
      {super.key,
      required this.errorMessage,
      required this.errorTitle,
      required this.onTap,
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 1.sh,
      width: width ?? 1.sw,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 68.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AssetImageWidget(
              url: Assets.serverDownIcon,
              width: 80,
              height: 80,

              //isCircle: false,
            ),
            20.y,
            Center(
                child: AppText(
              errorTitle,
              style: Styles.circularStdBold(context, fontSize: 20.sp),
              maxLine: 3,
            )),
            10.y,
            Center(
                child: AppText(
              errorMessage,
              style: Styles.circularStdMedium(context,
                  fontSize: 16.sp, color: AppColors.greyColor),
              maxLine: 4,
            )),
            10.y,
            CustomButton(onTap: onTap, borderRadius: 30, text: 'Try Again')
          ],
        ),
      ),
    );
  }
}
