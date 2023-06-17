import '../../../../core/usecase/base_use_case.dart';
import '../entities/login.dart';
import '../repository/base_login_repo.dart';

class CheckIfLoginBeforeUc extends BaseUseCaseInside<Future<Login>, NoParameters> {
  final BaseLoginRepo basePlayerRepo;

  CheckIfLoginBeforeUc(this.basePlayerRepo);

  @override
  Future<Login> change(NoParameters parameters) async{
    return await basePlayerRepo.checkIfLoginBefore(parameters);
  }
  

}