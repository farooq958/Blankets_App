

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hbk/Presentation/Widgets/AboutUs/Controller/about_us_cubit.dart';
import 'package:hbk/Presentation/Widgets/Auth/Controller/login_cubit.dart';
import 'package:hbk/Presentation/Widgets/ContactUs/Controller/in_out_cubit.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/HomeScreen/Controller/category_cubit.dart';
import 'package:hbk/Presentation/Widgets/ContactUs/Controller/contact_us_cubit.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/HomeScreen/Controller/new_arrival_product_cubit.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/SearchScreen/Controller/all_products_cubit.dart';
import 'package:hbk/Presentation/Widgets/FAQS/Controller/faqs_cubit.dart';

List<BlocProvider> appProviders = [
  BlocProvider<InOutCubit>(create: (context) => InOutCubit()),

  BlocProvider<AboutUsCubit>(create: (context)=>AboutUsCubit()),
  BlocProvider<CategoryCubit>(create: (context)=>CategoryCubit()),
  BlocProvider<ContactUsCubit>(create: (context)=> ContactUsCubit()),
  BlocProvider<FaqsCubit>(create: (context)=> FaqsCubit()),
  BlocProvider<NewArrivalProductCubit>(create: (context)=>NewArrivalProductCubit()),
  BlocProvider<LoginCubit>(create: (context)=>LoginCubit()),
  BlocProvider<AllProductsCubit>(create: (context)=>AllProductsCubit()..getAllProducts())
];