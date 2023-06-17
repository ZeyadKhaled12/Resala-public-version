
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../entities/activity.dart';
import '../repository/base_team_repo.dart';


class GetActivitiesUc extends BaseUseCase<List<Activity>, GetActivitiesParameters> {
  final BaseTeamRepo baseTeamRepo;

  GetActivitiesUc(this.baseTeamRepo);

  @override
  Future<Either<Failure, List<Activity>>> call(GetActivitiesParameters parameters) async {
    return await baseTeamRepo.getActivities(parameters);
  }
}

class GetActivitiesParameters extends Equatable {
  final String token;

  const GetActivitiesParameters({required this.token});

  @override
  List<Object> get props => [token];
}