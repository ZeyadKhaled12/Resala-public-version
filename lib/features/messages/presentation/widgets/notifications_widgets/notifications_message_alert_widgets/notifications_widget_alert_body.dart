import 'package:flutter/material.dart';

import '../../../../../../core/utils/assets_manager.dart';

class NotificationsWidgetAlertBody extends StatelessWidget {
  const NotificationsWidgetAlertBody(
      {Key? key, required this.title, required this.body})
      : super(key: key);
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.white.withOpacity(0.8),
      title: Text(
        title,
        style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: FontAssets.arabicTitleFont,
            fontWeight: FontWeight.bold),
        textAlign: TextAlign.end,
      ),
      content: Container(
          padding: const EdgeInsets.all(5),
          child: SingleChildScrollView(
            child: Text(body,
                style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 18,
                    fontFamily: FontAssets.arabicTitleFont,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.end),
          )),
    );
  }
}
