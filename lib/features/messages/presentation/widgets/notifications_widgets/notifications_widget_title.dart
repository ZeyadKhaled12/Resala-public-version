import 'package:flutter/material.dart';

import '../../../../../configs/colors.dart';
import '../../../../../core/utils/assets_manager.dart';

class NotificationsWidgetTitle extends StatelessWidget {
  const NotificationsWidgetTitle({Key? key, required this.notificationsNum})
      : super(key: key);
  final int notificationsNum;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          'الاشعارات',
          style: TextStyle(
              color: Colors.white,
              fontSize: 29,
              fontFamily: FontAssets.arabicTitleFont),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            subTitleText('اشعارات', color: orangeColor),
            subTitleText('$notificationsNum', color: orangeColor),
            subTitleText('لديك')
          ],
        )
      ],
    );
  }
}

Widget subTitleText(String txt, {Color color = Colors.white}) {
  return Padding(
    padding: const EdgeInsets.only(left: 3),
    child: Text(txt,
        style: TextStyle(
            color: color,
            fontSize: 18,
            fontFamily: FontAssets.arabicTitleFont)),
  );
}
