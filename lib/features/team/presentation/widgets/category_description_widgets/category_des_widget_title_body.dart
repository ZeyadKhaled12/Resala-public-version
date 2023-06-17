import 'package:flutter/material.dart';
import 'package:resala/configs/colors.dart';
import 'package:resala/core/utils/assets_manager.dart';

class CategoryDesWidgetTitleBody extends StatelessWidget {
  const CategoryDesWidgetTitleBody(
      {Key? key, required this.title, required this.body})
      : super(key: key);
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontFamily: FontAssets.arabicTitleFont,
                  fontSize: 28),
            ),
            const Padding(padding: EdgeInsets.only(left: 10)),
            CircleAvatar(
              radius: 6,
              backgroundColor: orangeColor,
            ),
          ],
        ),
        Text(
          body,
          style:  TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontFamily: FontAssets.arabicSmoothFont,
              fontSize: 16),
          textAlign: TextAlign.end,
        )
      ],
    );
  }
}
