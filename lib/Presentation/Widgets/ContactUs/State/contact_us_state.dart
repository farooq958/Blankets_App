
import 'package:flutter/cupertino.dart';
import 'package:hbk/Domain/Models/ContactUs/contact_us_model.dart';
import 'package:hbk/Presentation/Widgets/ContactUs/contact_us.dart';

@immutable
abstract class ContactUsState {
  const ContactUsState();
}

class ContactUsInitial extends ContactUsState{const ContactUsInitial();}

class ContactUsLoading extends ContactUsState{
  const ContactUsLoading();
}
class ContactUsError extends ContactUsState{
  final String errorMsg;

  const ContactUsError(this.errorMsg);
}

class ContactUsSuccess extends ContactUsState{
  final ContactUs contactUsData;

  const ContactUsSuccess(this.contactUsData);
}