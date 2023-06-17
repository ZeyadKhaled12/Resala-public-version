import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resala/core/services/services_locator.dart';
import 'package:resala/features/messages/domain/usecases/get_notifications_uc.dart';
import 'package:resala/features/messages/presentation/controller/msgs_bloc.dart';
import '../../../../configs/colors.dart';
import '../../../../core/utils/enums.dart';
import '../widgets/notifications_widgets/notifications_widget_body.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key, required this.token}) : super(key: key);
  final String token;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          backgroundColor: Colors.black,
        ),
        preferredSize: const Size.fromHeight(0),
      ),
      body: BlocProvider(
        create: (context) => sl<MsgsBloc>()
          ..add(GetNotificationsEvent(
              getNotificationsParameters:
                  GetNotificationsParameters(token: token))),
        child: BlocBuilder<MsgsBloc, MsgsState>(
          builder: (context, state) {
            switch (state.msgsRequestStat) {
              case RequestState.loading:
                return const NotificationsWidgetBody(
                    notifications: [], isLoading: true);
              case RequestState.loaded:
                return NotificationsWidgetBody(
                    notifications: state.notifications, isLoading: false);
              case RequestState.error:
                return NotificationsWidgetBody(
                    notifications: state.notifications, isLoading: false);
            }
          },
        ),
      ),
    );
  }
}
