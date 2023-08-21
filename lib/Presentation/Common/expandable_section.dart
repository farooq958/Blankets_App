
import 'package:hbk/Data/DataSource/Resources/imports.dart';

class ExpandableSection extends StatefulWidget {
  final String title;
  final Widget expendedContent;
  final bool? isImageRequired;
  const ExpandableSection(
      {Key? key, required this.title, required this.expendedContent,this.isImageRequired})
      : super(key: key);

  @override
  State<ExpandableSection> createState() => _ExpandableState();
}

class _ExpandableState extends State<ExpandableSection> {
  bool isExpanded = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Material(
        borderRadius: BorderRadius.circular(10.r),
        elevation: 4.sp,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          width: 1.sw,
          // height: !isExpanded ? 50.h:null,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                       widget.isImageRequired != null? AssetImageWidget(
                          url: Assets.appLogo,
                          color: AppColors.primaryColor,
                          width: 50.w,
                          height: 50.h,
                        ) : const SizedBox(),
                        CustomSizedBox.width(5.w),
                        SizedBox(
                          width: 230.w,
                          child: AppText(widget.title,
                              style: Styles.circularStdBold(context),maxLine: 2,),
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: () {
                          // Future.delayed(Duration(seconds: 2));
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                        },
                        icon: Icon(
                          isExpanded
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: AppColors.primaryColor,
                        )),
                  ],
                ),
                CustomSizedBox.height(10.h),
                if (isExpanded) ...[
                  // Additional content when expanded
                  // You can add more widgets here
                  widget.expendedContent,
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
