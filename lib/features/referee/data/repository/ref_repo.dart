import 'package:dartz/dartz.dart';
import 'package:resala/core/error/failure.dart';
import '../../../../core/error/exception.dart';
import '../../../team/domain/entities/activity.dart';
import '../../domain/entities/ref_category.dart';
import '../../domain/repository/base_ref_repo.dart';
import '../../domain/usecases/get_ref_activities_uc.dart';
import '../../domain/usecases/get_ref_categories_uc.dart';
import '../../domain/usecases/update_ref_activity_uc.dart';
import '../datasource/ref_remote_data_source.dart';

class RefRepo extends BaseRefRepo {
  BaseRefRemoteDataSource baseRefRemoteDataSource;

  RefRepo(this.baseRefRemoteDataSource);

  @override
  Future<Either<Failure, List<RefCategory>>> getRefCategories(
      GetRefCategoriesParameters parameters) async {
    final result = await baseRefRemoteDataSource.getRefCategories(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage[0]));
    }
  }

  @override
  Future<Either<Failure, List<Activity>>> getRefActivities(
      GetRefActivitiesParameters parameters) async {
    final result = await baseRefRemoteDataSource.getRefActivities(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage[0]));
    }
  }

  @override
  Future<Either<Failure, Activity>> updateRefActivity(UpdateRefActivityParameters parameters) async{
    final result = await baseRefRemoteDataSource.updateRefActivity(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage[0]));
    }
  }
}
