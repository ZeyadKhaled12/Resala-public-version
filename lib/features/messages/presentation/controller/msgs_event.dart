part of 'msgs_bloc.dart';

abstract class MsgsEvent extends Equatable {
  const MsgsEvent();

  @override
  List<Object> get props => [];
}

class GetNotificationsEvent extends MsgsEvent {
  final GetNotificationsParameters getNotificationsParameters;

  const GetNotificationsEvent({required this.getNotificationsParameters});

  @override
  List<Object> get props => [getNotificationsParameters];
}
