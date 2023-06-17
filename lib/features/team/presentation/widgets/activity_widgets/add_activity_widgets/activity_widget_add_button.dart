import 'package:flutter/material.dart';
import 'package:resala/configs/colors.dart';
import 'package:resala/core/utils/assets_manager.dart';

class ActivityWidgetAddButton extends StatelessWidget {
  const ActivityWidgetAddButton({Key? key, required this.fun}) : super(key: key);
  final Function() fun;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.transparent,
      margin: const EdgeInsets.only(bottom: 25),
      padding: const EdgeInsets.all(20),
      child: ElevatedButton(
        onPressed: fun,
        style: ElevatedButton.styleFrom(
          primary: backGroundOrangeColor,
          padding: const EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          )
        ),
        child: const Text('أضافة', style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontFamily: FontAssets.arabicSmoothFont,
          fontSize: 26
        )),
      ),
    );
  }
}
