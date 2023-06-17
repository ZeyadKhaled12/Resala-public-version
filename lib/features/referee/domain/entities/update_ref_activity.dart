import 'package:equatable/equatable.dart';

class UpdateRefActivity extends Equatable {
  final bool isObjected;
  final String status;
  final int score;

  const UpdateRefActivity(
      {required this.isObjected, required this.status, required this.score});

  @override
  List<Object> get props => [isObjected, status, score];
}
