import 'dart:convert';

import '../../../../core/error/exception.dart';
import '../../../../core/network/error_message_model.dart';
import '../../../../core/utils/app_constance.dart';
import 'package:http/http.dart' as http;
import '../../domain/usecases/add_activity_uc.dart';
import '../../domain/usecases/get_activities_uc.dart';
import '../../domain/usecases/get_categories_uc.dart';
import '../../domain/usecases/update_activity_uc.dart';
import '../models/activity_model.dart';
import '../models/category_model.dart';

abstract class BaseTeamRemoteDataSource {
  Future<List<CategoryModel>> getCategories(GetCategoriesParameters parameters);

  Future<List<ActivityModel>> getActivities(GetActivitiesParameters parameters);

  Future<List<ActivityModel>> addActivity(AddActivityParameters parameters);

  Future<ActivityModel> updateActivity(UpdateActivityParameters parameters);
}

class TeamRemoteDataSource extends BaseTeamRemoteDataSource {
  @override
  Future<List<CategoryModel>> getCategories(
      GetCategoriesParameters parameters) async {
    final response = await http.get(
      Uri.parse(AppConstance.categoriesUrl),
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
      return List<CategoryModel>.from(
          (res as List).map((e) => CategoryModel.fromJson(e)));

    } else {
      throw ServerException(
          ErrorMessageModel.fromJson(jsonDecode(response.body)));
    }
  }

  @override
  Future<List<ActivityModel>> getActivities(
      GetActivitiesParameters parameters) async {
    final response = await http.get(
      Uri.parse(AppConstance.activitiesUrl),
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
      return List<ActivityModel>.from(
          (res as List).map((e) => ActivityModel.fromJson(e)));
    } else {
      throw ServerException(
          ErrorMessageModel.fromJson(jsonDecode(response.body)));
    }
  }

  @override
  Future<List<ActivityModel>> addActivity(
      AddActivityParameters parameters) async {
    List<http.MultipartFile> photosPathByt = [];
    List<http.MultipartFile> videosPathByt = [];
    int i = 0;
    for (var element in parameters.photosPaths) {
      photosPathByt.add(await http.MultipartFile.fromPath('img_$i', element));
      i++;
    }
    i = 0;
    for (var element in parameters.videosPath) {
      videosPathByt.add(await http.MultipartFile.fromPath('vid_$i', element));
      i++;
    }

    var url = Uri.parse(AppConstance.addActivityUrl);
    var req = http.MultipartRequest('POST', url)
      ..files.addAll(photosPathByt)
      ..files.addAll(videosPathByt)
      ..fields['name'] = parameters.activityTitle
      ..fields['description'] = parameters.description
      ..fields['location'] = parameters.locationName
      ..fields['is_objected'] = ''
      ..fields['category'] = jsonEncode(parameters.categoryId);
    req.headers['accept'] = 'application/json';
    req.headers['Authorization'] = 'Token ${parameters.token}';
    req.headers['Content-Type'] = 'multipart/form-data';
    var res = await req.send();
    if (res.statusCode == 200 || res.statusCode == 201) {
      List<ActivityModel> activitiesModel = List.from(parameters.activities);
      activitiesModel.add(
          ActivityModel.fromJson(jsonDecode(await res.stream.bytesToString())));
      return activitiesModel;
    } else {
      if(jsonDecode(await res.stream.bytesToString())['error_message'] ==
          'you aren\'t allowed to add new event, you had reached the maximum scor!'){
        throw ServerException(ErrorMessageModel.fromJson(const {},
            errorMsg: const ['لقد تجاوزت الحد المسموح به من النقاط']));
      }
      throw ServerException(ErrorMessageModel.fromJson(const {},
          errorMsg: const ['يوجد مشكلة في السيرفر']));
    }
  }

  @override
  Future<ActivityModel> updateActivity(
      UpdateActivityParameters parameters) async {
    ActivityModel activity = ActivityModel(
        id: parameters.activity.id,
        brunchName: parameters.activity.brunchName,
        activityTitle: parameters.activity.activityTitle,
        user: parameters.activity.id,
        updatedAt: parameters.activity.updatedAt,
        createdAt: parameters.activity.createdAt,
        categoryId: parameters.activity.categoryId,
        name: parameters.activity.name,
        points: parameters.activity.id,
        status: parameters.activity.status,
        isFlag: parameters.isFlagUpdated ? true : parameters.activity.isFlag,
        location: parameters.activity.location,
        description: parameters.activity.description,
        activityPhotos: parameters.activity.activityPhotos,
        activityVideos: parameters.activity.activityVideos);
    var url = Uri.parse(AppConstance.updateActivityUrl(activity.id));
    var req = http.MultipartRequest('PUT', url)
      ..fields['name'] = activity.name
      ..fields['description'] = activity.description
      ..fields['location'] = activity.location
      ..fields['is_objected'] = jsonEncode(activity.isFlag)
      ..fields['category'] = jsonEncode(activity.categoryId);
    req.headers['accept'] = 'application/json';
    req.headers['Authorization'] = 'Token ${parameters.token}';
    req.headers['Content-Type'] = 'multipart/form-data';
    var res = await req.send();
    if (res.statusCode == 200 || res.statusCode == 201) {
      return activity;
    } else {
      throw ServerException(ErrorMessageModel.fromJson(const {},
          errorMsg: const ['يوجد مشكلة في السيرفر']));
    }
  }
}