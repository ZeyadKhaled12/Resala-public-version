import 'package:flutter/material.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../login/domain/entities/login.dart';
import '../../../../team/domain/entities/category.dart';
import '../../../../team/presentation/screens/category_description_screen.dart';
import '../../../domain/entities/ref_category.dart';
import '../../screens/ref_activities_screen.dart';

class RefCategoriesWidgetCard extends StatelessWidget {
  const RefCategoriesWidgetCard(
      {Key? key, required this.refCategory, required this.login})
      : super(key: key);
  final RefCategory refCategory;
  final Login login;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (ctx) => RefActivitiesScreen(
                      refCategory: refCategory, login: login)));
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(25)),
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryDescriptionScreen(
                                  category: Category(
                                      id: refCategory.id,
                                      imageUrl: refCategory.imageUrl,
                                      terms: refCategory.terms,
                                      minPhotos: 0,
                                      minVideos: 0,
                                      pointsCalculation:
                                          refCategory.pointsCalculation,
                                      name: refCategory.name,
                                      description: refCategory.description,
                                      maxPhotos: 0,
                                      maxVideos: 0,
                                      activitiesCount: 0,
                                      totalScore: 0)),
                            ));
                      },
                      icon: const Icon(Icons.info_outline, size: 28)),
                  Text(refCategory.name,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          fontFamily: FontAssets.arabicTitleFont)),
                ],
              ),
              const Padding(padding: EdgeInsets.only(bottom: 20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  activityCard(Colors.red, 'مرفوض', refCategory.rejectedCount),
                  activityCard(
                      Colors.blue, 'اعتراض', refCategory.objectedCount),
                  activityCard(Colors.green, 'مقبول', refCategory.acceptedCount),
                  activityCard(Colors.orange, 'جديد', refCategory.pendingCount),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget activityCard(Color colorCard, String title, int value) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        decoration: BoxDecoration(
            color: colorCard.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: FontAssets.arabicTitleFont,
                    fontWeight: FontWeight.w600)),
            const Padding(padding: EdgeInsets.only(bottom: 10)),
            Text(
              '$value',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    ),
  );
}
