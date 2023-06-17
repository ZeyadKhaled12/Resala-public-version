import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:resala/configs/colors.dart';
import 'package:resala/core/utils/assets_manager.dart';
import '../../../../../../core/utils/app_constance.dart';
import '../../../../domain/entities/activity.dart';

class ActivityDetailWidgetPoints extends StatelessWidget {
  const ActivityDetailWidgetPoints({Key? key, required this.activity})
      : super(key: key);
  final Activity activity;

  @override
  Widget build(BuildContext context) {
    Color color = Colors.white;
    String text = '';
    if (activity.isFlag) {
      color = Colors.blue;
      text = 'معلق';
    } else if (activity.status == AppConstance.accept) {
      color = Colors.green;
      text = 'مقبول';
    } else if (activity.status == AppConstance.rejected) {
      color = Colors.red;
      text = 'مرفوض';
    } else if (activity.status == AppConstance.pending) {
      color = Colors.orange;
      text = 'انتظار';
    }

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Text(
                    'حالة الطلب',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: FontAssets.arabicSmoothFont),
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 8)),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: color,
                    ),
                    padding: const EdgeInsets.only(
                        left: 26, right: 26, top: 12, bottom: 12),
                    child: Text(
                      text,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: FontAssets.arabicSmoothFont),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('نقطة',
                          style: TextStyle(
                              color: orangeColor,
                              fontSize: 14,
                              fontFamily: FontAssets.arabicSmoothFont)),
                      const Padding(padding: EdgeInsets.only(right: 5)),
                      Text(
                        activity.points == 0 || activity.status == AppConstance.pending?'__':'${activity.points}',
                        style: TextStyle(
                            color: orangeColor,
                            fontSize: 32,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 15)),
                  Text(
                    activity.location,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: FontAssets.arabicSmoothFont),
                  ),
                  Text(
                    DateFormat('yyyy-MM-dd – HH:mm a').format(activity.createdAt),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: FontAssets.arabicSmoothFont),
                  ),
                ],
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.only(bottom: 40)),
          Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.28),
                borderRadius: BorderRadius.circular(15)),
            child: Text(activity.description,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: FontAssets.arabicTitleFont,
                  fontSize: 18,
                ),
                textAlign: TextAlign.end),
          )
        ],
      ),
    );
  }
}
