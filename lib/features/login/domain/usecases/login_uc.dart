import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../entities/login.dart';
import '../repository/base_login_repo.dart';

class LoginUc extends BaseUseCase<Login, LoginParameters> {
  final BaseLoginRepo basePlayerRepo;

  LoginUc(this.basePlayerRepo);

  @override
  Future<Either<Failure, Login>> call(LoginParameters parameters) async{
    return await basePlayerRepo.login(parameters);
  }
}

class LoginParameters extends Equatable {
  final String userName;
  final String password;

  const LoginParameters({required this.userName, required this.password});

  @override
  List<Object> get props => [userName, password];
}