import 'package:dartz/dartz.dart';
import 'package:resala/features/team/domain/usecases/remove_video_path_uc.dart';
import '../../../../core/error/failure.dart';
import '../entities/activity.dart';
import '../entities/category.dart';
import '../usecases/add_activity_uc.dart';
import '../usecases/chose_photos_paths_uc.dart';
import '../usecases/chose_videos_paths_uc.dart';
import '../usecases/get_activities_uc.dart';
import '../usecases/get_categories_uc.dart';
import '../usecases/remove_photo_path_uc.dart';
import '../usecases/set_data_activity_uc.dart';
import '../usecases/update_activity_uc.dart';


abstract class BaseTeamRepo{
  Future<Either<Failure, List<Category>>> getCategories(GetCategoriesParameters parameters);
  Future<Either<Failure, List<Activity>>> getActivities(GetActivitiesParameters parameters);
  Future<Either<Failure, List<Activity>>> addActivity(AddActivityParameters parameters);
  Future<Either<Failure, Activity>> updateActivity(UpdateActivityParameters parameters);
  List<String> chosePhotosPaths(ChosePhotosPathsParameters parameters);
  List<String> choseVideosPaths(ChoseVideosPathsParameters parameters);
  int removePhotoPath(RemovePhotoPathParameters parameters);
  int removeVideoPath(RemoveVideoPathParameters parameters);
  String setDateActivity(SetDateActivityParameters parameters);

}