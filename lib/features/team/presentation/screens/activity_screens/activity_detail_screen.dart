import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resala/core/utils/assets_manager.dart';
import 'package:resala/core/utils/enums.dart';
import '../../../../../core/services/services_locator.dart';
import '../../../../../core/utils/general_widgets/general_bottom_widgets/general_widget_bottom.dart';
import '../../../../login/domain/entities/login.dart';
import '../../../domain/entities/activity.dart';
import '../../../domain/usecases/update_activity_uc.dart';
import '../../controller/team_bloc.dart';
import '../../widgets/activity_widgets/activity_detail_widgets/activity_detail_widget_body.dart';

class ActivityDetailScreen extends StatelessWidget {
  const ActivityDetailScreen(
      {Key? key,
      required this.activity,
      required this.indexActivity,
      required this.login,
      required this.isRef,
      this.refuseFun,
      this.acceptFun,
      this.refuseFlagFun})
      : super(key: key);
  final Activity activity;
  final int indexActivity;
  final Login login;
  final bool isRef;
  final Function()? refuseFun;
  final Function(int score)? acceptFun;
  final Function()? refuseFlagFun;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(size: 40, color: Colors.white),
        title: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(activity.name,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontFamily: FontAssets.arabicSmoothFont)),
          ),
        ),
      ),
      body: BlocProvider(
        create: (ctx) => sl<TeamBloc>(),
        child: BlocConsumer<TeamBloc, TeamState>(
          listener: (context, state) {
            if (state.teamRequestState == RequestState.loaded) {
              Future.delayed(const Duration(milliseconds: 100), () async {
                Navigator.pop(context);
                Navigator.pop(context);
                await Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GeneralWidgetBottom(login: login),
                    ));
              });
            }
          },
          buildWhen: (previous, current) =>
              previous.teamRequestState != current.teamRequestState,
          listenWhen: (previous, current) =>
              previous.teamRequestState != current.teamRequestState,
          builder: (context, state) => ActivityDetailWidgetBody(
            isRef: login.isReferee,
            isActive: login.isActive,
            refuseFun: refuseFun,
            refuseFlagFun: refuseFlagFun,
            acceptFun: acceptFun,
            flaggedFun: () {
              context.read<TeamBloc>().add(UpdateActivityEvent(
                  parameters: UpdateActivityParameters(
                      token: login.token,
                      isFlagUpdated: true,
                      activity: activity,
                      index: indexActivity)));
            },
            activity: activity,
          ),
        ),
      ),
    );
  }
}
