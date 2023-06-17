import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:resala/configs/colors.dart';
import 'package:resala/core/utils/assets_manager.dart';
import 'dart:math';

import 'package:resala/features/messages/domain/entities/notifi.dart';
import 'package:resala/features/messages/presentation/widgets/notifications_widgets/notifications_message_alert_widgets/notifications_widget_alert_body.dart';

class NotificationsWidgetCard extends StatelessWidget {
  const NotificationsWidgetCard({Key? key, required this.notifi})
      : super(key: key);
  final Notifi notifi;

  @override
  Widget build(BuildContext context) {
    var rng = Random();

    List<Color> colors = [
      Colors.black,
      Colors.green,
      Colors.deepPurple,
      Colors.blue
    ];

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(bottom: 28),
                  height: MediaQuery.of(context).size.height * 1 / 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white.withOpacity(0.2),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Flexible(
                        flex: 4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    notifi.title,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily: FontAssets.arabicTitleFont,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Flexible(
                                    child: Text(notifi.body,
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.5),
                                            fontSize: 18,
                                            fontFamily:
                                                FontAssets.arabicTitleFont,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.end),
                                  ),
                                ],
                              ),
                            ),
                            const Padding(padding: EdgeInsets.only(right: 15)),
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Center(
                                child: Text(
                                  notifi.by,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: colors[rng.nextInt(colors.length)],
                                      fontFamily: FontAssets.arabicTitleFont),
                                ),
                              ),
                              radius: 29,
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () async {
                                await showDialog(
                                  context: context,
                                  builder: (context) =>
                                      NotificationsWidgetAlertBody(
                                    title: notifi.title,
                                    body: notifi.body,
                                  ),
                                );
                              },
                              child: Text(
                                'اقرأ المزيد',
                                style: TextStyle(
                                    color: orangeColor,
                                    fontFamily: FontAssets.arabicTitleFont,
                                    fontSize: 15),
                              ),
                            ),
                            Text(
                              DateFormat('y-M-d').format(notifi.createdAt),
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
            ),
            const Padding(padding: EdgeInsets.only(right: 15)),
            Icon(
              Icons.circle,
              color: orangeColor,
              size: 15,
            )
          ],
        ),
      ],
    );
  }
}
