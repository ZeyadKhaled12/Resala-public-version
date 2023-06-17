import 'package:flutter/material.dart';
import 'package:resala/configs/colors.dart';
import 'package:resala/core/utils/assets_manager.dart';
import 'package:resala/features/login/domain/entities/login.dart';
import 'package:resala/features/team/domain/entities/category.dart';

import '../../../domain/entities/activity.dart';
import '../../screens/activity_screens/add_activity_screen.dart';

class CategoryWidgetTitle extends StatelessWidget {
  const CategoryWidgetTitle(
      {Key? key,
      required this.login,
      required this.category,
      required this.activities})
      : super(key: key);
  final Login login;
  final Category category;
  final List<Activity> activities;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 1 / 2.5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          card(category.totalScore, '  عدد النقط'),
          const Padding(padding: EdgeInsets.only(bottom: 10)),
          card(category.activitiesCount, '  عدد الحركات'),
          const Padding(padding: EdgeInsets.only(bottom: 25)),
          !login.isActive
              ? Text('لا يمكن الاضافة لقد تم تعطيل حسابك',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 20,
                      fontFamily: FontAssets.arabicTitleFont))
              : TextButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddActivityScreen(
                          login: login,
                          category: category,
                          activities: activities))),
                  child: Column(
                    children: const [
                      Icon(Icons.add_circle_outline,
                          color: Colors.black, size: 28),
                      Padding(padding: EdgeInsets.only(bottom: 10)),
                      Text('أضافة حركة/حدث',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 19,
                              fontFamily: FontAssets.arabicSmoothFont),
                          textAlign: TextAlign.center)
                    ],
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).cardColor,
                      padding: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                )
        ],
      ),
    );
  }
}

Widget card(int value, String text) => Container(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: orangeColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(value == 0 ? '__' : '$value',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: FontAssets.arabicSmoothFont)),
          Text(text,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: FontAssets.arabicSmoothFont))
        ],
      ),
    );
