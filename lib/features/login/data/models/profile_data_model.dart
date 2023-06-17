import 'package:resala/features/login/domain/entities/profile_data.dart';

import '../../../../core/utils/general_widgets/general_functions.dart';

class ProfileDataModel extends ProfileData {
  const ProfileDataModel(
      {required String name,
      required String activityName,
      required String brunch,
      required List<String> members,
      required List<String> leaders,
      required String image})
      : super(
            name: name,
            activityName: activityName,
            brunch: brunch,
            members: members,
            leaders: leaders,
            image: image);

  factory ProfileDataModel.fromJson(Map<String, dynamic> json) =>
      ProfileDataModel(
          image: json['image'] ?? '',
          name: GeneralFunctions(text: json['name']).checkAndConvert(),
          activityName: GeneralFunctions(text: json['activity_name']).checkAndConvert(),
          brunch: GeneralFunctions(text: json['branch']).checkAndConvert(),
          leaders: List<String>.from(json['leaders'] as List)
              .map((e) => GeneralFunctions(text: e).checkAndConvert())
              .toList(),
          members: List<String>.from(json['members'] as List)
              .map((e) => GeneralFunctions(text: e).checkAndConvert())
              .toList());
}
