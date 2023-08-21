

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hbk/Presentation/Widgets/ContactUs/Controller/in_out_cubit.dart';

List<BlocProvider> appProviders = [
  BlocProvider<InOutCubit>(create: (context) => InOutCubit()),
];