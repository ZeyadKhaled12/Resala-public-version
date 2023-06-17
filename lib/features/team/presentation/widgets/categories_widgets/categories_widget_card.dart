import 'package:flutter/material.dart';
import 'package:resala/configs/colors.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../domain/entities/category.dart';
import '../../screens/category_description_screen.dart';
import '../../screens/category_description_screen.dart';

class CategoriesWidgetCard extends StatelessWidget {
  const CategoriesWidgetCard({Key? key, this.fun, this.category})
      : super(key: key);

  final Category? category;
  final Function()? fun;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: fun,
        child: Container(
          padding: const EdgeInsets.only(left: 20, bottom: 15),
          decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(width: 2, color: Colors.grey),
              borderRadius: BorderRadius.circular(25)),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => CategoryDescriptionScreen(
                                category: category!)));
                  },
                  icon: const Icon(Icons.info_outline,
                      size: 28, color: Colors.white)),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(category!.totalScore == 0? '__':'${category!.totalScore}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: FontAssets.arabicSmoothFont,
                                  )),
                              const Padding(
                                  padding: EdgeInsets.only(bottom: 8)),
                              Text('${category!.activitiesCount}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: FontAssets.arabicSmoothFont,
                                  )),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Text('عدد النقط',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: FontAssets.arabicSmoothFont,
                                  )),
                              Padding(padding: EdgeInsets.only(bottom: 8)),
                              Text('عدد الحركات',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: FontAssets.arabicSmoothFont,
                                  )),
                            ],
                          ),
                        ],
                      ),
                      const Padding(padding: EdgeInsets.only(right: 8)),
                      Expanded(
                        child: Container(
                          child: Text(category!.name,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.w900,
                                fontFamily: FontAssets.arabicTitleFont,
                              )),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: orangeColor,
                              border: Border.all(color: Colors.white)),
                        ),
                      ),
                    ]),
              ),
            ],
          ),
        ));
  }
}