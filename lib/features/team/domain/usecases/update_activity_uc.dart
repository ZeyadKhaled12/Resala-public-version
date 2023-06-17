import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:resala/core/error/failure.dart';

import '../../../../core/usecase/base_use_case.dart';
import '../entities/activity.dart';
import '../repository/base_team_repo.dart';

class UpdateActivityUc extends BaseUseCase<Activity, UpdateActivityParameters> {
  final BaseTeamRepo baseTeamRepo;

  UpdateActivityUc(this.baseTeamRepo);

  @override
  Future<Either<Failure, Activity>> call(
      UpdateActivityParameters parameters) async {
    return await baseTeamRepo.updateActivity(parameters);
  }
}

class UpdateActivityParameters extends Equatable {
  final bool isFlagUpdated;
  final String token;
  final int index;
  final Activity activity;

  const UpdateActivityParameters(
      {required this.token,
        required this.index,
      this.isFlagUpdated = false,
      required this.activity});

  @override
  List<Object> get props => [isFlagUpdated];
}
