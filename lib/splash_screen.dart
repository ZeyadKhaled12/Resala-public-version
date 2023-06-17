import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:resala/configs/colors.dart';
import 'core/services/services_locator.dart';
import 'core/usecase/base_use_case.dart';
import 'core/utils/assets_manager.dart';
import 'core/utils/enums.dart';
import 'core/utils/general_widgets/general_bottom_widgets/general_widget_bottom.dart';
import 'core/utils/general_widgets/general_widget_animation_opacity.dart';
import 'features/login/presentation/controller/login_bloc.dart';
import 'features/login/presentation/screens/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(backgroundColor: Colors.black),
      ),
      body: BlocProvider(
          create: (ctx) => sl<LoginBloc>()
          ..add(const CheckIfLoginBeforeEvent(noParameters: NoParameters())),
          child: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state.loginRequestState == RequestState.loaded) {
                Future.delayed(const Duration(seconds: 5), () async {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => state.login.token.isEmpty
                              ? const LoginScreen()
                              : GeneralWidgetBottom(login: state.login)));
                });
              }
            },
            buildWhen: (prev, current) =>
                prev.loginRequestState != current.loginRequestState,
            builder: (context, state) {
              switch (state.loginRequestState) {
                case RequestState.loading:
                  return body;
                case RequestState.loaded:
                  return body;
                case RequestState.error:
                  return body;
              }
            },
          )),
    );
  }
}

Widget body = Container(
    color: const Color(0XFF100C27),
    width: double.infinity,
    height: double.infinity,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Image(
          image: AssetImage(ImagesAssets.resalaLogo),
          fit: BoxFit.fitHeight,
          height: 165,
          width: 165,
        ),
        LoadingAnimationWidget.flickr(
          leftDotColor: const Color(0XFFFFBE41),
          rightDotColor: const Color(0XFF00B388),
          size: 29,
        ),
      ],
    ));
