import 'package:flutter/material.dart';
import 'package:resala/core/utils/app_constance.dart';
import 'package:resala/core/utils/assets_manager.dart';


class CategoryWidgetCard extends StatelessWidget {
  const CategoryWidgetCard(
      {Key? key,
      required this.statusActivity,
      required this.fun,
      required this.name,
      required this.points,
      required this.isFlag,
      required this.isPhotos,
      required this.isVideos,
      required this.date,
      required this.brunchName,
      required this.activityTitle})
      : super(key: key);
  final String statusActivity;
  final Function() fun;
  final int points;
  final String name;
  final bool isFlag;
  final bool isPhotos;
  final bool isVideos;
  final String brunchName;
  final String activityTitle;
  final String date;

  @override
  Widget build(BuildContext context) {
    Color color = Colors.white;
    String text = '';
    if (isFlag) {
      color = Colors.blue;
      text = 'معلق';
    } else if (statusActivity == AppConstance.accept) {
      color = Colors.green;
      text = 'مقبول';
    } else if (statusActivity == AppConstance.rejected) {
      color = Colors.red;
      text = 'مرفوض';
    } else if (statusActivity == AppConstance.pending) {
      color = Colors.orange;
      text = 'انتظار';
    }

    return InkWell(
      onTap: fun,
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 14),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(name,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                        fontFamily: FontAssets.arabicTitleFont,
                        fontSize: 18)),
                Text(date,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                        fontFamily: FontAssets.arabicTitleFont,
                        fontSize: 12)),
                Text('$activityTitle - $brunchName',
                    style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                        fontFamily: FontAssets.arabicTitleFont,
                        fontSize: 14)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: color,
                      ),
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 6, bottom: 6),
                      child: Text(
                        text,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: FontAssets.arabicSmoothFont),
                      ),
                    ),
                    Row(
                      children: [
                        if (isVideos)
                          const Icon(Icons.video_camera_back,
                              color: Colors.black, size: 25),
                        const Padding(padding: EdgeInsets.only(right: 10)),
                        if (isPhotos)
                          const Icon(Icons.image, color: Colors.black, size: 25),
                      ],
                    )

                  ],
                )
              ],
            ),
          ),
          if (statusActivity == AppConstance.accept)
            Container(
              margin: const EdgeInsets.all(14),
              child: Row(
                children: [
                  const Text('نقطة',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: FontAssets.arabicSmoothFont,
                        fontSize: 15,
                      )),
                  const Padding(padding: EdgeInsets.only(right: 10)),
                  Text(points == 0 ? '__' : '$points',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      )),
                ],
              ),
            ),
        ],
      ),
    );
  }
}