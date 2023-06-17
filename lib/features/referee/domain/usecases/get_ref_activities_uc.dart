import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:resala/features/team/domain/entities/activity.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../repository/base_ref_repo.dart';

class GetRefActivitiesUc
    extends BaseUseCase<List<Activity>, GetRefActivitiesParameters> {
  final BaseRefRepo baseRefRepo;

  GetRefActivitiesUc(this.baseRefRepo);

  @override
  Future<Either<Failure, List<Activity>>> call(
      GetRefActivitiesParameters parameters) async {
    return await baseRefRepo.getRefActivities(parameters);
  }
}

class GetRefActivitiesParameters extends Equatable {
  final int categoryId;
  final String token;

  const GetRefActivitiesParameters(
      {required this.categoryId, required this.token});

  @override
  List<Object> get props => [categoryId, token];
}
