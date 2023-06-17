import '../../domain/entities/ref_category.dart';

class RefCategoryModel extends RefCategory {
  const RefCategoryModel(
      {required int id,
      required int acceptedCount,
      required int rejectedCount,
      required int objectedCount,
      required int pendingCount,
      required String name,
      required String description,
      required String pointCalculation,
      required String terms,
      required String imageUrl})
      : super(
            id: id,
            acceptedCount: acceptedCount,
            rejectedCount: rejectedCount,
            objectedCount: objectedCount,
            pendingCount: pendingCount,
            name: name,
            description: description,
            pointsCalculation: pointCalculation,
            terms: terms,
            imageUrl: imageUrl);

  factory RefCategoryModel.fromJson(Map<String, dynamic> json) =>
      RefCategoryModel(
          id: json['id'],
          name: json['name'],
          terms: json['terms'],
          imageUrl: json['image']?? '',
          description: json['description'],
          pointCalculation: json['point_calculation'],
          acceptedCount: json['accepted_count'],
          objectedCount: json['objected_count'],
          pendingCount: json['pending_count'],
          rejectedCount: json['rejected_count']);
}
