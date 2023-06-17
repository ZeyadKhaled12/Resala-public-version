import 'package:flutter/material.dart';
import 'package:resala/configs/colors.dart';

import '../../../../../../core/utils/assets_manager.dart';

class ProfileUpdateWidgetTxtFieldAlert extends StatelessWidget {
  const ProfileUpdateWidgetTxtFieldAlert(
      {Key? key,
      required this.hintText,
      required this.textEditingController,
      this.removeFun})
      : super(key: key);
  final String hintText;
  final Function()? removeFun;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        textAlign: TextAlign.center,
        controller: textEditingController,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: FontAssets.arabicTitleFont),
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: const EdgeInsets.only(top: 10, bottom: 10),
          hintTextDirection: TextDirection.ltr,
          prefixIcon: removeFun == null
              ? null
              : IconButton(
                  onPressed: removeFun,
                  icon: const Icon(Icons.close),
                  color: Colors.white,
                ),
          suffixIcon: Icon(Icons.circle, color: orangeColor, size: 24),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          hintStyle: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: FontAssets.arabicTitleFont),
        ),
        cursorColor: Colors.white,
      ),
    );
  }
}
