import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:resala/features/login/domain/entities/profile_data.dart';
import 'package:resala/features/login/domain/usecases/logout_uc.dart';
import 'package:resala/features/login/domain/usecases/update_profile_uc.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../../../../core/utils/enums.dart';
import '../../domain/entities/login.dart';
import '../../domain/usecases/capture_token_uc.dart';
import '../../domain/usecases/check_if_login_before_uc.dart';
import '../../domain/usecases/login_uc.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<RegisterEvent, LoginState> {
  final LoginUc loginUc;
  final CaptureTokenUc captureTokenUc;
  final CheckIfLoginBeforeUc checkIfLoginBeforeUc;
  final LogoutUc logoutUc;
  final UpdateProfileUc updateProfileUc;

  LoginBloc(this.loginUc, this.captureTokenUc, this.checkIfLoginBeforeUc,
      this.logoutUc, this.updateProfileUc)
      : super(const LoginState()) {
    on<LoginEvent>(_login);
    on<CaptureTokenEvent>(_captureToken);
    on<CheckIfLoginBeforeEvent>(_checkIfLoginBefore);
    on<LogoutEvent>(_logout);
    on<UpdateProfileEvent>(_updateProfile);
    on<UpdateLoginEvent>(_updateLogin);
  }

  FutureOr<void> _login(LoginEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(loginRequestState: RequestState.loading));
    final result = await loginUc.call(event.loginParameters);
    result.fold(
        (l) => emit(state.copyWith(
            loginRequestState: RequestState.error,
            errorLoginMessage: l.message)), (r) {
      add(CaptureTokenEvent(login: r));
      emit(state.copyWith(login: r, loginRequestState: RequestState.loaded));
    });
  }

  FutureOr<void> _captureToken(
      CaptureTokenEvent event, Emitter<LoginState> emit) async {
    await captureTokenUc.change(event.login);
  }

  FutureOr<void> _checkIfLoginBefore(
      CheckIfLoginBeforeEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(loginRequestState: RequestState.loading));
    final result = await checkIfLoginBeforeUc.change(event.noParameters);
    if (result.token.isNotEmpty) {
      emit(state.copyWith(login: result));
    }
    emit(state.copyWith(loginRequestState: RequestState.loaded));
  }

  FutureOr<void> _logout(LogoutEvent event, Emitter<LoginState> emit) async {
    await logoutUc.change(event.noParameters);
  }

  FutureOr<void> _updateProfile(
      UpdateProfileEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(loginRequestState: RequestState.loading));
    final result = await updateProfileUc.call(event.updateProfileParameters);
    result.fold(
        (l) => emit(state.copyWith(
            loginRequestState: RequestState.error,
            errorLoginMessage: l.message)),
        (r) => emit(
            state.copyWith(login: r, loginRequestState: RequestState.loaded)));
  }

  FutureOr<void> _updateLogin(UpdateLoginEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(loginRequestState: RequestState.loading));
    emit(state.copyWith(loginRequestState: RequestState.loaded, login: event.login));
  }
}
