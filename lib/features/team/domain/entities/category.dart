import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final int id;
  final String imageUrl;
  final String pointsCalculation;
  final String terms;
  final int maxVideos;
  final int maxPhotos;
  final int minVideos;
  final int minPhotos;
  final int activitiesCount;
  final int totalScore;
  final String name;
  final String description;

  const Category({required this.id,
    required this.imageUrl,
    required this.maxPhotos,
    required this.minPhotos,
    required this.minVideos,
    required this.maxVideos,
    required this.terms,
    required this.pointsCalculation,
    required this.name,
    required this.description,
    required this.activitiesCount,
    required this.totalScore});

  @override
  List<Object> get props =>
      [
        id,
        imageUrl,
        pointsCalculation,
        terms,
        maxVideos,
        maxPhotos,
        minVideos,
        minPhotos,
        activitiesCount,
        totalScore,
        name,
        description,
      ];
}
