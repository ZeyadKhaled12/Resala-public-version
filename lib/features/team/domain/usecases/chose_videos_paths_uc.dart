import 'package:equatable/equatable.dart';
import 'package:resala/core/usecase/base_use_case.dart';

import '../repository/base_team_repo.dart';

class ChoseVideosPathsUc extends BaseUseCaseInside<List<String>, ChoseVideosPathsParameters> {
  final BaseTeamRepo baseTeamRepo;

  ChoseVideosPathsUc(this.baseTeamRepo);

  @override
  List<String> change(ChoseVideosPathsParameters parameters) {
    return baseTeamRepo.choseVideosPaths(parameters);
  }


}

class ChoseVideosPathsParameters extends Equatable {
  final String path;
  final List<String> videosPaths;

  const ChoseVideosPathsParameters({required this.path, required this.videosPaths});

  @override
  List<Object> get props => [path, videosPaths];
}