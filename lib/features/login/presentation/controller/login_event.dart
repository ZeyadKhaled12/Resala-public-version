part of 'login_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends RegisterEvent {
  final LoginParameters loginParameters;

  const LoginEvent({required this.loginParameters});

  @override
  List<Object> get props => [loginParameters];
}

class UpdateLoginEvent extends RegisterEvent {
  final Login login;

  const UpdateLoginEvent({required this.login});

  @override
  List<Object> get props => [login];
}

class CaptureTokenEvent extends RegisterEvent {
  final Login login;

  const CaptureTokenEvent({required this.login});

  @override
  List<Object> get props => [login];
}

class CheckIfLoginBeforeEvent extends RegisterEvent {
  final NoParameters noParameters;

  const CheckIfLoginBeforeEvent({required this.noParameters});

  @override
  List<Object> get props => [noParameters];
}

class LogoutEvent extends RegisterEvent {
  final NoParameters noParameters;

  const LogoutEvent({required this.noParameters});

  @override
  List<Object> get props => [noParameters];
}

class UpdateProfileEvent extends RegisterEvent {
  final UpdateProfileParameters updateProfileParameters;

  const UpdateProfileEvent({required this.updateProfileParameters});

  @override
  List<Object> get props => [updateProfileParameters];
}



