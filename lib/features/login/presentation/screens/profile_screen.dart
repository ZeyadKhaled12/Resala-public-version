import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../configs/colors.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../../../../core/utils/general_widgets/general_widget_transparent_app_bar.dart';
import '../controller/login_bloc.dart';
import '../widgets/profile_widgets/profile_widget_body.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: generalTransparentAppBar,
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [backGroundBlueColor, const Color(0XFF351A69)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomCenter)),
            child: BlocBuilder<LoginBloc, LoginState>(
              buildWhen: (previous, current) =>
                  previous.loginRequestState != current.loginRequestState,
              builder: (context, state) {
                return ProfileWidgetBody(
                    logoutFun: () async {
                      context
                          .read<LoginBloc>()
                          .add(const LogoutEvent(noParameters: NoParameters()));
                      await Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ));
                    },
                    login: state.login);
              },
            )));
  }
}
