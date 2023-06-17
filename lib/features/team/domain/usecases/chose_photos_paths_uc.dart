import 'package:equatable/equatable.dart';
import 'package:resala/core/usecase/base_use_case.dart';

import '../repository/base_team_repo.dart';

class ChosePhotosPathsUc extends BaseUseCaseInside<List<String>, ChosePhotosPathsParameters> {
  final BaseTeamRepo baseTeamRepo;

  ChosePhotosPathsUc(this.baseTeamRepo);

  @override
  List<String> change(ChosePhotosPathsParameters parameters) {
    return baseTeamRepo.chosePhotosPaths(parameters);
  }


}

class ChosePhotosPathsParameters extends Equatable {
  final String path;
  final List<String> photosPaths;

  const ChosePhotosPathsParameters({required this.path, required this.photosPaths});

  @override
  List<Object> get props => [path, photosPaths];
}