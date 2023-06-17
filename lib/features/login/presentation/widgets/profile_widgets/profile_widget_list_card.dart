import 'package:flutter/material.dart';

import '../../../../../core/utils/assets_manager.dart';
import 'profile_update_alert_widgets/profile_update_widget_alert.dart';

class ProfileWidgetListCard extends StatelessWidget {
  const ProfileWidgetListCard(
      {Key? key,
      required this.title,
      required this.list,
      required this.updateFunList})
      : super(key: key);
  final String title;
  final List<String> list;

  final Function(List<String> values) updateFunList;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () async {
                  await showDialog(
                      context: context,
                      builder: (context) => ProfileUpdateWidgetAlert(
                          updateFunList: updateFunList,
                          isList: true,
                          updateFunSingle: (val){},
                          hintTexts: list));
                },
                icon: const Icon(Icons.draw, color: Colors.white, size: 24)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Padding(padding: EdgeInsets.only(bottom: 20)),
                Text(title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: FontAssets.arabicSmoothFont)),
                const Padding(padding: EdgeInsets.only(bottom: 6)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: List.generate(
                      list.length,
                      (index) => Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                list[index],
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: FontAssets.arabicTitleFont),
                              ),
                              const Padding(padding: EdgeInsets.only(left: 11)),
                              const CircleAvatar(
                                radius: 2.5,
                                backgroundColor: Colors.white,
                              )
                            ],
                          )),
                )
              ],
            ),
          ],
        ));
  }
}
