import 'package:equatable/equatable.dart';

import '../../../../core/usecase/base_use_case.dart';
import '../repository/base_team_repo.dart';

class RemovePhotoPathUc
    extends BaseUseCaseInside<int, RemovePhotoPathParameters> {
  final BaseTeamRepo baseTeamRepo;

  RemovePhotoPathUc(this.baseTeamRepo);

  @override
  int change(RemovePhotoPathParameters parameters) {
    return baseTeamRepo.removePhotoPath(parameters);
  }

}

class RemovePhotoPathParameters extends Equatable {
  final int index;

  const RemovePhotoPathParameters({required this.index});

  @override
  List<Object> get props => [index];
}