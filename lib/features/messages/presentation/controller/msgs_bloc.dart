import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/utils/enums.dart';
import '../../domain/entities/notifi.dart';
import '../../domain/usecases/get_notifications_uc.dart';

part 'msgs_event.dart';

part 'msgs_state.dart';

class MsgsBloc extends Bloc<MsgsEvent, MsgsState> {
  final GetNotificationsUc getNotificationsUc;

  MsgsBloc(this.getNotificationsUc) : super(const MsgsState()) {
    on<GetNotificationsEvent>(_getNotifications);
  }

  FutureOr<void> _getNotifications(
      GetNotificationsEvent event, Emitter<MsgsState> emit) async {
    emit(state.copyWith(msgsRequestStat: RequestState.loading));
    final result =
        await getNotificationsUc.call(event.getNotificationsParameters);
    result.fold(
        (l) => emit(state.copyWith(
            msgsRequestStat: RequestState.error, errorMsgsMessage: l.message)),
        (r) => emit(state.copyWith(
            notifications: r, msgsRequestStat: RequestState.loaded)));
  }
}
