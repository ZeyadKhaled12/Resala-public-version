import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../entities/notifi.dart';
import '../repository/base_msgs_repo.dart';

class GetNotificationsUc
    extends BaseUseCase<List<Notifi>, GetNotificationsParameters> {
  final BaseMsgsRepo baseMsgsRepo;

  GetNotificationsUc(this.baseMsgsRepo);

  @override
  Future<Either<Failure, List<Notifi>>> call(
      GetNotificationsParameters parameters) async {
    return await baseMsgsRepo.getNotifications(parameters);
  }
}

class GetNotificationsParameters extends Equatable {
  final String token;

  const GetNotificationsParameters({required this.token});

  @override
  List<Object> get props => [token];
}
