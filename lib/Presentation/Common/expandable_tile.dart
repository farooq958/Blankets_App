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
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 12,
            offset: Offset(0, 6),
            spreadRadius: 0,
          )
        ]
      ),
      child: ExpansionTile(

        expandedAlignment: Alignment.center,
// maintainState: true,
        title: Text(
      widget.text ?? 'Head Office',
      style: Styles.circularStdBold(context, fontSize: 16.sp),
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
                padding:  EdgeInsets.only(right: 10.0.sp),
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
        backgroundColor:const Color(0xffE7EDF5),
        collapsedBackgroundColor:AppColors.whiteColor ,
        shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.r),
        side: const BorderSide(color: Colors.white)
        ),
        collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(11.r),
        side: const BorderSide(color: Colors.white)
        ),
        children: [
      if (isExpanded) ...[
        widget.expendedContent,
      ]
        ],
      ),
    );
  }
}
