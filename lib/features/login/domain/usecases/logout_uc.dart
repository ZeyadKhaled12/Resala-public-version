
import 'package:resala/core/usecase/base_use_case.dart';
import '../repository/base_login_repo.dart';

class LogoutUc extends BaseUseCaseInside<Future<NoParameters>, NoParameters> {
  final BaseLoginRepo basePlayerRepo;

  LogoutUc(this.basePlayerRepo);

  @override
  Future<NoParameters> change(NoParameters parameters) async{
    return await basePlayerRepo.logout(parameters);
  }

}
