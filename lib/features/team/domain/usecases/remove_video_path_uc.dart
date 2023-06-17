import 'package:equatable/equatable.dart';

import '../../../../core/usecase/base_use_case.dart';
import '../repository/base_team_repo.dart';

class RemoveVideoPathUc
    extends BaseUseCaseInside<int, RemoveVideoPathParameters> {
  final BaseTeamRepo baseTeamRepo;

  RemoveVideoPathUc(this.baseTeamRepo);

  @override
  int change(RemoveVideoPathParameters parameters) {
    return baseTeamRepo.removeVideoPath(parameters);
  }

}

class RemoveVideoPathParameters extends Equatable {
  final int index;

  const RemoveVideoPathParameters({required this.index});

  @override
  List<Object> get props => [index];
}