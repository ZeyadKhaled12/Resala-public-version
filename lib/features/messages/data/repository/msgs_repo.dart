import 'package:dartz/dartz.dart';
import 'package:resala/core/error/failure.dart';
import '../../../../core/error/exception.dart';
import '../../domain/entities/notifi.dart';
import '../../domain/repository/base_msgs_repo.dart';
import '../../domain/usecases/get_notifications_uc.dart';
import '../datasource/msgs_remote_data_source.dart';

class MsgsRepo extends BaseMsgsRepo {
  BaseMsgsRemoteDataSource baseMsgsRemoteDataSource;

  MsgsRepo(this.baseMsgsRemoteDataSource);

  @override
  Future<Either<Failure, List<Notifi>>> getNotifications(
      GetNotificationsParameters parameters) async {
    try {
      final result =
          await baseMsgsRemoteDataSource.getNotifications(parameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage[0]));
    }
  }
}
