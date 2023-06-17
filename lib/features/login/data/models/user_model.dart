import 'package:resala/features/login/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({required String userName, required String password})
      : super(userName: userName, password: password);

  Map<String, dynamic> toJson() => {'username': userName, 'password': password};
}
