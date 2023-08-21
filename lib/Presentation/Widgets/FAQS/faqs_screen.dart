import 'package:hbk/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:hbk/Data/DataSource/Resources/imports.dart';

class FAQS extends StatelessWidget {
  const FAQS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWithBackButton(
        title: 'FAQS',
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSizedBox.height(20.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: ExpandableSection(
                //isImageRequired: false,
                  title: 'How do I place an order for a blanket on the app?', expendedContent: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.w),
                    child: AppText(
                      'To place an order, simply browse through our blanket collection, select the one you like, and click on the "Add to Cart" button. Then, proceed to place order.',
                      style:
                      Styles.circularStdMedium(context, fontSize: 16.sp),
                      maxLine: 5,
                      textAlign: TextAlign.justify,
                    ),
                  )
                ],
              )),
            ),
            CustomSizedBox.height(10.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: ExpandableSection(
                //isImageRequired: false,
                  title: 'Is there a loyalty rewards program for frequent customers?', expendedContent: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.w),
                    child: AppText(
                      'To place an order, simply browse through our blanket collection, select the one you like, and click on the "Add to Cart" button. Then, proceed to place order.',
                      style:
                      Styles.circularStdMedium(context, fontSize: 16.sp),
                      maxLine: 5,
                      textAlign: TextAlign.justify,
                    ),
                  )
                ],
              )),
            ),
            CustomSizedBox.height(10.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: ExpandableSection(
                //isImageRequired: false,
                  title: 'How can I contact customer support if I have a question', expendedContent: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.w),
                    child: AppText(
                      'To place an order, simply browse through our blanket collection, select the one you like, and click on the "Add to Cart" button. Then, proceed to place order.',
                      style:
                      Styles.circularStdMedium(context, fontSize: 16.sp),
                      maxLine: 5,
                      textAlign: TextAlign.justify,
                    ),
                  )
                ],
              )),
            ),

            20.y
            ,


          ],
        ),
      ),
    );
  }
}
