import 'package:flutter/material.dart';
import 'package:resala/configs/colors.dart';

import '../assets_manager.dart';

class GeneralTitleBodyWidget extends StatelessWidget {
  const GeneralTitleBodyWidget(
      {Key? key, required this.title, required this.body})
      : super(key: key);
  final String title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          iconTheme: const IconThemeData(size: 29, color: Colors.white),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  fontFamily: FontAssets.arabicTitleFont)),
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [const Color(0XFF230D3C), backGroundBlueColor],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          child: Padding(padding: const EdgeInsets.only(top: 90), child: body),
        ));
  }
}
