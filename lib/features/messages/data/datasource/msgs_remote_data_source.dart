import 'dart:convert';

import 'package:resala/features/messages/data/models/notifi_model.dart';
import 'package:resala/features/messages/domain/usecases/get_notifications_uc.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/exception.dart';
import '../../../../core/network/error_message_model.dart';
import '../../../../core/utils/app_constance.dart';

abstract class BaseMsgsRemoteDataSource {
  Future<List<NotifiModel>> getNotifications(
      GetNotificationsParameters parameters);
}

class MsgsRemoteDataSource extends BaseMsgsRemoteDataSource {
  @override
  Future<List<NotifiModel>> getNotifications(
      GetNotificationsParameters parameters) async {
    final response =
        await http.get(Uri.parse(AppConstance.getNotificationsUrl), headers: {
      'Content-Type': 'application/json',
      'Charset': 'utf-8',
      'Accept': 'application/json',
      'Authorization': 'Token ${parameters.token}',
    });
    if (response.statusCode == 200) {
      return List<NotifiModel>.from((jsonDecode(response.body) as List)
          .map((e) => NotifiModel.fromJson(e)));
    } else {
      print(jsonDecode(response.body));
      throw ServerException(
          ErrorMessageModel.fromJson(jsonDecode(response.body)));
    }
  }
}
