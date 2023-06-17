import '../../domain/entities/file.dart';

class FileModel extends File {
  const FileModel({required int id, required String file})
      : super(id: id, file: file);

  factory FileModel.fromJson(Map<String, dynamic> json) =>
      FileModel(id: json['id'], file: json['file']);

  Map<String, dynamic> toJson() => {
    'id': id,
    'file': file,
  };
}