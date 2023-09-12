import 'package:hbk/Data/DataSource/Resources/imports.dart';

class SalesPolicy extends StatelessWidget {
  const SalesPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWithBackButton(
        title: AppStrings.salesPolicy,
        exceptional: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(15.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSizedBox.height(20.h),
              const ExpandableTileWidget(
                text: 'Rebate policy',
                imageUrl: Assets.rebatePolicy,
                leadingSvgIcon: true,
                isImageRequired: true,
                expendedContent: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CachedImage(
                          url:
                              'http://imtxt.sbsolutions.com.pk:44890/Picture/CustomerApplogin/rebate_policy.jpg',
                          isCircle: false),
                    ],
                  ),
                ),
              ),
              CustomSizedBox.height(20.h),
              const ExpandableTileWidget(
                isImageRequired: true,
                imageUrl: Assets.loyalPolicy,
                leadingSvgIcon: true,
                text: 'Loyal policy',
                expendedContent: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CachedImage(
                          url:
                              'http://imtxt.sbsolutions.com.pk:44890/Picture/CustomerApplogin/loyal_policy.jpg',
                          isCircle: false),
                    ],
                  ),
                ),
              ),
              CustomSizedBox.height(20.h),
              const ExpandableTileWidget(
                isImageRequired: true,
                imageUrl: Assets.transportPolicy,
                leadingSvgIcon: true,
                text: 'Transport policy',
                expendedContent: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CachedImage(
                          url:
                              'http://imtxt.sbsolutions.com.pk:44890/Picture/CustomerApplogin/transport_policy.jpg',
                          isCircle: false),
                    ],
                  ),
                ),
              ),
              CustomSizedBox.height(20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _button(
      BuildContext context, VoidCallback onTap, String title, String imageUrl) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        borderRadius: BorderRadius.circular(10.r),
        elevation: 4,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          width: 1.sw,
          height: 50.h,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  AssetImageWidget(url: imageUrl),
                  CustomSizedBox.width(10.w),
                  AppText(title, style: Styles.circularStdBold(context)),
                ],
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.primaryColor,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
