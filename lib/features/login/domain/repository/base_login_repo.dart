import 'package:dartz/dartz.dart';
import 'package:resala/core/usecase/base_use_case.dart';
import 'package:resala/features/login/domain/usecases/update_profile_uc.dart';
import '../../../../core/error/failure.dart';
import '../entities/login.dart';
import '../usecases/login_uc.dart';

abstract class BaseLoginRepo{
  Future<Either<Failure, Login>> login(LoginParameters parameters);
  Future captureToken(Login parameters);
  Future<Login> checkIfLoginBefore(NoParameters parameters);
  Future<NoParameters> logout(NoParameters parameters);
  Future<Either<Failure, Login>> updateProfile(UpdateProfileParameters parameters);
}