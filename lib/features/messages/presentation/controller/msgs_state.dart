part of 'msgs_bloc.dart';

class MsgsState extends Equatable {
  final List<Notifi> notifications;
  final RequestState msgsRequestStat;
  final String errorMsgsMessage;

  const MsgsState(
      {this.notifications = const [],
      this.msgsRequestStat = RequestState.loaded,
      this.errorMsgsMessage = ''});

  MsgsState copyWith(
      {List<Notifi>? notifications,
      RequestState? msgsRequestStat,
      String? errorMsgsMessage}) {
    return MsgsState(
      notifications: notifications ?? this.notifications,
      msgsRequestStat: msgsRequestStat ?? this.msgsRequestStat,
      errorMsgsMessage: errorMsgsMessage ?? this.errorMsgsMessage,
    );
  }

  @override
  List<Object> get props => [notifications, msgsRequestStat, errorMsgsMessage];
}
