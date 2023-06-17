import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final List statusMessage;
  final bool success;

  const ErrorMessageModel({required this.statusMessage, required this.success});

  factory ErrorMessageModel.fromJson(
          Map<String, dynamic> json, {List? errorMsg}) =>
      ErrorMessageModel(
          statusMessage: errorMsg ?? json['error'], success: false);

  @override
  List<Object> get props => [statusMessage, success];
}
