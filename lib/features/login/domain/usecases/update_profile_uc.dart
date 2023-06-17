import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../entities/login.dart';
import '../repository/base_login_repo.dart';

class UpdateProfileUc extends BaseUseCase<Login, UpdateProfileParameters> {
  final BaseLoginRepo basePlayerRepo;

  UpdateProfileUc(this.basePlayerRepo);

  @override
  Future<Either<Failure, Login>> call(
      UpdateProfileParameters parameters) async {
    return await basePlayerRepo.updateProfile(parameters);
  }
}

class UpdateProfileParameters extends Equatable {
  final String token;
  final Login login;
  final String? teamName;
  final String? activityName;
  final String? brunch;
  final String? imagePath;
  final List<String>? members;
  final List<String>? leaders;

  const UpdateProfileParameters(
      {required this.token,
      required this.login,
      this.teamName,
      this.activityName,
      this.imagePath,
      this.brunch,
      this.members,
      this.leaders});

  @override
  List<Object?> get props => [
        token,
        teamName,
        imagePath,
        login,
        activityName,
        brunch,
        members,
        leaders,
      ];
}
