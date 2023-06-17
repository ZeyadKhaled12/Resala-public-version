import 'package:flutter/material.dart';
import 'package:resala/splash_screen.dart';

class Resala extends StatelessWidget {
  const Resala({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: const Color(0XFF222647),
            secondaryHeaderColor: const Color(0XFFC3F8FF),
            cardColor: Colors.white,//const Color(0XFFD9D9D9),
            colorScheme: ColorScheme.fromSwatch(
                backgroundColor: const Color(0XFF383D6E)
            ),
            backgroundColor: const Color(0XFFE0E0E0),
            hintColor: const Color(0XFF386E3A),
            textSelectionTheme:
            const TextSelectionThemeData(selectionColor: Color(0XFFDDD9B8))),
        home: const SplashScreen());
  }
}