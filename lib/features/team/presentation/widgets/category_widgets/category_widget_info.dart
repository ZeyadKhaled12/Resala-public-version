import 'package:flutter/material.dart';
import 'package:resala/configs/colors.dart';
import 'package:resala/core/utils/assets_manager.dart';
import 'package:resala/features/team/domain/entities/category.dart';

import '../../screens/category_description_screen.dart';

class CategoryWidgetInfo extends StatelessWidget {
  const CategoryWidgetInfo({Key? key, required this.category})
      : super(key: key);
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    CategoryDescriptionScreen(category: category),
              ));
            },
            style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: backGroundOrangeColor),
            child: const Text(
              'معرفة الشروط',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: FontAssets.arabicSmoothFont,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Text(
                'الأحداث',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  fontFamily: FontAssets.arabicSmoothFont,
                ),
              ),
              Text(
                'يمكنك معرفة حالة \nالحدث او الحركة',
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: FontAssets.arabicSmoothFont,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
