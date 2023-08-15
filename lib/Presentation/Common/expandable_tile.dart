import 'package:hbk/Data/DataSource/Resources/imports.dart';

class ExpandableTileWidget extends StatefulWidget {
  final String? text;
  final bool? isImageRequired;
  final Widget expendedContent;
  final bool? leadingSvgIcon;
  final String? imageUrl;
  final bool? isPaddingRequired;

  const ExpandableTileWidget(
      {Key? key,
      this.text,
      this.isImageRequired,
      this.imageUrl,
      required this.expendedContent,
      this.isPaddingRequired,
      this.leadingSvgIcon})
      : super(key: key);

  @override
  State<ExpandableTileWidget> createState() => _ExpandableTileWidgetState();
}

class _ExpandableTileWidgetState extends State<ExpandableTileWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(20.r),
        child: ExpansionTile(
          expandedAlignment: Alignment.center,

          title: Text(
            widget.text ?? 'Head Office',
            style: Styles.circularStdMedium(context, fontSize: 16.sp),
          ),
          iconColor: AppColors.primaryColor,
          collapsedIconColor: AppColors.primaryColor,
          leading: widget.isImageRequired != null
              ? widget.leadingSvgIcon != null
                  ? SvgPicture.asset(
                      widget.imageUrl!,
                      color: AppColors.primaryColor,
                    )
                  : Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: AssetImageWidget(
                        url: widget.imageUrl!,
                        color: AppColors.primaryColor,
                        width: 50.w,
                        height: 100.h,
                      ),
                    )
              : const SizedBox(),
          tilePadding: widget.isPaddingRequired != null
              ? EdgeInsets.only(right: 15.w)
              : null,
          onExpansionChanged: (value) {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          backgroundColor: AppColors.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
              side: BorderSide(color: Colors.white)
          ),
          children: [
            if (isExpanded) ...[
              widget.expendedContent,
            ]
          ],
        ));
  }
}
