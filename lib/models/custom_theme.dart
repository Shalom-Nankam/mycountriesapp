import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTheme {
  static ThemeData appTheme(bool dark, BuildContext context) => ThemeData(
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: dark ? Colors.white : Colors.black,
            displayColor: dark ? Colors.white : Colors.black,
          ),
      primarySwatch: Colors.red,
      scaffoldBackgroundColor: dark ? Colors.black : Colors.white,
      primaryColor: dark ? Colors.black : Colors.white,
      backgroundColor: dark ? Colors.black : const Color(0xffF1F5FB),
      highlightColor: dark ? const Color(0xff372901) : const Color(0xffFCE192),
      hoverColor: dark ? const Color(0xff3A3A3B) : const Color(0xff4285F4),
      focusColor: dark ? const Color(0xff0B2512) : const Color(0xffA8DAB5),
      disabledColor: Colors.grey,
      cardColor: dark ? const Color(0xFF151515) : Colors.white,
      canvasColor: dark ? Colors.black : Colors.grey[50],
      brightness: dark ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme:
              dark ? const ColorScheme.dark() : const ColorScheme.light()),
      appBarTheme: AppBarTheme(
          elevation: 0.0,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarBrightness: dark ? Brightness.dark : Brightness.light,
              statusBarIconBrightness:
                  dark ? Brightness.dark : Brightness.light)),
      textSelectionTheme: TextSelectionThemeData(
          selectionColor: dark ? Colors.white : Colors.black),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              foregroundColor: dark ? Colors.white : Colors.black)));
}
