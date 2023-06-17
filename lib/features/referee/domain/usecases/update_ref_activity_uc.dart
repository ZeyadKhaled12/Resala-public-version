import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../../../team/domain/entities/activity.dart';
import '../entities/update_ref_activity.dart';
import '../repository/base_ref_repo.dart';

class UpdateRefActivityUc
    extends BaseUseCase<Activity, UpdateRefActivityParameters> {
  final BaseRefRepo baseRefRepo;

  UpdateRefActivityUc(this.baseRefRepo);

  @override
  Future<Either<Failure, Activity>> call(
      UpdateRefActivityParameters parameters) async {
    return await baseRefRepo.updateRefActivity(parameters);
  }
}

class UpdateRefActivityParameters extends Equatable {
  final int activityId;
  final UpdateRefActivity updateRefActivity;
  final String token;

  const UpdateRefActivityParameters(
      {required this.activityId, required this.updateRefActivity, required this.token});

  @override
  List<Object> get props => [activityId, updateRefActivity, token];
}
