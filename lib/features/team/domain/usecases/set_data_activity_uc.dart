import 'package:equatable/equatable.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../repository/base_team_repo.dart';


class SetDateActivityUc extends BaseUseCaseInside<String, SetDateActivityParameters> {
  final BaseTeamRepo baseTeamRepo;

  SetDateActivityUc(this.baseTeamRepo);

  @override
  String change(SetDateActivityParameters parameters) {
    return baseTeamRepo.setDateActivity(parameters);
  }
}

class SetDateActivityParameters extends Equatable {
  final String date;

  const SetDateActivityParameters({required this.date});

  @override
  List<Object> get props => [date];
}