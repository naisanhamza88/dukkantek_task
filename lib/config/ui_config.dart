import 'package:flutter/material.dart';

const mainColor = Color(0xFF542784);
const mainDarkColor = Color(0xFF341159);
const appBarBackgroundColor = Color(0xFFEFEFEF);
const accentColor = Color(0xFF30b49a);
const BorderRadius border = BorderRadius.only(
    topRight: Radius.circular(10),
    topLeft: Radius.circular(10),
    bottomRight: Radius.circular(10),
    bottomLeft: Radius.circular(10));

class AppThemeApp {
  ThemeData appTheme() {
    final base = ThemeData.light();
    return base.copyWith(
      scaffoldBackgroundColor: Colors.white,
      primaryColor: mainColor,
      textTheme: const TextTheme(
        headline1: TextStyle(fontFamily: 'light'),
        // regular,Black
        headline2: TextStyle(fontFamily: 'regular', color: Colors.black),
        // regular,White
        headline3: TextStyle(fontFamily: 'simiBold', color: Colors.white),
        // simiBold,Small,black
        headline4: TextStyle(fontFamily: 'simiBold', color: Colors.black),
        // bold,Small,black
        headline5: TextStyle(fontFamily: 'bold', color: Colors.black),
        // bold,Medium,black
        headline6: TextStyle(fontFamily: 'light', color: Colors.grey),
        //UnderLine
        subtitle1: TextStyle(
          fontFamily: 'medium',
          decoration: TextDecoration.underline,
        ),
      ),
      backgroundColor: appBarBackgroundColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            padding:
                MaterialStateProperty.all(const EdgeInsetsDirectional.all(8.0)),
            shape: MaterialStateProperty.all(const RoundedRectangleBorder(
              borderRadius: border,
            )),
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              // If the button is pressed, return size 40, otherwise 20
              if (states.contains(MaterialState.pressed)) {
                return mainDarkColor;
              }
              return mainColor;
            }),
            textStyle: MaterialStateProperty.all(const TextStyle(
                fontSize: 22, color: Colors.white, fontFamily: 'simiBold'))),
      ),
    );
  }
}
