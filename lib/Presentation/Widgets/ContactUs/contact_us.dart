import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hbk/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:hbk/Data/DataSource/Resources/imports.dart';
import 'package:hbk/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:hbk/Presentation/Widgets/ContactUs/Controller/contact_us_cubit.dart';
import 'package:hbk/Presentation/Widgets/ContactUs/State/contact_us_state.dart';
import 'package:url_launcher/url_launcher.dart';




class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {

  @override
  void initState() {
    // TODO: implement initState
    context.read<ContactUsCubit>().getContactUsData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWithBackButton(
        title: AppStrings.contactUs,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
        child: BlocConsumer<ContactUsCubit, ContactUsState>(
          listener: (context, state) {
            print("State $state");
            // TODO: implement listener
            if(state is ContactUsLoading){
              LoadingDialog.showLoadingDialog(context);
            }if(state is ContactUsSuccess){
              Navigator.of(context).pop(true);
            }
          },
          builder: (context, state) {
           if(state is ContactUsSuccess){
             // print("Branche ${state.contactUsData[0].branches![0].phone}");
             print("Data is ${state.contactUsData}");
             return Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.start,
               children: [

                 /// expandable widget

                 Expanded(
                   child: ListView.separated(itemBuilder: (context,index){


                     final timings = state.contactUsData.branches![index].timing.toString();

                     final timingss = timings.getOfficeTimings(timings);

                     final summerTimings = timingss[0];
                     final winterTimings = timingss[1];

                     // print('Summer Timings: $summerTimings');
                     // print('Winter Timings: $winterTimings');
                    return ExpandableTileWidget(
                      text: state.contactUsData.branches![index].name,
                       isImageRequired: true,
                       imageUrl: Assets.appLogo,
                       expendedContent: ExpandableContents(

                         button1onTap: () {
                           CustomDialog.dialog(
                               context,
                               SizedBox(
                                   width: 1.sw,
                                   height: 1.sh / 3,
                                   child: Column(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                       CustomButton(
                                         onTap: () async {
                                           Uri phoneNo = Uri.parse(
                                                'tel:${ state.contactUsData.branches![index].phone.toString().trim()}',

                                           );
                                           if (await launchUrl(phoneNo)) {
                                             //dialer opened
                                           } else {
                                             //dailer is not opened
                                           }
                                         },
                                         text: state.contactUsData.branches![index].phone.toString().trim(),
                                         // text: '+92 300 85 42 950',

                                         horizontalMargin: 20.w,
                                         leadingIcon: Assets.calling,
                                         leadingSvgIcon: true,
                                         gapWidth: 10.sp,
                                         iconColor: AppColors.primaryColor,
                                         bgColor: AppColors.whiteColor,
                                         textColor: AppColors.blackColor,
                                       ),
                                       CustomSizedBox.height(20.h),
                                       CustomButton(
                                         onTap: () async {
                                           Uri phoneNo = Uri.parse(
                                               // 'tel:+9291111222550'
                                             "tel:${state.contactUsData.branches![index].mobile.toString()}"
                                           );
                                           if (await launchUrl(phoneNo)) {
                                             //dialer opened
                                           } else {
                                             //dailer is not opened
                                           }
                                         },
                                         gapWidth: 10.sp,
                                         text: state.contactUsData.branches![index].mobile.toString().trim(),
                                         horizontalMargin: 20.w,
                                         leadingIcon: Assets.calling,
                                         leadingSvgIcon: true,
                                         iconColor: AppColors.primaryColor,
                                         bgColor: AppColors.whiteColor,
                                         textColor: AppColors.blackColor,
                                       ),
                                     ],
                                   )));
                         },
                         button1Text: 'Call',
                         location: state.contactUsData.branches![index].address.toString().trim(),

                         button2Text: state.contactUsData.branches![index].email.toString().trim(),

                         // summerTiming: state.contactUsData.branches![index].timing.toString().trim(),
                         summerTiming: summerTimings,
                         winterTiming: winterTimings,

                       ),
                     );
                   }, separatorBuilder: (context,index){
                     return CustomSizedBox.height(10.h);
                   }, itemCount: state.contactUsData.branches!.length),
                 )

               ],
             );
           }else{
             return const SizedBox();
           }
          },
        ),
      ),
    );
  }
}


