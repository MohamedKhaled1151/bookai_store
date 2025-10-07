import 'package:flutter/material.dart';

class AppDarkModeMode {
  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    textTheme: darkTextStyle,
  );
}

TextTheme darkTextStyle = TextTheme(displayLarge: TextStyle(fontSize: 30));
