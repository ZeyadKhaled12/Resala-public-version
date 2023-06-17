import '../../domain/entities/update_ref_activity.dart';

class UpdateRefActivityModel extends UpdateRefActivity {
  const UpdateRefActivityModel({
    required bool isObjected,
    required String status, required int score})
      : super(isObjected: isObjected, status: status, score: score);

  Map<String, dynamic> toJson() => {
        'status': status,
        'is_objected': isObjected,
        'score': score,
      };
}
