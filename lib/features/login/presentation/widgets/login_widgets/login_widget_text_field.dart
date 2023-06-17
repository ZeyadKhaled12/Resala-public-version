import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resala/core/utils/assets_manager.dart';

class LoginWidgetTextField extends StatelessWidget {
  const LoginWidgetTextField(
      {Key? key,
      required this.hintText,
      required this.controller,
      this.isPass = false})
      : super(key: key);
  final String hintText;
  final TextEditingController controller;
  final bool isPass;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25, left: 25),
      child: TextField(
        cursorColor: Colors.black,
        controller: controller,
        obscureText: isPass,
        textAlign: TextAlign.end,
        style: const TextStyle(color: Colors.black, fontSize: 22),
        decoration: InputDecoration(
          hintText: hintText,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.black,
                width: 2
              )
          ),
          hintStyle: TextStyle(
              color: Colors.black.withOpacity(0.5),
              fontSize: 20,
              fontFamily: FontAssets.arabicSmoothFont),
          //border: InputBorder.none,
        ),
      ),
    );
  }
}
