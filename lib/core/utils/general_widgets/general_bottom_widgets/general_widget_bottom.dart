import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resala/configs/colors.dart';
import 'package:resala/core/services/services_locator.dart';
import '../../../../features/messages/presentation/screens/notifications_screen.dart';
import '../../../../features/login/domain/entities/login.dart';
import '../../../../features/login/presentation/controller/login_bloc.dart';
import '../../../../features/referee/presentation/screens/ref_categories_screen.dart';
import '../../../../features/team/presentation/screens/categories_screen.dart';
import '../../../../features/login/presentation/screens/profile_screen.dart';
import '../general_widget_circular_view.dart';

class GeneralWidgetBottom extends StatefulWidget {
  const GeneralWidgetBottom({Key? key, required this.login}) : super(key: key);
  final Login login;

  @override
  _GeneralWidgetBottomState createState() => _GeneralWidgetBottomState();
}

class _GeneralWidgetBottomState extends State<GeneralWidgetBottom> {
  int index = 1;

  GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();

  final List<Widget> icons = [
    Icon(Icons.notifications, size: 32, color: backGroundOrangeColor),
    Icon(Icons.home, size: 32, color: backGroundOrangeColor),
    Icon(Icons.person, size: 32, color: backGroundOrangeColor),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: CurvedNavigationBar(
          items: icons,
          height: 56,
          index: index,
          backgroundColor: backGroundBlueColor,
          onTap: (index) {
            setState(() {
              this.index = index;
            });
          },
        ),
        body: BlocProvider(
          create: (context) =>
          sl<LoginBloc>()..add(UpdateLoginEvent(login: widget.login)),
          child: BlocBuilder<LoginBloc, LoginState>(
            buildWhen: (previous, current) =>
            previous.loginRequestState != current.loginRequestState,
            builder: (context, state) {
              if (state.login.token.isNotEmpty) {
                return index == 0
                    ? NotificationsScreen(token: widget.login.token)
                    : index == 1
                    ? state.login.isReferee
                    ? RefCategoriesScreen(login: state.login)
                    : CategoriesScreen(login: state.login)
                    : const ProfileScreen();
              } else {
                return const GeneralWidgetCircularView();
              }
            },
          ),
        ));
  }
}