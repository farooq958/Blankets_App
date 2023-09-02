import 'package:bloc/bloc.dart';
import 'package:flutter_linear_datepicker/month_name_handler.dart';
import 'package:hbk/Data/Repository/Statement/statement_repo.dart';
import 'package:hbk/Domain/Models/Statement/statement_api_model.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/Statement/statement_screen.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part '../State/statement_data_state.dart';

class StatementDataCubit extends Cubit<StatementDataState> {
  StatementDataCubit() : super(StatementDataInitial());

  getStatementDto(String startDate, String endDate) async {


    await Future.delayed(const Duration(milliseconds: 16));
    emit(StatementLoading());
    try {
      print('STartDate--- $startDate');
      print('EndDate--- $endDate');
     DateTime startD= DateTime.parse(startDate);
      DateTime endD= DateTime.parse(endDate);
      print('STartDate--- $startD');
      print('EndDate--- $endD');
      await StatementRepo().getStatementData().then((value) {

        if(value.runtimeType != int) {
          var stateDto = List<StatementApiModel>.from(
              value.map((x) => StatementApiModel.fromMap(x)));
// for(var data in stateDto)
//   {
//     DateTime tempDate = DateFormat("MM/dd/yyyy").parse(data.refDate.toString());
// print(tempDate);
//
//
//   }

      var filteredData=   filterStatementsByDate(stateDto,startD,endD);
 var groupedData= groupStatementsByMonthYear(filteredData);
print(groupedData);
var actualData= getActualData(groupedData) ;


          emit(StatementLoaded(statementData:actualData));
        }
        else
        {
          emit(StatementLogOutState());
        }
      }).catchError((e) {
        throw e;
        emit(StatementError(error: e));
      });
    } catch (e) {
      rethrow;
      emit(StatementError(error:e.toString()));
    }
  }
  Map<String, List<StatementApiModel>> groupStatementsByMonthYear(List<StatementApiModel> statements) {
    Map<String, List<StatementApiModel>> groupedStatements = {};

    for (StatementApiModel statement in statements) {
      if (statement.refDate != null) {
        DateTime statementDate =  DateFormat("MM/dd/yyyy").parse(statement.refDate.toString());

        // Create a key in the format "MMM yyyy" (e.g., "Jan 2023") for the month and year
        String key = "${statementDate.month.gregorianMonthName.toString().padLeft(2, '0')} ${statementDate.year}";

        // Add the statement to the corresponding month/year group
        if (!groupedStatements.containsKey(key)) {
          groupedStatements[key] = [];
        }

        groupedStatements[key]!.add(statement);
      }
    }

    return groupedStatements;
  }
  List<StatementApiModel> filterStatementsByDate(List<StatementApiModel> statements, DateTime startDate, DateTime endDate) {
    List<StatementApiModel> filteredStatements = [];

    for (StatementApiModel statement in statements) {
      if (statement.refDate != null) {
        DateTime statementDate =DateFormat("MM/dd/yyyy").parse(statement.refDate.toString());



        if (statementDate.isAfter(startDate) && statementDate.isBefore(endDate)) {
          filteredStatements.add(statement);
        }
      }
    }

    return filteredStatements;
  }

List<StatementData>  getActualData(Map<String, List<StatementApiModel>> groupedData) {
    List<StatementData> returnDto=[];

    for(var dto in groupedData.entries)
      {
        double debitTotal=0.0;
        double creditTotal=0.0;
        for(var dtoTotal in dto.value ){

          debitTotal += double.parse(dtoTotal.debit.toString());
          creditTotal+= double.parse(dtoTotal.credit.toString());
        }
       print(debitTotal);
        print(creditTotal);

        returnDto.add( StatementData(dto.key, "", "Rs ${creditTotal.toString()} Cr",  "Rs ${debitTotal.toString()} Dr"));
for(var subDto in dto.value)
  {
//print();
  DateTime dt=DateFormat("MM/dd/yyyy").parse(subDto.refDate.toString().split(' ').first);
  var value =subDto.source=='Payment' || subDto.source=='JE' || subDto.source=='CR-NOTE'  ? (double.parse(subDto.debit.toString())> double.parse(subDto.credit.toString())?'${subDto.debit.toString()} Dr'
      :'${subDto.credit.toString()} Cr'):'${subDto.debit.toString()} Dr';
    returnDto.add( StatementData('${dt.day} ${dt.month.gregorianMonthName}, ${dt.year}', subDto.source.toString(), subDto.lineMemo.toString(), value));


  }


      }
return returnDto;

  }


}
