import 'package:flutter/material.dart';
import 'package:resala/features/login/domain/entities/login.dart';
import '../../../../../configs/colors.dart';
import '../../../../../core/utils/general_widgets/general_widget_circular_view.dart';
import '../../../domain/entities/activity.dart';
import '../../../domain/entities/category.dart';
import '../../screens/category_screen.dart';
import 'categories_widget_all_points.dart';
import 'categories_widget_card.dart';

class CategoriesWidgetBody extends StatelessWidget {
  const CategoriesWidgetBody(
      {Key? key,
      required this.categories,
      required this.activities,
      required this.isLoading,
      required this.login})
      : super(key: key);
  final List<Category> categories;
  final Login login;
  final List<Activity> activities;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    int totalPoints = 0;
    int activitiesCount = 0;

    for (var element in categories) {
      totalPoints = totalPoints + element.totalScore;
      activitiesCount = activitiesCount + element.activitiesCount;
    }

    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[backGroundOrangeColor, backGroundBlueColor],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CategoriesWidgetAllPoints(
                    totalPoints: totalPoints, activitiesCount: activitiesCount),
                Padding(
                  padding: const EdgeInsets.only(left: 35, right: 35, top: 20),
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (ctx, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: CategoriesWidgetCard(
                              category: categories[index],
                              fun: () async {
                                List<Activity> activities = [];
                                for (var element in this.activities) {
                                  if (element.categoryId ==
                                      categories[index].id) {
                                    activities.add(element);
                                  }
                                }
                                await Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (ctx) {
                                  return CategoryScreen(
                                      category: categories[index],
                                      login: login,
                                      activities: activities);
                                }));
                              }),
                        );
                      },
                      itemCount: categories.length),
                ),
              ],
            ),
          ),
        ),
        if (isLoading)
          const Opacity(opacity: 0.69, child: GeneralWidgetCircularView())
      ],
    );
  }
}
