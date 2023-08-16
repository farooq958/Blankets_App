import 'package:hbk/Data/DataSource/Resources/imports.dart';

class InvoiceTile extends StatelessWidget {
  final String? leadingName1;
  final String? leadingName2;
  final String? trailingName1;
  final String? trailingName2;
  final Color? tileColor;
  const InvoiceTile({
    super.key, this.leadingName1, this.trailingName1, this.tileColor, this.leadingName2, this.trailingName2,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
     // horizontalTitleGap: 20,
      tileColor: tileColor??AppColors.whiteColor,
      leading:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(leadingName1 ?? "", style: Styles.circularStdBold(context,fontWeight: FontWeight.w500,fontSize: 14.sp)),
       CustomSizedBox.height(10),
          AppText(leadingName2??"",
              maxLine: 3,
              overflow: TextOverflow.ellipsis,
              style: Styles.circularStdBold(context,fontWeight: FontWeight.w600,fontSize: 15.sp)),
          //SizedBox(width: 20,)


        ],
      )
      ,

      trailing:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          AppText(trailingName1??"", style: Styles.circularStdBold(context,fontWeight: FontWeight.w500,fontSize: 14.sp)),
          CustomSizedBox.height(10),
          AppText(trailingName2??"",

              maxLine: 5,
              overflow: TextOverflow.ellipsis,
              style: Styles.circularStdBold(context,fontWeight: FontWeight.w600,fontSize: 16.sp)),


        ],
      ),
    );
  }
}