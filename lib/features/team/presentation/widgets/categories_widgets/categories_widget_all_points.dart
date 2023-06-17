import 'package:flutter/material.dart';
import 'package:resala/configs/colors.dart';
import 'package:resala/core/utils/assets_manager.dart';

class CategoriesWidgetAllPoints extends StatelessWidget {
  const CategoriesWidgetAllPoints(
      {Key? key, required this.totalPoints, required this.activitiesCount})
      : super(key: key);
  final int totalPoints;
  final int activitiesCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(150),
          bottomLeft: Radius.circular(150),
        ),
        color: Colors.white.withOpacity(0.06),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Padding(padding: EdgeInsets.only(bottom: 28)),
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Text(
                  'مرحبا بك في تطبيق',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.9,
                      fontFamily: FontAssets.arabicTitleFont),
                ),
                Text(
                  'مسابقات رسالة',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      fontFamily: FontAssets.arabicTitleFont),
                ),
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 22)),
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: const EdgeInsets.all(60),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      offset: const Offset(5.0, 6.0), //(x,y)
                      blurRadius: 2,
                    ),
                  ],
                  gradient: const LinearGradient(
                    colors: [Color(0XFF733ECA), Color(0XFF250F4F)],
                    begin: Alignment.topLeft,
                  )),
              child: Column(
                children: [
                  Text('نقاطك',
                      style: TextStyle(
                          color: backGroundOrangeColor,
                          fontSize: 20,
                          fontFamily: FontAssets.arabicSmoothFont)),
                  valueText(totalPoints),
                  const Padding(padding: EdgeInsets.only(bottom: 8)),
                  const Text(
                    'عدد حركاتك',
                    style: TextStyle(
                        color: Color(0XFFA976BB),
                        fontSize: 20,
                        fontFamily: FontAssets.arabicSmoothFont),
                  ),
                  valueText(activitiesCount),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

valueText(int value) => Text('$value',
    style: const TextStyle(
        color: Colors.white, fontSize: 55, fontWeight: FontWeight.bold));
