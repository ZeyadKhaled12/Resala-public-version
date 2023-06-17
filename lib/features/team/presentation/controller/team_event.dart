part of 'team_bloc.dart';

abstract class TeamEvent extends Equatable {
  const TeamEvent();

  @override
  List<Object> get props => [];
}

class GetAllCategoriesAndActivitiesEvent extends TeamEvent {
  final GetCategoriesParameters categoriesParameters;
  final GetActivitiesParameters activitiesParameters;

  const GetAllCategoriesAndActivitiesEvent(
      {required this.categoriesParameters, required this.activitiesParameters});

  @override
  List<Object> get props => [categoriesParameters, activitiesParameters];
}

class GetCategoriesEvent extends TeamEvent {
  final GetCategoriesParameters parameters;

  const GetCategoriesEvent({required this.parameters});

  @override
  List<Object> get props => [parameters];
}

class GetActivitiesEvent extends TeamEvent {
  final GetActivitiesParameters parameters;

  const GetActivitiesEvent({required this.parameters});

  @override
  List<Object> get props => [parameters];
}

class ChosePhotosPathsEvent extends TeamEvent {
  final ChosePhotosPathsParameters parameters;

  const ChosePhotosPathsEvent({required this.parameters});

  @override
  List<Object> get props => [parameters];
}

class ChoseVideosPathsEvent extends TeamEvent {
  final ChoseVideosPathsParameters parameters;

  const ChoseVideosPathsEvent({required this.parameters});

  @override
  List<Object> get props => [parameters];
}

class UpdateActivityEvent extends TeamEvent {
  final UpdateActivityParameters parameters;

  const UpdateActivityEvent({required this.parameters});

  @override
  List<Object> get props => [parameters];
}

class AddActivityEvent extends TeamEvent {
  final AddActivityParameters parameters;

  const AddActivityEvent({required this.parameters});

  @override
  List<Object> get props => [parameters];
}

class RemovePhotoPathEvent extends TeamEvent {
  final RemovePhotoPathParameters parameters;

  const RemovePhotoPathEvent({required this.parameters});

  @override
  List<Object> get props => [parameters];
}

class RemoveVideoPathEvent extends TeamEvent {
  final RemoveVideoPathParameters parameters;

  const RemoveVideoPathEvent({required this.parameters});

  @override
  List<Object> get props => [parameters];
}

class SetDateActivityEvent extends TeamEvent {
  final SetDateActivityParameters parameters;

  const SetDateActivityEvent({required this.parameters});

  @override
  List<Object> get props => [parameters];
}
