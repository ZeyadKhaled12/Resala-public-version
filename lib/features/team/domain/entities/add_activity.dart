import 'package:equatable/equatable.dart';

class AddActivity extends Equatable {
  final String name;
  final bool isFlag;
  final String location;
  final String description;
  final List<String> activityPhotos;
  final List<String> activityVideos;
  final int categoryId;

  const AddActivity({
    required this.name,
    required this.isFlag,
    required this.location,
    required this.description,
    required this.activityPhotos,
    required this.activityVideos,
    required this.categoryId
  });

  @override
  List<Object> get props =>
      [
        name,
        isFlag,
        location,
        description,
        activityPhotos,
        activityVideos,
        categoryId,
      ];
}