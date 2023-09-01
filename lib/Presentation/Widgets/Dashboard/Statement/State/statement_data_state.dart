part of '../Controller/statement_data_cubit.dart';

@immutable
abstract class StatementDataState {}

class StatementDataInitial extends StatementDataState {}
class StatementLoading extends StatementDataState {}
class StatementLoaded extends StatementDataState {

  // final  List<> rewData;
  final List<StatementData> statementData;
  StatementLoaded({required this.statementData});

}
class StatementLogOutState extends StatementDataState {}
class StatementError extends StatementDataState {

  final String error;
StatementError({required this.error});

}