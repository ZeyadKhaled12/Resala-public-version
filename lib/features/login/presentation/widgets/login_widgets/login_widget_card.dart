import 'package:flutter/material.dart';

import '../../../../../configs/colors.dart';
import '../../../../../core/utils/assets_manager.dart';
import 'login_widget_text_field.dart';

class LoginWidgetCard extends StatelessWidget {
  const LoginWidgetCard(
      {Key? key,
      required this.usernameController,
      required this.passcodeController,
      required this.loginFun})
      : super(key: key);
  final TextEditingController usernameController;
  final TextEditingController passcodeController;
  final Function() loginFun;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _title,
            const Padding(padding: EdgeInsets.only(bottom: 28)),
            LoginWidgetTextField(
                hintText: 'اسم المستخدم', controller: usernameController),
            const Padding(padding: EdgeInsets.only(bottom: 28)),
            LoginWidgetTextField(
                hintText: 'كلمة السر',
                controller: passcodeController,
                isPass: true),
            const Padding(padding: EdgeInsets.only(bottom: 38)),
            _loginButton(context, loginFun)
          ],
        ),
      ),
    );
  }
}

Text _title = const Text(
  'تسجيل الدخول',
  style: TextStyle(
      color: Colors.black,
      fontSize: 29,
      fontWeight: FontWeight.bold,
      fontFamily: FontAssets.arabicTitleFont),
  textAlign: TextAlign.center,
);

TextButton _loginButton(BuildContext context, Function() funLogin) =>
    TextButton(
        onPressed: funLogin,
        style: TextButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            padding:
                const EdgeInsets.only(left: 55, right: 55, top: 15, bottom: 15),
            backgroundColor: backGroundOrangeColor),
        child: const Text(
          'دخول',
          style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontFamily: FontAssets.arabicSmoothFont,
              fontWeight: FontWeight.w900),
        ));
