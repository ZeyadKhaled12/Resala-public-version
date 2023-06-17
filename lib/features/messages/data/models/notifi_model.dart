import 'package:resala/core/utils/general_widgets/general_functions.dart';
import 'package:resala/features/messages/domain/entities/notifi.dart';

class NotifiModel extends Notifi {
  const NotifiModel(
      {required int id,
      required String title,
      required String body,
      required String by,
      required bool isTeam,
      required bool isRef,
      required DateTime createdAt})
      : super(
            id: id,
            title: title,
            body: body,
            by: by,
            isTeam: isTeam,
            isRef: isRef,
            createdAt: createdAt);

  factory NotifiModel.fromJson(Map<String, dynamic> json) =>
      NotifiModel(
          id: json['id'],
          title: GeneralFunctions(text: json['title']).checkAndConvert(),
          body: GeneralFunctions(text: json['body']).checkAndConvert(),
          by:  GeneralFunctions(text: json['by']).checkAndConvert(),
          isTeam: json['to_team'],
          isRef: json['to_referee'],
          createdAt: DateTime.parse(json['created_at']));
}
