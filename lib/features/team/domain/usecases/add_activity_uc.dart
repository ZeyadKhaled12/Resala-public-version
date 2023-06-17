import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:resala/core/error/failure.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../entities/activity.dart';
import '../repository/base_team_repo.dart';

class AddActivityUc extends BaseUseCase<List<Activity>, AddActivityParameters> {
  final BaseTeamRepo baseTeamRepo;

  AddActivityUc(this.baseTeamRepo);

  @override
  Future<Either<Failure, List<Activity>>> call(
      AddActivityParameters parameters) async {
    return await baseTeamRepo.addActivity(parameters);
  }
}

class AddActivityParameters extends Equatable {
  final String locationName;
  final String activityTitle;
  final String date;
  final String token;
  final List<String> photosPaths;
  final List<String> videosPath;
  final String description;
  final int categoryId;
  final List<Activity> activities;

  const AddActivityParameters(
      {required this.activityTitle,
      required this.locationName,
      required this.activities,
      required this.token,
      required this.date,
      required this.photosPaths,
      required this.videosPath,
      required this.description,
      required this.categoryId});

  @override
  List<Object> get props => [
        activityTitle,
        locationName,
        date,
        token,
        photosPaths,
        videosPath,
        description,
        categoryId,
        activities
      ];
}
