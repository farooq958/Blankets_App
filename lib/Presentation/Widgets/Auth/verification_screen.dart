
import 'package:hbk/Data/DataSource/Resources/imports.dart';

import 'package:hbk/Presentation/Widgets/Auth/create_new_account.dart';


class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            width: 1.sw,
            height: 1.sh,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 100.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: AssetImageWidget(
                          url: Assets.appLogo,
                          color: AppColors.primaryColor,
                          height: 150.h,
                          width: 150.w,
                        ),
                      ),
                      AppText(
                        AppStrings.almostThere,
                        style: Styles.circularStdBold(context, fontSize: 24.sp),
                      ),
                      AppText(
                        AppStrings.verificationCodeNote,
                        style: Styles.circularStdMedium(context),
                        maxLine: 2,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: const PinputExample(),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    bottom: 40.h,
                    right: 0,
                    left: 0,
                    child: CustomButton(
                        onTap: () {
                          Navigate.to(context, const CreateNewAccountScreen());
                        },
                        text: AppStrings.verify)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
