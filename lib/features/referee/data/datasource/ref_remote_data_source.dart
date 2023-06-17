import 'dart:convert';
import '../../../../core/error/exception.dart';
import '../../../../core/network/error_message_model.dart';
import '../../../../core/utils/app_constance.dart';
import '../../../team/data/models/activity_model.dart';
import '../../domain/usecases/get_ref_activities_uc.dart';
import '../../domain/usecases/get_ref_categories_uc.dart';
import 'package:http/http.dart' as http;
import '../../domain/usecases/update_ref_activity_uc.dart';
import '../models/ref_category_model.dart';
import '../models/update_ref_activity_model.dart';

abstract class BaseRefRemoteDataSource {
  Future<List<RefCategoryModel>> getRefCategories(
      GetRefCategoriesParameters parameters);

  Future<List<ActivityModel>> getRefActivities(
      GetRefActivitiesParameters parameters);

  Future<ActivityModel> updateRefActivity(
      UpdateRefActivityParameters parameters);
}

class RefRemoteDataSource extends BaseRefRemoteDataSource {
  @override
  Future<List<RefCategoryModel>> getRefCategories(
      GetRefCategoriesParameters parameters) async {
    final response = await http.get(
      Uri.parse(AppConstance.getRefCategoriesUrl),
      headers: {
        'Content-Type': 'application/json',
        'Charset': 'utf-8',
        'Accept': 'application/json',
        'Authorization': 'Token ${parameters.token}',
      },
    );
    if (response.statusCode == 200) {
      var myDataString = utf8.decode(response.bodyBytes);
      var res = jsonDecode(myDataString);
      return List<RefCategoryModel>.from(
          (res as List).map((e) => RefCategoryModel.fromJson(e)));
    } else {
      print(jsonDecode(response.body));
      throw ServerException(
          ErrorMessageModel.fromJson(jsonDecode(response.body)));
    }
  }

  @override
  Future<List<ActivityModel>> getRefActivities(
      GetRefActivitiesParameters parameters) async {
    final response = await http.get(
      Uri.parse(AppConstance.getAllRefActivities(
          parameters.categoryId)),
      headers: {
        'Content-Type': 'application/json',
        'Charset': 'utf-8',
        'Accept': 'application/json',
        'Authorization': 'Token ${parameters.token}',
      },
    );
    if (response.statusCode == 200) {
      var myDataString = utf8.decode(response.bodyBytes);
      var res = jsonDecode(myDataString);
      List<ActivityModel> _activities = List<ActivityModel>.from(
          (res as List).map((e) => ActivityModel.fromJson(e)));
      return _activities;
    } else {

      throw ServerException(
          ErrorMessageModel.fromJson(jsonDecode(response.body)));
    }
  }

  @override
  Future<ActivityModel> updateRefActivity(UpdateRefActivityParameters parameters) async{
    final UpdateRefActivityModel updateRefActivityModel = UpdateRefActivityModel(
        isObjected: parameters.updateRefActivity.isObjected,
        status: parameters.updateRefActivity.status,
        score: parameters.updateRefActivity.score);
    final response = await http.put(
      Uri.parse(AppConstance.updateRefActivityUrl(
          parameters.activityId)),
      headers: {
        'Content-Type': 'application/json',
        'Charset': 'utf-8',
        'Accept': 'application/json',
        'Authorization': 'Token ${parameters.token}',
      },
      body: jsonEncode(updateRefActivityModel.toJson())
    );
    if (response.statusCode == 200) {
      var myDataString = utf8.decode(response.bodyBytes);
      var res = jsonDecode(myDataString);
      return ActivityModel.fromJson(res);
    } else {
      throw ServerException(
          ErrorMessageModel.fromJson(jsonDecode(response.body)));
    }
  }
}
