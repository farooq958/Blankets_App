import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hbk/Data/Repository/FeedBack/feed_back_repo.dart';
import 'package:hbk/Presentation/Widgets/Feedback/State/feedback_state.dart';

class FeedBackCubit extends Cubit<FeedBackState> {
  FeedBackCubit() : super(FeedBackInitial());

 Future postFeedBack(Map<String,dynamic>feedBackData) async {
   print("Data $feedBackData");
    emit(FeedBackLoading());
    try {
      await FeedBackRepo().postFeedBack(feedBackData).then((value) {

        if(value==200){
          emit(FeedBackSuccess());

        }
        else{
          print(value);
          emit(FeedBackError(value['error']));
        }
      }).catchError((e) {
        // throw e;
        emit(FeedBackError(e.toString()));
      });
    } catch (e) {
      // rethrow;
      emit(FeedBackError(e.toString()));
    }
  }
}
