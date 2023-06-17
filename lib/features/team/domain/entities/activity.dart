import 'package:equatable/equatable.dart';
import 'package:resala/features/team/domain/entities/file.dart';

class Activity extends Equatable {
  final int id;
  final int user;
  final int points;
  final int categoryId;
  final DateTime createdAt;
  final bool isFlag;
  final DateTime updatedAt;
  final String name;
  final String status;
  final String location;
  final String description;
  final List<File> activityPhotos;
  final List<File> activityVideos;
  final String brunchName;
  final String activityTitle;

  const Activity({required this.id,
    required this.user,
    required this.brunchName,
    required this.activityTitle,
    required this.status,
    required this.updatedAt,
    required this.createdAt,
    required this.categoryId,
    required this.points,
    required this.name,
    required this.isFlag,
    required this.location,
    required this.description,
    required this.activityPhotos,
    required this.activityVideos});

  @override
  List<Object> get props =>
      [
        id,
        user,
        points,
        categoryId,
        createdAt,
        isFlag,
        updatedAt,
        name,
        status,
        location,
        description,
        activityPhotos,
        activityVideos,
        brunchName,
        activityTitle,
      ];
}
