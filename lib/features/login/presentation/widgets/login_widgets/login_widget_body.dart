import 'package:flutter/material.dart';
import 'package:resala/configs/colors.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/general_widgets/general_widget_circular_view.dart';
import 'login_widget_card.dart';

class LoginWidgetBody extends StatelessWidget {
  const LoginWidgetBody(
      {Key? key,
      required this.isLoading,
      required this.loginFun,
      required this.usernameController,
      required this.passcodeController})
      : super(key: key);
  final Function() loginFun;
  final bool isLoading;
  final TextEditingController usernameController;
  final TextEditingController passcodeController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _boxDecoration,
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 2 / 3,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50))),
          ),
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(padding: EdgeInsets.only(top: 40)),
                  Row(
                    children: [
                      const Image(
                          image: AssetImage(ImagesAssets.charityLogo),
                          width: 100),
                      Container(
                        height: 114,
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        child: const VerticalDivider(
                          color: Colors.white,
                          width: 10,
                          thickness: 2,
                          indent: 10,
                          endIndent: 10,
                        ),
                      ),
                      const Image(
                          image: AssetImage(ImagesAssets.resalaWhiteLogo),
                          width: 112),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 15)),
                  const Text('تطبيق خاص بمسابقات جمعية رسالة للأعمال الخيرية',
                      style: TextStyle(
                          fontFamily: FontAssets.arabicSmoothFont,
                          color: Colors.white)),
                  const Padding(padding: EdgeInsets.only(bottom: 40)),
                  LoginWidgetCard(
                      usernameController: usernameController,
                      passcodeController: passcodeController,
                      loginFun: loginFun),
                  const Padding(padding: EdgeInsets.only(bottom: 40)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('اذا لم يكن لديك حساب للتسجيل تواصل مع',
                          style: TextStyle(
                              fontFamily: FontAssets.arabicSmoothFont,
                              color: Colors.white)),
                      const Padding(padding: EdgeInsets.only(bottom: 10)),
                      Text('مسئول المسابقة',
                          style: TextStyle(
                              fontFamily: FontAssets.arabicSmoothFont,
                              color: backGroundOrangeColor)),
                      const Padding(padding: EdgeInsets.only(bottom: 40)),
                    ],
                  )
                ],
              ),
            ),
          ),
          if (isLoading) const GeneralWidgetCircularView()
        ],
      ),
    );
  }
}

BoxDecoration _boxDecoration = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[backGroundOrangeColor, backGroundBlueColor],
  ),
);
