import 'package:equatable/equatable.dart';

class ProfileData extends Equatable {
  final String name;
  final String activityName;
  final String brunch;
  final List<String> members;
  final List<String> leaders;
  final String image;

  const ProfileData({
    required this.name,
    required this.activityName,
    required this.brunch,
    required this.members,
    required this.leaders,
    required this.image,
  });

  @override
  List<Object> get props => [
        name,
        activityName,
        brunch,
        members,
        leaders,
        image,
      ];
}
