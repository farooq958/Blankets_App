import 'package:hbk/Data/DataSource/Resources/imports.dart';

class RowWidget extends StatelessWidget {
  final String? title;
  final String? amount;
  final bool? isRs;

  const RowWidget(
      {Key? key, required this.title, required this.amount, this.isRs})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.w, right: 8.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(title!, style: Styles.circularStdMedium(context)),
          isRs == true
              ? AppText('RS ${amount!.toString()}',
                  style: Styles.circularStdBold(context))
              : AppText(amount.toString(),
                  style: Styles.circularStdMedium(context)),
        ],
      ),
    );
  }
}
