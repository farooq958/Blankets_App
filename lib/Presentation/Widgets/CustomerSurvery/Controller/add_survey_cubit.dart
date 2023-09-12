import 'package:bloc/bloc.dart';
import 'package:hbk/Data/AppData/app_preferences.dart';
import 'package:hbk/Data/Repository/AddSurvey/add_survey_repo.dart';
import 'package:meta/meta.dart';

part 'State/add_survey_state.dart';

class AddSurveyCubit extends Cubit<AddSurveyState> {
  AddSurveyCubit() : super(AddSurveyInitial());

  addSurvey(List<Map<String, String>> data) {
    print(data);
    emit(AddSurveyLoading());
    try {
      AddSurveyRepo().addSurvey(listData: data).then((value) {
        print("here in cubit $value");
        if (value['Message'] == 'Posted Successfuly') {
          emit(AddSurveyLoaded());
        } else {
          emit(AddSurveyError(error: value['Message']));
        }
      });
    } catch (e) {
      emit(AddSurveyError(error: e.toString()));
    }
  }
}
