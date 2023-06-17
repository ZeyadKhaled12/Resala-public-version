import 'package:equatable/equatable.dart';
import 'package:resala/features/login/domain/entities/profile_data.dart';

class Login extends Equatable {
  final String userName;
  final bool isTeam;
  final bool isReferee;
  final bool isActive;
  final String token;
  final ProfileData profileData;

  const Login(
      {required this.userName,
      required this.isTeam,
      required this.isActive,
      required this.isReferee,
      required this.token,
      required this.profileData});

  @override
  List<Object> get props => [
        userName,
        isTeam,
        isReferee,
        isActive,
        token,
        profileData
      ];
}
