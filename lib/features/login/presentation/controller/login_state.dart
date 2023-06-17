part of 'login_bloc.dart';

class LoginState extends Equatable {
  final Login login;
  final RequestState loginRequestState;
  final String errorLoginMessage;

  const LoginState(
      {this.login = const Login(
          profileData: ProfileData(
              name: '',
              activityName: '',
              brunch: '',
              members: [],
              leaders: [],
              image: ''),
        token: '',
        isActive: false,
        isReferee: false,
        isTeam: false,
        userName: ''
      ),
      this.loginRequestState = RequestState.loaded,
      this.errorLoginMessage = ''});

  LoginState copyWith(
      {Login? login,
      RequestState? loginRequestState,
      String? errorLoginMessage}) {
    return LoginState(
      login: login ?? this.login,
      loginRequestState: loginRequestState ?? this.loginRequestState,
      errorLoginMessage: errorLoginMessage ?? this.errorLoginMessage,
    );
  }

  @override
  List<Object> get props => [login, loginRequestState, errorLoginMessage];
}
