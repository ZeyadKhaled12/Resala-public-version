import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:resala/features/login/domain/entities/login.dart';
import '../../../../../core/utils/app_constance.dart';
import '../../../../team/domain/entities/activity.dart';
import '../../../../team/domain/entities/category.dart';
import '../../../../team/presentation/screens/activity_screens/activity_detail_screen.dart';
import '../../../../team/presentation/widgets/category_widgets/category_widget_card.dart';
import '../../../../team/presentation/widgets/category_widgets/category_widget_info.dart';
import '../../../domain/entities/ref_category.dart';
import '../../../domain/entities/update_ref_activity.dart';
import '../../../domain/usecases/update_ref_activity_uc.dart';
import '../../controller/ref_bloc.dart';
import 'ref_activities_widget_filters.dart';

class RefActivitiesWidgetBody extends StatelessWidget {
  const RefActivitiesWidgetBody(
      {Key? key,
      required this.refCategory,
      required this.activities,
      required this.login})
      : super(key: key);
  final RefCategory refCategory;
  final Login login;
  final List<Activity> activities;


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RefBloc, RefState>(
      buildWhen: (previous, current) =>
          previous.refRequestState != current.refRequestState,
      builder: (context, state) => Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 1 / 2.5,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(150),
                    bottomRight: Radius.circular(150)),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0XFF662C47), Color(0XFFCB5D50)])),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 90),
            child: Column(
              children: [
                const Padding(padding: EdgeInsets.only(top: 50)),
                RefActivitiesWidgetFilters(
                    token: login.token, refCategory: refCategory),
                const Padding(padding: EdgeInsets.only(bottom: 20)),
                CategoryWidgetInfo(
                    category: Category(
                        id: refCategory.id,
                        imageUrl: refCategory.imageUrl,
                        maxPhotos: 0,
                        minPhotos: 0,
                        minVideos: 0,
                        maxVideos: 0,
                        terms: refCategory.terms,
                        pointsCalculation: refCategory.pointsCalculation,
                        name: refCategory.name,
                        description: refCategory.description,
                        activitiesCount: refCategory.acceptedCount,
                        totalScore: 0)),
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 25, right: 25),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: const Color(0XFF0C042D),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey)),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (ctx, index) {
                          return CategoryWidgetCard(
                              statusActivity: activities[index].status,
                              activityTitle: activities[index].activityTitle,
                              brunchName: activities[index].brunchName,
                              isFlag: activities[index].isFlag,
                              points: activities[index].points,
                              date: DateFormat('yyyy-MM-dd – HH:mm a')
                                  .format(activities[index].createdAt),
                              isPhotos:
                                  activities[index].activityPhotos.isNotEmpty,
                              isVideos:
                                  activities[index].activityVideos.isNotEmpty,
                              name: activities[index].name,
                              fun: () async => await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder:
                                          (ctx) => ActivityDetailScreen(
                                                isRef: true,
                                                login: login,
                                                acceptFun: (score) => context
                                                    .read<RefBloc>()
                                                    .add(UpdateRefActivityEvent(
                                                        parameters: UpdateRefActivityParameters(
                                                            token: login.token,
                                                            activityId:
                                                                activities[
                                                                        index]
                                                                    .id,
                                                            updateRefActivity:
                                                                UpdateRefActivity(
                                                                    isObjected:
                                                                        false,
                                                                    status: AppConstance
                                                                        .accept,
                                                                    score:
                                                                        score)))),
                                                refuseFlagFun: () => context
                                                    .read<RefBloc>()
                                                    .add(UpdateRefActivityEvent(
                                                        parameters: UpdateRefActivityParameters(
                                                            token: login.token,
                                                            activityId:
                                                                activities[index]
                                                                    .id,
                                                            updateRefActivity: UpdateRefActivity(
                                                                isObjected:
                                                                    false,
                                                                status:
                                                                    activities[
                                                                            index]
                                                                        .status,
                                                                score: activities[
                                                                        index]
                                                                    .points)))),
                                                refuseFun: () => context
                                                    .read<RefBloc>()
                                                    .add(UpdateRefActivityEvent(
                                                        parameters: UpdateRefActivityParameters(
                                                            token: login.token,
                                                            activityId:
                                                                activities[index]
                                                                    .id,
                                                            updateRefActivity:
                                                                const UpdateRefActivity(
                                                                    isObjected:
                                                                        false,
                                                                    status: AppConstance
                                                                        .rejected,
                                                                    score:
                                                                        0)))),
                                                activity: activities[index],
                                                indexActivity: index,
                                              ))));
                        },
                        itemCount: activities.length),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
