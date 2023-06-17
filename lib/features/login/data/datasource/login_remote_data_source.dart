import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/network/error_message_model.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../../../../core/utils/app_constance.dart';
import '../../domain/entities/login.dart';
import '../../domain/entities/profile_data.dart';
import '../../domain/usecases/login_uc.dart';
import '../../domain/usecases/update_profile_uc.dart';
import '../models/login_model.dart';
import '../models/profile_data_model.dart';
import '../models/user_model.dart';
import 'package:http/http.dart' as http;

abstract class BaseLoginRemoteDataSource {
  Future<LoginModel> login(LoginParameters parameters);

  Future captureToken(Login parameters);

  Future<Login> checkIfLoginBefore(NoParameters parameters);

  Future<NoParameters> logout(NoParameters parameters);

  Future<LoginModel> updateProfile(UpdateProfileParameters parameters);
}

class LoginRemoteDataSource extends BaseLoginRemoteDataSource {
  @override
  Future<LoginModel> login(LoginParameters parameters) async {
    UserModel _user =
        UserModel(userName: parameters.userName, password: parameters.password);
    final response = await http.post(Uri.parse(AppConstance.loginUrl),
        headers: {
          'Content-Type': 'application/json',
          'Charset': 'utf-8',
          'Accept': 'application/json',
        },
        body: jsonEncode(_user.toJson()));
    if (response.statusCode == 200) {
      return LoginModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(
          ErrorMessageModel.fromJson(jsonDecode(response.body)));
    }
  }

  @override
  Future captureToken(Login parameters) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool(AppConstance.sharedPrefIsLoginBefore, true);
    await sharedPreferences.setString(
        AppConstance.sharedPrefToken, parameters.token);
  }

  @override
  Future<Login> checkIfLoginBefore(NoParameters parameters) async {
    Login loginConst = const Login(
        userName: '',
        isTeam: false,
        isReferee: false,
        token: '',
        isActive: false,
        profileData: ProfileData(
            members: [],
            leaders: [],
            brunch: '',
            activityName: '',
            name: '',
            image: ''));
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool? isLoginBefore =
        sharedPreferences.getBool(AppConstance.sharedPrefIsLoginBefore);
    if (isLoginBefore != null) {
      if (isLoginBefore) {
        final response =
            await http.get(Uri.parse(AppConstance.getProfileData), headers: {
          'Content-Type': 'application/json',
          'Charset': 'utf-8',
          'Accept': 'application/json',
          'Authorization':
              'Token ${sharedPreferences.getString(AppConstance.sharedPrefToken)!}',
        });
        LoginModel loginModel = LoginModel.fromJson(jsonDecode(response.body),
            token: sharedPreferences.getString(AppConstance.sharedPrefToken)!);
        return loginModel;
      } else {
        return loginConst;
      }
    } else {
      return loginConst;
    }
  }

  @override
  Future<NoParameters> logout(NoParameters parameters) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool(
        AppConstance.sharedPrefIsLoginBefore, false);
    return const NoParameters();
  }

  @override
  Future<LoginModel> updateProfile(UpdateProfileParameters parameters) async {
    http.MultipartRequest req;
    var url = Uri.parse(AppConstance.updateProfileUrl);
    req = await _sendUpdateProfileReq(parameters, url);
    req.headers['accept'] = 'application/json';
    req.headers['Authorization'] = 'Token ${parameters.token}';
    req.headers['Content-Type'] = 'multipart/form-data';
    var res = await req.send();

    if (res.statusCode == 200) {
      LoginModel loginModel = LoginModel(
          userName: parameters.login.userName,
          isTeam: parameters.login.isTeam,
          isActive: parameters.login.isActive,
          isReferee: parameters.login.isReferee,
          token: parameters.login.token,
          profileData: ProfileDataModel.fromJson(
              jsonDecode(await res.stream.bytesToString())));
      return loginModel;
    } else {
      throw const ServerException(ErrorMessageModel(
          statusMessage: ['يوجد مشكلة في السيرفر'], success: false));
    }
  }

  _sendUpdateProfileReq(UpdateProfileParameters parameters, Uri url) async {
    if (parameters.imagePath != null) {
      return http.MultipartRequest('PATCH', url)
        ..files.add(
            await http.MultipartFile.fromPath('image', parameters.imagePath!));
    } else if (parameters.leaders != null) {
      return http.MultipartRequest('PATCH', url)
        ..fields['leaders'] = jsonEncode(parameters.leaders);
    } else if (parameters.members != null) {
      return http.MultipartRequest('PATCH', url)
        ..fields['members'] = jsonEncode(parameters.members);
    } else if (parameters.activityName != null) {
      return http.MultipartRequest('PATCH', url)
        ..fields['activity_name'] = parameters.activityName!;
    } else if (parameters.teamName != null){
      return http.MultipartRequest('PATCH', url)
        ..fields['name'] = parameters.teamName!;
    }
    return http.MultipartRequest('PATCH', url)
      ..fields['branch'] = parameters.brunch!;
  }
}
