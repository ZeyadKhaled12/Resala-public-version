import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String userName;
  final String password;

  const User({required this.userName, required this.password});

  @override
  List<Object> get props => [userName, password];
}