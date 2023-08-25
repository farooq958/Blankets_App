part of '../Controller/about_us_cubit.dart';

@immutable
abstract class AboutUsState {}

class AboutUsInitial extends AboutUsState {}


class AboutUsLoading extends AboutUsState{
  AboutUsLoading();
}
class DummyState  extends AboutUsState{}
class AboutUsError extends AboutUsState{
  final String? errorMsg;

  AboutUsError(this.errorMsg);
}

class AboutUsSuccess extends AboutUsState{
  final AboutUs? aboutUsModel;

  AboutUsSuccess(this.aboutUsModel);
}