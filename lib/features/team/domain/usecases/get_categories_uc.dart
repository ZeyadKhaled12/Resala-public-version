import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../entities/category.dart';
import '../repository/base_team_repo.dart';

class GetCategoriesUc extends BaseUseCase<List<Category>, GetCategoriesParameters> {
  final BaseTeamRepo baseTeamRepo;

  GetCategoriesUc(this.baseTeamRepo);

  @override
  Future<Either<Failure, List<Category>>> call(GetCategoriesParameters parameters) async {
    return await baseTeamRepo.getCategories(parameters);
  }
}

class GetCategoriesParameters extends Equatable {
  final String token;

  const GetCategoriesParameters({required this.token});

  @override
  List<Object> get props => [token];
}