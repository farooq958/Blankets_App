import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hbk/Presentation/Widgets/AboutUs/Controller/about_us_cubit.dart';
import 'package:hbk/Presentation/Widgets/Auth/Controller/login_cubit.dart';
import 'package:hbk/Presentation/Widgets/ContactUs/Controller/in_out_cubit.dart';
import 'package:hbk/Presentation/Widgets/CustomerSurvery/Controller/add_survey_cubit.dart';
import 'package:hbk/Presentation/Widgets/CustomerSurvery/Controller/customer_survey_cubit.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/CartScreen/Controller/add_cart_cubit.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/CartScreen/Controller/cart_cubit.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/CartScreen/Controller/cart_grand_total_map_cubit.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/CartScreen/Controller/post_order_cubit.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/CartScreen/Controller/update_user_data_cubit.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/DashboardBottomScreen/Controller/dashboard_bottom_cubit.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/HomeScreen/Controller/category_cubit.dart';
import 'package:hbk/Presentation/Widgets/ContactUs/Controller/contact_us_cubit.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/HomeScreen/Controller/new_arrival_product_cubit.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/HomeScreen/SliderImages/Controller/slider_images_cubit.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/InvoiceScreen/Controller/invoice_cubit.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/InvoiceScreen/Controller/invoice_detail_cubit.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/Orders/Controller/orders_cubit.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/ProfileScreen/Controller/create_new_password_cubit.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/RewardScreen/Controller/reward_controller_cubit.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/SearchScreen/Controller/all_products_cubit.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/Statement/Controller/statement_data_cubit.dart';
import 'package:hbk/Presentation/Widgets/FAQS/Controller/faqs_cubit.dart';
import 'package:hbk/Presentation/Widgets/Feedback/Controller/feedback_cubit.dart';
import 'package:hbk/Presentation/Widgets/Notifications/Controller/notification_cubit.dart';
import 'package:hbk/Presentation/Widgets/Notifications/Controller/read_notification_cubit.dart';

List<BlocProvider> appProviders = [
//   BlocProvider<InOutCubit>(create: (context) => InOutCubit()),
//   BlocProvider<AboutUsCubit>(create: (context) => AboutUsCubit()),
//   BlocProvider<CategoryCubit>(create: (context) => CategoryCubit()),
//   BlocProvider<ContactUsCubit>(create: (context) => ContactUsCubit()),
//   BlocProvider<FaqsCubit>(create: (context) => FaqsCubit()),
//   BlocProvider<NewArrivalProductCubit>(
//       create: (context) => NewArrivalProductCubit()),
//   BlocProvider<LoginCubit>(create: (context) => LoginCubit()),
//   BlocProvider<AllProductsCubit>(
//       create: (context) => AllProductsCubit()..getAllProducts()),
//   BlocProvider<DashboardBottomCubit>(
//       create: (context) => DashboardBottomCubit()),
//   BlocProvider<RewardControllerCubit>(
//       create: (context) => RewardControllerCubit()),
//   BlocProvider<StatementDataCubit>(create: (context) => StatementDataCubit())
// ];

  BlocProvider<InOutCubit>(create: (context) => InOutCubit()),
  BlocProvider<AboutUsCubit>(create: (context) => AboutUsCubit()),
  BlocProvider<CategoryCubit>(create: (context) => CategoryCubit()),
  BlocProvider<ContactUsCubit>(create: (context) => ContactUsCubit()),
  BlocProvider<FaqsCubit>(create: (context) => FaqsCubit()),
  BlocProvider<NewArrivalProductCubit>(
      create: (context) => NewArrivalProductCubit()),
  BlocProvider<LoginCubit>(create: (context) => LoginCubit()),
  BlocProvider<AllProductsCubit>(create: (context) => AllProductsCubit()),
  BlocProvider<DashboardBottomCubit>(
      create: (context) => DashboardBottomCubit()),
  BlocProvider<RewardControllerCubit>(
      create: (context) => RewardControllerCubit()),
  BlocProvider<StatementDataCubit>(create: (context) => StatementDataCubit()),
  BlocProvider<NotificationCubit>(create: (context) => NotificationCubit()),
  BlocProvider<ReadNotificationCubit>(
      create: (context) => ReadNotificationCubit()),

  BlocProvider<AboutUsCubit>(create: (context) => AboutUsCubit()),
  BlocProvider<CategoryCubit>(create: (context) => CategoryCubit()),
  BlocProvider<ContactUsCubit>(create: (context) => ContactUsCubit()),
  BlocProvider<FaqsCubit>(create: (context) => FaqsCubit()),
  BlocProvider<NewArrivalProductCubit>(
      create: (context) => NewArrivalProductCubit()),
  BlocProvider<LoginCubit>(create: (context) => LoginCubit()),
  BlocProvider<AllProductsCubit>(create: (context) => AllProductsCubit()),
  BlocProvider<DashboardBottomCubit>(
      create: (context) => DashboardBottomCubit()),
  BlocProvider<RewardControllerCubit>(
      create: (context) => RewardControllerCubit()),
  BlocProvider<StatementDataCubit>(create: (context) => StatementDataCubit()),
  BlocProvider<RewardControllerCubit>(
      create: (context) => RewardControllerCubit()),

  BlocProvider<FeedBackCubit>(create: (context) => FeedBackCubit()),

  BlocProvider<SliderImagesCubit>(create: (context) => SliderImagesCubit()),

  BlocProvider<CustomerSurveyQuestionCubit>(
      create: (context) => CustomerSurveyQuestionCubit()),
  BlocProvider<InvoiceCubit>(create: (context) => InvoiceCubit()),
  BlocProvider<InvoiceDetailCubit>(create: (context) => InvoiceDetailCubit()),
  BlocProvider<CartGrandTotalMapCubit>(
      create: (context) => CartGrandTotalMapCubit()),
  BlocProvider<CartCubit>(create: (context) => CartCubit()),
  BlocProvider<AddSurveyCubit>(create: (context) => AddSurveyCubit()),
  BlocProvider<OrdersCubit>(create: (context) => OrdersCubit()),
  BlocProvider<CreateNewPasswordCubit>(
      create: (context) => CreateNewPasswordCubit()),
  BlocProvider<PostOrderCubit>(create: (context) => PostOrderCubit()),
  BlocProvider<UpdateUserDataCubit>(create: (context) => UpdateUserDataCubit())
];
