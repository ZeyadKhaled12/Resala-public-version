import 'package:flutter/material.dart';
import 'package:resala/core/utils/app_constance.dart';
import '../../../../../../configs/colors.dart';
import '../../../../../../core/utils/assets_manager.dart';
import '../../../../../referee/presentation/widgets/ref_activities_widgets/ref_activities_detail_widget_alert.dart';
import '../../../../domain/entities/activity.dart';
import 'activity_detail_widget_points.dart';
import 'activity_detail_widget_alert_dialog.dart';
import 'activity_detail_widget_list_files.dart';

class ActivityDetailWidgetBody extends StatelessWidget {
  const ActivityDetailWidgetBody(
      {Key? key,
      required this.activity,
      required this.flaggedFun,
      required this.isActive,
      this.refuseFun,
      this.acceptFun,
      this.refuseFlagFun, required this.isRef})
      : super(key: key);
  final Activity activity;
  final bool isActive;
  final bool isRef;
  final Function() flaggedFun;
  final Function()? refuseFun;
  final Function(int score)? acceptFun;
  final Function()? refuseFlagFun;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [backGroundOrangeColor, backGroundBlueColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0, 0.6])),
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 2 / 3.8,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              const Color(0XFF381359).withOpacity(0.6),
              Colors.transparent,
              const Color(0XFF381359).withOpacity(0.6)
            ])),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 90),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ActivityDetailWidgetPoints(activity: activity),
                  const Padding(padding: EdgeInsets.only(bottom: 28)),
                  if (activity.activityPhotos.isNotEmpty)
                    ActivityDetailWidgetListFiles(
                        isVideos: false, files: activity.activityPhotos),
                  const Padding(padding: EdgeInsets.only(bottom: 28)),
                  if (activity.activityVideos.isNotEmpty)
                    ActivityDetailWidgetListFiles(
                        isVideos: true, files: activity.activityVideos),
                  const Padding(padding: EdgeInsets.only(bottom: 38)),
                  !isActive
                      ? Text('لقد تم تعطيل حسابك',
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 18,
                              fontFamily: FontAssets.arabicTitleFont))
                      : isRef
                      ? Padding(
                              padding:
                                  const EdgeInsets.only(left: 25, right: 25),
                              child: SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                    onPressed: () async {
                                      await showDialog(
                                          context: context,
                                          builder: (context) =>
                                              RefActivitiesDetailWidgetAlert(
                                                isFlag: activity.isFlag,
                                                acceptFun: acceptFun,
                                                refuseFlagFun: refuseFlagFun,
                                                refuseFun: refuseFun,
                                              ));
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: backGroundOrangeColor,
                                        padding: const EdgeInsets.only(
                                            top: 8, bottom: 8),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15))),
                                    child: const Text('تعديل حالة الحدث',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily:
                                                FontAssets.arabicTitleFont,
                                            fontSize: 25))),
                              ),
                            )
                          : activity.status != AppConstance.flag && !isRef &&
                                  activity.status != AppConstance.pending &&
                                  !activity.isFlag
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                      left: 25, right: 25),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                        onPressed: () async {
                                          await showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  ActivityDetailWidgetAlertDialog(
                                                    flaggedFun: flaggedFun,
                                                  ));
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                backGroundOrangeColor,
                                            padding: const EdgeInsets.only(
                                                top: 8, bottom: 8),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15))),
                                        child: const Text('تقديم اعتراض',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily:
                                                    FontAssets.arabicTitleFont,
                                                fontSize: 25))),
                                  ),
                                )
                              : const SizedBox(),
                  const Padding(padding: EdgeInsets.only(bottom: 38)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
