import 'package:equatable/equatable.dart';

class File extends Equatable {
  final int id;
  final String file;

  const File({required this.id, required this.file});

  @override
  List<Object> get props => [id, file];
}