import 'package:flutter/material.dart';

import '../../../../configs/colors.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../domain/entities/category.dart';
import '../widgets/category_description_widgets/category_des_widget_image.dart';
import '../widgets/category_description_widgets/category_des_widget_title_body.dart';

class CategoryDescriptionScreen extends StatelessWidget {
  const CategoryDescriptionScreen({Key? key, required this.category})
      : super(key: key);
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(size: 40, color: Colors.white),
          centerTitle: true,
          title: Text(category.name,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: FontAssets.arabicSmoothFont))),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [backGroundOrangeColor, backGroundBlueColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0, 0.6])),
        child: Padding(
          padding: const EdgeInsets.only(top: 90, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CategoryDesWidgetImage(imageUrl: category.imageUrl),
                const Padding(padding: EdgeInsets.only(bottom: 25)),
                CategoryDesWidgetTitleBody(body: category.description, title: 'الوصف'),
                const Padding(padding: EdgeInsets.only(bottom: 25)),
                CategoryDesWidgetTitleBody(body: category.pointsCalculation, title: 'طريقة حساب النقط'),
                const Padding(padding: EdgeInsets.only(bottom: 25)),
                CategoryDesWidgetTitleBody(body: category.terms, title: 'الشروط'),
                const Padding(padding: EdgeInsets.only(bottom: 25)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
