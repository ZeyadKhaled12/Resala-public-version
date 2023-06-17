import 'package:flutter/material.dart';

import '../../../../../configs/colors.dart';
import '../../../../../core/utils/general_widgets/general_widget_circular_view.dart';
import '../../../domain/entities/notifi.dart';
import 'notifications_widget_card.dart';
import 'notifications_widget_title.dart';

class NotificationsWidgetBody extends StatelessWidget {
  const NotificationsWidgetBody(
      {Key? key, required this.notifications, required this.isLoading})
      : super(key: key);
  final List<Notifi> notifications;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(26),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [backGroundOrangeColor, backGroundBlueColor],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0, 0.6])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              NotificationsWidgetTitle(notificationsNum: notifications.length),
              const Padding(padding: EdgeInsets.only(bottom: 38)),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) =>
                      NotificationsWidgetCard(notifi: notifications[index]),
                  itemCount: notifications.length,
                ),
              )
            ],
          ),
        ),
        if (isLoading) const GeneralWidgetCircularView()
      ],
    );
  }
}
