import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resala/core/utils/enums.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../core/utils/general_widgets/general_bottom_widgets/general_widget_bottom.dart';
import '../../../../core/utils/general_widgets/general_widget_show_error_message.dart';
import '../../../../core/utils/general_widgets/general_widget_transparent_app_bar.dart';
import '../../domain/usecases/login_uc.dart';
import '../controller/login_bloc.dart';
import '../widgets/login_widgets/login_widget_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passcodeController = TextEditingController();

    return BlocProvider(
      create: (BuildContext context) => sl<LoginBloc>(),
      child: Scaffold(
        appBar: generalTransparentAppBar,
          body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.loginRequestState == RequestState.error) {
            generalWidgetShowErrorMessage(context, state.errorLoginMessage);
          }
          if (state.login.token.isNotEmpty) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (ctx) => GeneralWidgetBottom(login: state.login)));
          }
        },
        listenWhen: (previous, current) =>
            previous.loginRequestState != current.loginRequestState,
        buildWhen: (previous, current) =>
            previous.loginRequestState != current.loginRequestState,
        builder: (context, state) {
          switch (state.loginRequestState) {
            case RequestState.loading:
              return body(
                  true, usernameController, passcodeController, context);
            case RequestState.loaded:
              return body(
                  false, usernameController, passcodeController, context);
            case RequestState.error:
              return body(
                  false, usernameController, passcodeController, context);
          }
        },
      )),
    );
  }
}

Widget body(bool isLoading, TextEditingController usernameController,
        TextEditingController passcodeController, BuildContext context) =>
    LoginWidgetBody(
        isLoading: isLoading,
        loginFun: () {
          if (usernameController.text.isEmpty) {
            generalWidgetShowErrorMessage(context, 'اسم المستخدم مطلوب');
          } else if (passcodeController.text.isEmpty) {
            generalWidgetShowErrorMessage(context, 'كلمة السر مطلوبة');
          } else {
            context.read<LoginBloc>().add(LoginEvent(
                loginParameters: LoginParameters(
                    userName: usernameController.text,
                    password: passcodeController.text)));
          }
        },
        usernameController: usernameController,
        passcodeController: passcodeController);
