import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:resala/core/utils/app_constance.dart';
import 'package:resala/features/team/domain/entities/activity.dart';
import '../../../../core/utils/enums.dart';
import '../../domain/entities/ref_category.dart';
import '../../domain/usecases/get_ref_activities_uc.dart';
import '../../domain/usecases/get_ref_categories_uc.dart';
import '../../domain/usecases/update_ref_activity_uc.dart';

part 'ref_event.dart';

part 'ref_state.dart';

class RefBloc extends Bloc<RefEvent, RefState> {
  final GetRefCategoriesUc getRefCategoriesUc;
  final GetRefActivitiesUc getRefActivitiesUc;
  final UpdateRefActivityUc updateRefActivityUc;

  RefBloc(this.getRefCategoriesUc, this.getRefActivitiesUc,
      this.updateRefActivityUc)
      : super(const RefState()) {
    on<GetRefCategoriesEvent>(_getRefCategories);
    on<GetRefActivitiesEvent>(_getRefActivities);
    on<UpdateRefActivityEvent>(_updateRefActivity);
    on<GetUpdateRefActivitiesEvent>(_detUpdateRefActivities);
  }

  FutureOr<void> _getRefCategories(
      GetRefCategoriesEvent event, Emitter<RefState> emit) async {
    emit(state.copyWith(refRequestState: RequestState.loading));
    final result = await getRefCategoriesUc.call(event.parameters);
    result.fold(
        (l) => emit(state.copyWith(
            refRequestState: RequestState.error, errorRefMessage: l.message)),
        (r) => emit(state.copyWith(
            refRequestState: RequestState.loaded, refCategories: r)));
  }

  FutureOr<void> _getRefActivities(
      GetRefActivitiesEvent event, Emitter<RefState> emit) async {
    emit(state.copyWith(refRequestState: RequestState.loading));
    final result = await getRefActivitiesUc.call(event.parameters);
    result.fold(
        (l) => emit(state.copyWith(
            refRequestState: RequestState.error,
            errorRefMessage: l.message)), (r) {
      emit(state.copyWith(
          refRequestState: RequestState.loaded,
          activities: r,
          updateActivities: r));
    });
  }

  FutureOr<void> _updateRefActivity(
      UpdateRefActivityEvent event, Emitter<RefState> emit) async {
    emit(state.copyWith(refRequestState: RequestState.loading));
    final result = await updateRefActivityUc.call(event.parameters);
    result.fold(
        (l) => emit(state.copyWith(
            refRequestState: RequestState.error,
            errorRefMessage: l.message)), (r) {
      emit(state.copyWith(isUpdateRef: true, refRequestState:  RequestState.loaded));
    });
  }

  FutureOr<void> _detUpdateRefActivities(
      GetUpdateRefActivitiesEvent event, Emitter<RefState> emit) {
    emit(state.copyWith(refRequestState: RequestState.loading));
    List<Activity> listActivities = List.from(state.activities);
    int index = 0;
    if (event.status == 'all') {
      emit(state.copyWith(
          refRequestState: RequestState.loaded,
          updateActivities: state.activities));
    } else {
      while (index < listActivities.length) {
        if (event.status == AppConstance.flag) {
          if (!listActivities[index].isFlag) {
            listActivities.removeAt(index);
            continue;
          }
        } else {
          if (listActivities[index].status != event.status) {
            listActivities.removeAt(index);
            continue;
          }
        }
        index++;
      }
      emit(state.copyWith(
          refRequestState: RequestState.loaded,
          updateActivities: listActivities));
    }
  }
}
