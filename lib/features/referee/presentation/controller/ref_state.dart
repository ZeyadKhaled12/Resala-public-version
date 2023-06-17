part of 'ref_bloc.dart';

class RefState extends Equatable {
  final List<RefCategory> refCategories;
  final List<Activity> activities;
  final List<Activity> updateActivities;
  final RequestState refRequestState;
  final bool isUpdateRef;
  final String errorRefMessage;

  const RefState(
      {this.refCategories = const [],
      this.activities = const [],
      this.isUpdateRef = false,
      this.updateActivities = const [],
      this.refRequestState = RequestState.loaded,
      this.errorRefMessage = ''});

  RefState copyWith(
      {List<RefCategory>? refCategories,
      List<Activity>? activities,
      List<Activity>? updateActivities,
      RequestState? refRequestState,
      bool? isUpdateRef,
      String? errorRefMessage}) {
    return RefState(
      refCategories: refCategories ?? this.refCategories,
      activities: activities ?? this.activities,
      isUpdateRef: isUpdateRef ?? this.isUpdateRef,
      updateActivities: updateActivities ?? this.updateActivities,
      refRequestState: refRequestState ?? this.refRequestState,
      errorRefMessage: errorRefMessage ?? this.errorRefMessage,
    );
  }

  @override
  List<Object> get props => [
        refCategories,
        activities,
        updateActivities,
        refRequestState,
        isUpdateRef,
        errorRefMessage,
      ];
}
