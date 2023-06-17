import 'package:flutter/material.dart';
import 'profile_update_alert_widgets/profile_update_widget_alert.dart';

import '../../../../../core/utils/assets_manager.dart';

class ProfileWidgetTitleCard extends StatelessWidget {
  const ProfileWidgetTitleCard(
      {Key? key,
      required this.title,
      required this.body,
      required this.iconData,
      required this.updateFunSingle,
      required this.isBrunch})
      : super(key: key);
  final String title;
  final String body;
  final IconData iconData;
  final bool isBrunch;
  final Function(String value) updateFunSingle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 10, right: 10),
      margin: const EdgeInsets.only(top: 20, left: 25, right: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white.withOpacity(0.29),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () async {
                await showDialog(
                    context: context,
                    builder: (context) => ProfileUpdateWidgetAlert(
                        updateFunList: (val) {},
                        isBrunch: isBrunch,
                        isList: false,
                        updateFunSingle: updateFunSingle,
                        hintText: body));
              },
              icon: const Icon(Icons.draw, color: Colors.white, size: 24)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: FontAssets.arabicTitleFont),
                      textAlign: TextAlign.end),
                  const Padding(padding: EdgeInsets.only(right: 5)),
                  Icon(
                    iconData,
                    color: Colors.white,
                    size: 26,
                  )
                ],
              ),
              const Padding(padding: EdgeInsets.only(bottom: 6)),
              Padding(
                padding: const EdgeInsets.only(right: 22),
                child: Text(
                  body,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      fontFamily: FontAssets.arabicTitleFont),
                  textAlign: TextAlign.end,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
