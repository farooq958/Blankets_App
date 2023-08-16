
import 'package:hbk/Data/DataSource/Resources/imports.dart';


class CheckOutScreen extends StatefulWidget {
  final String totalCtn;
  final double totalPayment;

  const CheckOutScreen(
      {Key? key, required this.totalCtn, required this.totalPayment})
      : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  final userNameController = TextEditingController();
  final mobileNoController = TextEditingController();
  final addressController = TextEditingController();
  final instructionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        shadowColor: Colors.black12,
        backgroundColor: AppColors.whiteColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleIconButton(
            icon: Icons.arrow_back,
            color: AppColors.whiteColor,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 5).r,
          child: AppText(
            "Checkout",
            style: Styles.circularStdBold(context,
                fontSize: 19.sp, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFieldWithOnTap(
                controller: userNameController,
                hintText: AppStrings.userName,
                textInputType: TextInputType.text,
                isBorderRequired: false,
                isShadowRequired: true,
                borderRadius: 30.r,
                prefixIcon: SvgPicture.asset(Assets.profileIcon),
              ),
              CustomTextFieldWithOnTap(
                controller: mobileNoController,
                hintText: AppStrings.mobileNumber,
                textInputType: TextInputType.text,
                isBorderRequired: false,
                isShadowRequired: true,
                borderRadius: 30.r,
                prefixIcon: SvgPicture.asset(Assets.calling),
              ),
              CustomTextFieldWithOnTap(
                controller: addressController,
                hintText: AppStrings.address,
                textInputType: TextInputType.text,
                isBorderRequired: false,
                isShadowRequired: true,
                borderRadius: 10.r,
                // maxline: 2,

                contentPadding:
                    EdgeInsets.symmetric(vertical: 18.h, horizontal: 10.w),

                prefixIcon: SvgPicture.asset(Assets.location),
              ),
              CustomSizedBox.height(20.h),
              AppText(AppStrings.instructionNote,
                  style: Styles.circularStdBold(context, fontSize: 20.sp)),
              CustomTextFieldWithOnTap(
                controller: instructionController,
                hintText: 'Write any instruction',
                textInputType: TextInputType.text,
                isBorderRequired: false,
                isShadowRequired: true,
                maxline: 4,
              ),
              CustomSizedBox.height(60.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText('Total ctn',
                      style: Styles.circularStdMedium(context)),
                  AppText('07', style: Styles.circularStdMedium(context)),
                ],
              ),
              CustomSizedBox.height(10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText('Total amount',
                      style: Styles.circularStdBold(context, fontSize: 18.sp)),
                  AppText('50,790',
                      style: Styles.circularStdBold(context, fontSize: 18.sp)),
                ],
              ),
              CustomSizedBox.height(30.h),
              CustomButton(
                onTap: () {
                  CustomDialog.successConfirmDialog(
                    context,
                    isSvg: true,
                    title: AppStrings.orderConfirmation,
                    message: 'Are you sure you want to place order ?',
                    assetImage: Assets.orderSuccessFull,
                    button1Text: 'Cancel',
                    button2Text: 'Confirm',
                    button1Tap: () {},
                    button2Tap: () {},
                    imageColor: AppColors.blackColor,
                    height: 250.h,
                    width: 1.sw,
                  );
                },
                text: AppStrings.placeOrder,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
