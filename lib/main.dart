
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resala/app.dart';
import 'core/services/services_locator.dart';
import 'features/login/presentation/controller/login_bloc.dart';

void main() {
  ServicesLocator().init();
  runApp(
    BlocProvider(create: (context) => sl<LoginBloc>(),
      child: const Resala())
  );
}