import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hbk/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:hbk/Data/DataSource/Resources/imports.dart';
import 'package:hbk/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:hbk/Presentation/Widgets/FAQS/Controller/faqs_cubit.dart';
import 'package:hbk/Presentation/Widgets/FAQS/State/faqs_state.dart';

class FAQS extends StatefulWidget {
  const FAQS({Key? key}) : super(key: key);

  @override
  State<FAQS> createState() => _FAQSState();
}

class _FAQSState extends State<FAQS> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<FaqsCubit>().getFaqsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWithBackButton(
        title: 'FAQS',
        exceptional: true,
      ),
      body: BlocConsumer<FaqsCubit, FaqsState>(
        listener: (context, state) {
          print('state $state');
          // TODO: implement listener
          if (state is FaqsLoading) {
            LoadingDialog.showLoadingDialog(context);
          }
          if (state is FaqsSuccess) {
            Navigator.of(context).pop(true);
          }
        },
        builder: (context, state) {
          if (state is FaqsSuccess) {
            print(state.faqsModel);
            return Column(
              children: [
                10.y,
                Expanded(
                  child: ListView.separated(
//shrinkWrap: true,
                      itemCount: state.faqsModel.length,
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 10,
                          width: 10,
                        );
                      },
                      itemBuilder: (context, index) {
                        final faq = state.faqsModel[index];

                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: ExpandableSection(
                              //isImageRequired: false,
                              title: faq.question.toString(),
                              //   title: 'How do I place an order for a blanket on the app?',
                              expendedContent: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 18.w),
                                    child: AppText(
                                      faq.ans.toString(),
                                      // 'To place an order, simply browse through our blanket collection, select the one you like, and click on the "Add to Cart" button. Then, proceed to place order.',
                                      style: Styles.circularStdMedium(context,
                                          fontSize: 16.sp),
                                      maxLine: 5,
                                      // textAlign: TextAlign,
                                    ),
                                  )
                                ],
                              )),
                        );
                      }),
                ),
              ],
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
