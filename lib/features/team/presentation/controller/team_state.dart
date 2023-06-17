part of 'team_bloc.dart';

class TeamState extends Equatable {
  final List<Category> categories;
  final List<String> chosenPhotosPaths;
  final List<String> chosenVideosPaths;
  final List<Activity> activities;
  final String date;
  final RequestState teamRequestState;
  final String errorTeamMessage;

  const TeamState({this.categories = const [],
    this.chosenPhotosPaths = const [],
    this.chosenVideosPaths = const [],
    this.date = '',
    this.activities = const [],
    this.teamRequestState = RequestState.loaded,
    this.errorTeamMessage = ''});

  TeamState copyWith({List<Category>? categories,
    List<String>? chosenPhotosPaths,
    List<String>? chosenVideosPaths,
    String? date,
    List<Activity>? activities,
    RequestState? teamRequestState,
    String? errorTeamMessage}) {
    return TeamState(
        activities: activities ?? this.activities,
        date: date ?? this.date,
        categories: categories ?? this.categories,
        chosenVideosPaths: chosenVideosPaths ?? this.chosenVideosPaths,
        chosenPhotosPaths: chosenPhotosPaths ?? this.chosenPhotosPaths,
        teamRequestState: teamRequestState ?? this.teamRequestState,
        errorTeamMessage: errorTeamMessage ?? this.errorTeamMessage);
  }

  @override
  List<Object> get props =>
      [
        categories,
        chosenPhotosPaths,
        chosenVideosPaths,
        activities,
        date,
        teamRequestState,
        errorTeamMessage,
      ];
}
