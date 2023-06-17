import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:resala/core/error/failure.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../entities/ref_category.dart';
import '../repository/base_ref_repo.dart';

class GetRefCategoriesUc
    extends BaseUseCase<List<RefCategory>, GetRefCategoriesParameters> {
  final BaseRefRepo baseRefRepo;

  GetRefCategoriesUc(this.baseRefRepo);

  @override
  Future<Either<Failure, List<RefCategory>>> call(
      GetRefCategoriesParameters parameters) async {
    return await baseRefRepo.getRefCategories(parameters);
  }
}

class GetRefCategoriesParameters extends Equatable {
  final String token;

  const GetRefCategoriesParameters({required this.token});

  @override
  List<Object> get props => [token];
}
