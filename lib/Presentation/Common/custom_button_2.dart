import 'package:hbk/Data/DataSource/Resources/imports.dart';

class CustomButton2 extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String imageUrl;

  const CustomButton2(
      {Key? key,
      required this.onTap,
      required this.title,
      required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        borderRadius: BorderRadius.circular(10.r),
        elevation: 4,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
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
                  AssetImageWidget(url: imageUrl,color: AppColors.primaryColor,width: 50.w,height: 50.h,),
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
