import 'dart:async';

import 'package:flutter/material.dart';
import 'package:resala/core/utils/assets_manager.dart';

generalWidgetShowErrorMessage(BuildContext context, String text) {
  showDialog(
      context: context,
      builder: (context) {
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.of(context).pop();
        });
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Text(text,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  fontFamily: FontAssets.arabicSmoothFont),
              textAlign: TextAlign.center),
        );
      });
}
