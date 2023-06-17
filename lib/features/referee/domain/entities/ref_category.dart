import 'package:equatable/equatable.dart';

class RefCategory extends Equatable {

  final int id;
  final int acceptedCount;
  final int rejectedCount;
  final int objectedCount;
  final int pendingCount;
  final String name;
  final String description;
  final String pointsCalculation;
  final String terms;
  final String imageUrl;

  const RefCategory({required this.id,
    required this.acceptedCount,
    required this.rejectedCount,
    required this.objectedCount,
    required this.pendingCount,
    required this.name,
    required this.description,
    required this.pointsCalculation,
    required this.terms,
    required this.imageUrl});

  @override
  List<Object> get props =>
      [
        id,
        acceptedCount,
        rejectedCount,
        objectedCount,
        pendingCount,
        name,
        description,
        pointsCalculation,
        terms,
        imageUrl,
      ];
}
