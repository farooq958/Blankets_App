import 'package:bloc/bloc.dart';
import 'package:hbk/Data/Repository/Reward/reward_repo.dart';
import 'package:hbk/Domain/Models/Reward/reward_api_model.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/RewardScreen/reward_screen.dart';
import 'package:meta/meta.dart';

part '../State/reward_controller_state.dart';

class RewardControllerCubit extends Cubit<RewardControllerState> {
  RewardControllerCubit() : super(RewardControllerInitial());

  getRewardDto() async {


    await Future.delayed(const Duration(milliseconds: 16));
    emit(RewardLoading());
    try {

      await RewardRepo().getRewardData().then((value) {

        if(value.runtimeType != int) {
          var rewardDto = List<RewardApiModel>.from(
              value.map((x) => RewardApiModel.fromMap(x)));
         // Utils.dashData=dashData;
List<RewardModel> actualRewardData= [];
for(var i in rewardDto)
  {
    actualRewardData.add(RewardModel(session: '${i.startDate?.split(' ').first}-${i.endDate?.split(' ').first}',

    status:'${i.loyal.toString()} ${i.status.toString()}' ,
      netSale: i.netSales.toString(),
      bonusReward: i.reward.toString() ,
      loyalReward: i.loyalReward.toString(),
      totalReward: (double.parse(i.loyalReward.toString()) + double.parse(i.reward.toString()) ).toString(),

    ));

  }

          emit(RewardLoaded(rewData: rewardDto,actualRewardData:actualRewardData));
        }
        else
        {
          emit(RewardLogOutState());
        }
      }).catchError((e) {
        //throw e;
        emit(RewardError(error: e));
      });
    } catch (e) {
      //rethrow;
      emit(RewardError(error:e.toString()));
    }
  }

}
