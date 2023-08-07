import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hbk/Data/DataSource/Static/assets.dart';
import 'package:hbk/Data/DataSource/Static/sized_box.dart';
import 'package:hbk/Data/DataSource/Static/strings.dart';
import 'package:hbk/Data/DataSource/Static/text_styles.dart';
import 'package:hbk/Presentation/Common/app_buttons.dart';
import 'package:hbk/Presentation/Common/app_text.dart';

class NoInternetConnectionScreen extends StatelessWidget {
  const NoInternetConnectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(Assets.noInternetConnection),
            CustomSizedBox.height(10.h),
            AppText(AppStrings.noInternetConnection,
                style: Styles.circularStdBold(context)),
            CustomSizedBox.height(10.h),
            AppText('Connect to internet and try again.',
                style: Styles.circularStdMedium(context,color: Colors.grey)),
            CustomSizedBox.height(30.h),
            CustomButton(
              horizontalMargin: 50.w,
              onTap: (){}, text: 'Retry',)
          ],
        ),
      ),
    );
  }
}
