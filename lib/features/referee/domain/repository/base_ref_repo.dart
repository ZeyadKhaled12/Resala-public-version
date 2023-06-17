import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../team/domain/entities/activity.dart';
import '../entities/ref_category.dart';
import '../usecases/get_ref_activities_uc.dart';
import '../usecases/get_ref_categories_uc.dart';
import '../usecases/update_ref_activity_uc.dart';

abstract class BaseRefRepo {
  Future<Either<Failure, List<RefCategory>>> getRefCategories(
      GetRefCategoriesParameters parameters);
  Future<Either<Failure, List<Activity>>> getRefActivities(
      GetRefActivitiesParameters parameters);
  Future<Either<Failure, Activity>> updateRefActivity(
      UpdateRefActivityParameters parameters);

}
