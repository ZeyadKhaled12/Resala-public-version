import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../login/domain/entities/login.dart';
import '../../../domain/entities/activity.dart';
import '../../../domain/entities/category.dart';
import '../../screens/activity_screens/activity_detail_screen.dart';
import 'category_widget_card.dart';
import 'category_widget_info.dart';
import 'category_widget_title.dart';

class CategoryWidgetBody extends StatelessWidget {
  const CategoryWidgetBody(
      {Key? key,
      required this.category,
      required this.activities,
      required this.login})
      : super(key: key);
  final Category category;
  final Login login;
  final List<Activity> activities;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                CategoryWidgetTitle(
                    login: login, activities: activities, category: category),
                CategoryWidgetInfo(category: category),
                activities.isEmpty
                    ? const Center(
                        child: Text(
                          'لا توجد حركات حتي الان',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: FontAssets.arabicTitleFont,
                              fontSize: 24),
                        ),
                      )
                    : Container(
                        margin: const EdgeInsets.only(left: 25, right: 25),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: const Color(0XFF0C042D),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey)),
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (ctx, index) {
                              return CategoryWidgetCard(
                                  statusActivity: activities[index].status,
                                  isFlag: activities[index].isFlag,
                                  activityTitle: activities[index].activityTitle,
                                  brunchName: activities[index].brunchName,
                                  points: activities[index].points,
                                  date: DateFormat('yyyy-MM-dd – HH:mm a').format(activities[index].createdAt),
                                  isPhotos:
                                      activities[index].activityPhotos.isNotEmpty,
                                  isVideos:
                                      activities[index].activityVideos.isNotEmpty,
                                  name: activities[index].name,
                                  fun: () async => await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ActivityDetailScreen(
                                                isRef: false,
                                                login: login,
                                                activity: activities[index],
                                                indexActivity: index,
                                              ))));
                            },
                            itemCount: activities.length),
                      ),
                const Padding(padding: EdgeInsets.only(bottom: 20))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
