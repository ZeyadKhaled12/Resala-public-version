
import '../../domain/entities/login.dart';
import '../../domain/entities/profile_data.dart';
import 'profile_data_model.dart';

class LoginModel extends Login {
  const LoginModel(
      {required String userName,
      required bool isTeam,
      required bool isReferee,
      required bool isActive,
      required String token,
      required ProfileData profileData})
      : super(
            userName: userName,
            isTeam: isTeam,
            isActive: isActive,
            isReferee: isReferee,
            token: token,
            profileData: profileData);

  factory LoginModel.fromJson(Map<String, dynamic> json, {String? token}) =>
      LoginModel(
          userName: json['username'] ?? '',
          isActive: json['active'] ?? true,
          isTeam: json['is_team'] ?? false,
          isReferee: json['is_referee'] ?? true,
          token: json['token'] ?? token,
          profileData: json['is_referee'] == null ||json['is_referee'] == true
              ? const ProfileData(
                  name: '',
                  activityName: '',
                  brunch: '',
                  members: [],
                  leaders: [],
                  image: '')
              : ProfileDataModel.fromJson(json));
}
