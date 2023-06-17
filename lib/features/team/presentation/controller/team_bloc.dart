import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:resala/features/team/domain/usecases/remove_photo_path_uc.dart';
import 'package:resala/features/team/domain/usecases/remove_video_path_uc.dart';
import '../../../../core/utils/enums.dart';
import '../../domain/entities/activity.dart';
import '../../domain/entities/category.dart';
import '../../domain/usecases/add_activity_uc.dart';
import '../../domain/usecases/chose_photos_paths_uc.dart';
import '../../domain/usecases/chose_videos_paths_uc.dart';
import '../../domain/usecases/get_activities_uc.dart';
import '../../domain/usecases/get_categories_uc.dart';
import '../../domain/usecases/set_data_activity_uc.dart';
import '../../domain/usecases/update_activity_uc.dart';

part 'team_event.dart';

part 'team_state.dart';

class TeamBloc extends Bloc<TeamEvent, TeamState> {
  final GetCategoriesUc getCategoriesUc;
  final UpdateActivityUc updateActivityUc;
  final GetActivitiesUc getActivitiesUc;
  final AddActivityUc addActivityUc;
  final ChosePhotosPathsUc chosePhotosPathsUc;
  final ChoseVideosPathsUc choseVideosPathsUc;
  final RemovePhotoPathUc removePhotoPathUc;
  final RemoveVideoPathUc removeVideoPathUc;
  final SetDateActivityUc setDateActivity;

  TeamBloc(
      this.getCategoriesUc,
      this.getActivitiesUc,
      this.updateActivityUc,
      this.addActivityUc,
      this.chosePhotosPathsUc,
      this.choseVideosPathsUc,
      this.setDateActivity,
      this.removePhotoPathUc,
      this.removeVideoPathUc)
      : super(const TeamState()) {
    on<GetCategoriesEvent>(_getCategories);
    on<GetActivitiesEvent>(_getActivities);
    on<AddActivityEvent>(_addActivity);
    on<ChosePhotosPathsEvent>(_chosePhotosPaths);
    on<ChoseVideosPathsEvent>(_choseVideosPaths);
    on<RemovePhotoPathEvent>(_removePhotoPath);
    on<RemoveVideoPathEvent>(_removeVideoPath);
    on<UpdateActivityEvent>(_updateActivities);
    on<SetDateActivityEvent>(_setDateActivity);
    on<GetAllCategoriesAndActivitiesEvent>(_getAllCategoriesAndActivities);
  }

  FutureOr<void> _getAllCategoriesAndActivities(
      GetAllCategoriesAndActivitiesEvent event, Emitter<TeamState> emit) async {
    emit(state.copyWith(teamRequestState: RequestState.loading));
    final resultCategories =
        await getCategoriesUc.call(event.categoriesParameters);
    final resultActivities =
        await getActivitiesUc.call(event.activitiesParameters);
    resultCategories.fold(
        (l) => emit(state.copyWith(
            teamRequestState: RequestState.error, errorTeamMessage: l.message)),
        (r) => emit(state.copyWith(categories: r)));

    resultActivities.fold(
        (l) => emit(state.copyWith(
            teamRequestState: RequestState.error, errorTeamMessage: l.message)),
        (r) => emit(state.copyWith(
            activities: r, teamRequestState: RequestState.loaded)));
  }

  FutureOr<void> _getCategories(
      GetCategoriesEvent event, Emitter<TeamState> emit) async {
    emit(state.copyWith(teamRequestState: RequestState.loading));
    final result = await getCategoriesUc.call(event.parameters);
    result.fold(
        (l) => emit(state.copyWith(
            teamRequestState: RequestState.error, errorTeamMessage: l.message)),
        (r) => emit(state.copyWith(
            categories: r, teamRequestState: RequestState.loaded)));
  }

  FutureOr<void> _getActivities(
      GetActivitiesEvent event, Emitter<TeamState> emit) async {
    emit(state.copyWith(teamRequestState: RequestState.loading));
    final result = await getActivitiesUc.call(event.parameters);
    result.fold(
        (l) => emit(state.copyWith(
            teamRequestState: RequestState.error, errorTeamMessage: l.message)),
        (r) => emit(state.copyWith(
            teamRequestState: RequestState.loaded, activities: r)));
  }

  void _chosePhotosPaths(ChosePhotosPathsEvent event, Emitter<TeamState> emit) {
    emit(state.copyWith(teamRequestState: RequestState.loading));
    final result = chosePhotosPathsUc.change(event.parameters);
    emit(state.copyWith(
        teamRequestState: RequestState.loaded, chosenPhotosPaths: result));
  }

  void _choseVideosPaths(ChoseVideosPathsEvent event, Emitter<TeamState> emit) {
    emit(state.copyWith(teamRequestState: RequestState.loading));
    final result = choseVideosPathsUc.change(event.parameters);
    emit(state.copyWith(
        teamRequestState: RequestState.loaded, chosenVideosPaths: result));
  }

  FutureOr<void> _addActivity(
      AddActivityEvent event, Emitter<TeamState> emit) async {
    emit(state.copyWith(teamRequestState: RequestState.loading));
    final result = await addActivityUc.call(event.parameters);
    result.fold(
        (l) => emit(state.copyWith(
            teamRequestState: RequestState.error,
            errorTeamMessage: l.message)), (r) {
      emit(
          state.copyWith(teamRequestState: RequestState.loaded, activities: r));
    });
  }

  FutureOr<void> _updateActivities(
      UpdateActivityEvent event, Emitter<TeamState> emit) async {
    emit(state.copyWith(teamRequestState: RequestState.loading));
    final result = await updateActivityUc.call(event.parameters);
    result.fold(
        (l) => emit(state.copyWith(
            teamRequestState: RequestState.error,
            errorTeamMessage: l.message)), (r) {
      emit(state.copyWith(teamRequestState: RequestState.loaded));
    });
  }

  FutureOr<void> _removePhotoPath(
      RemovePhotoPathEvent event, Emitter<TeamState> emit) {
    emit(state.copyWith(teamRequestState: RequestState.loading));
    final result = removePhotoPathUc.change(event.parameters);
    List<String> chosenPhotosPaths = List.from(state.chosenPhotosPaths);
    chosenPhotosPaths.removeAt(result);
    emit(state.copyWith(
        teamRequestState: RequestState.loaded,
        chosenPhotosPaths: chosenPhotosPaths));
  }

  FutureOr<void> _removeVideoPath(
      RemoveVideoPathEvent event, Emitter<TeamState> emit) {
    emit(state.copyWith(teamRequestState: RequestState.loading));
    final result = removeVideoPathUc.change(event.parameters);
    List<String> chosenVideosPaths = List.from(state.chosenVideosPaths);
    chosenVideosPaths.removeAt(result);
    emit(state.copyWith(
        teamRequestState: RequestState.loaded,
        chosenVideosPaths: chosenVideosPaths));
  }

  FutureOr<void> _setDateActivity(
      SetDateActivityEvent event, Emitter<TeamState> emit) {
    emit(state.copyWith(teamRequestState: RequestState.loading));
    final result = setDateActivity.change(event.parameters);
    emit(state.copyWith(teamRequestState: RequestState.loaded, date: result));
  }
}
