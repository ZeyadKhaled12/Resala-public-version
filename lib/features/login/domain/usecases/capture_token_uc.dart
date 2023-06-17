
import '../../../../core/usecase/base_use_case.dart';
import '../entities/login.dart';
import '../repository/base_login_repo.dart';

class CaptureTokenUc extends BaseUseCaseInside<Future, Login> {
  final BaseLoginRepo basePlayerRepo;

  CaptureTokenUc(this.basePlayerRepo);
  @override
  Future change(Login parameters) async{
    return await basePlayerRepo.captureToken(parameters);
  }

}


