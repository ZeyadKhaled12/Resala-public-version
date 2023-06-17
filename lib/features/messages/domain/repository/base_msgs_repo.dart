import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/notifi.dart';
import '../usecases/get_notifications_uc.dart';

abstract class BaseMsgsRepo {
  Future<Either<Failure, List<Notifi>>> getNotifications(
      GetNotificationsParameters parameters);
}
