import 'package:equatable/equatable.dart';

class Notifi extends Equatable {
  final int id;
  final String title;
  final String body;
  final String by;
  final bool isTeam;
  final bool isRef;
  final DateTime createdAt;

  const Notifi({required this.id,
    required this.title,
    required this.body,
    required this.by,
    required this.isTeam,
    required this.isRef,
    required this.createdAt});

  @override
  List<Object> get props => [id, title, body, by, isTeam, isRef, createdAt,];
}
