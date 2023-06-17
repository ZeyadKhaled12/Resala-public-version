import 'package:flutter/material.dart';
import 'package:resala/configs/colors.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../login/domain/entities/login.dart';
import '../../domain/entities/activity.dart';
import '../../domain/entities/category.dart';
import '../widgets/category_widgets/category_widget_body.dart';
import '../widgets/category_widgets/category_widget_title.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen(
      {Key? key,
      required this.category,
      required this.activities,
      required this.login})
      : super(key: key);

  final Category category;
  final List<Activity> activities;
  final Login login;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          iconTheme: const IconThemeData(
              size: 40,
              color: Colors.white
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          title:  Text(category.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.w500,
                fontFamily: FontAssets.arabicSmoothFont,
              )),
        ),
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                backGroundBlueColor,
                const Color(0XFF351A69)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter
            )
          ),
          child: CategoryWidgetBody(
              activities: activities,
              category: category,
              login: login),
        ));
  }
}
