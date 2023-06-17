import 'package:dartz/dartz.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/activity.dart';
import '../../domain/entities/category.dart';
import '../../domain/repository/base_team_repo.dart';
import '../../domain/usecases/add_activity_uc.dart';
import '../../domain/usecases/chose_photos_paths_uc.dart';
import '../../domain/usecases/chose_videos_paths_uc.dart';
import '../../domain/usecases/get_activities_uc.dart';
import '../../domain/usecases/get_categories_uc.dart';
import '../../domain/usecases/remove_photo_path_uc.dart';
import '../../domain/usecases/remove_video_path_uc.dart';
import '../../domain/usecases/set_data_activity_uc.dart';
import '../../domain/usecases/update_activity_uc.dart';
import '../datasource/team_remote_data_source.dart';

class TeamRepo extends BaseTeamRepo {
  BaseTeamRemoteDataSource baseTeamRemoteDataSource;

  TeamRepo(this.baseTeamRemoteDataSource);

  @override
  Future<Either<Failure, List<Category>>> getCategories(
      GetCategoriesParameters parameters) async {
    try {
      final result = await baseTeamRemoteDataSource.getCategories(parameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage[0]));
    }
  }

  @override
  Future<Either<Failure, List<Activity>>> getActivities(
      GetActivitiesParameters parameters) async {
    try {
      final result = await baseTeamRemoteDataSource.getActivities(parameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage[0]));
    }
  }

  @override
  List<String> chosePhotosPaths(ChosePhotosPathsParameters parameters) {
    List<String> photosPaths = List.from(parameters.photosPaths);
    photosPaths.add(parameters.path);
    return photosPaths;
  }

  @override
  List<String> choseVideosPaths(ChoseVideosPathsParameters parameters) {
    List<String> videosPaths = List.from(parameters.videosPaths);
    videosPaths.add(parameters.path);
    return videosPaths;
  }

  @override
  Future<Either<Failure, List<Activity>>> addActivity(AddActivityParameters parameters) async{
    try {
      final result = await baseTeamRemoteDataSource.addActivity(parameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage[0]));
    }
  }

  @override
  Future<Either<Failure, Activity>> updateActivity(UpdateActivityParameters parameters) async{
    try {
      final result = await baseTeamRemoteDataSource.updateActivity(parameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage[0]));
    }
  }

  @override
  int removePhotoPath(RemovePhotoPathParameters parameters) {
   return parameters.index;
  }

  @override
  int removeVideoPath(RemoveVideoPathParameters parameters) {
    return parameters.index;
  }

  @override
  String setDateActivity(SetDateActivityParameters parameters) {
    return parameters.date;
  }
}
