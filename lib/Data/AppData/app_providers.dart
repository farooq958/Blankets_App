
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hbk/Presentation/Widgets/AboutUs/Controller/about_us_cubit.dart';
import 'package:hbk/Presentation/Widgets/ContactUs/Controller/contact_us_cubit.dart';
import 'package:hbk/Presentation/Widgets/FAQS/Controller/faqs_cubit.dart';

List<BlocProvider> appProviders = [

  BlocProvider<AboutUsCubit>(create: (context)=>AboutUsCubit()),
  BlocProvider<ContactUsCubit>(create: (context)=> ContactUsCubit()),
  BlocProvider<FaqsCubit>(create: (context)=> FaqsCubit()),
];