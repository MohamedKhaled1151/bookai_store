import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppLightMode {
  static ThemeData theme = ThemeData(
    fontFamily: "DMSerifDispla",
    scaffoldBackgroundColor: Colors.white,
    textTheme: lightTextStyle,
  );
}

TextTheme lightTextStyle = TextTheme(
  displayLarge: TextStyle(fontSize: 30.sp),

  displaySmall: TextStyle(fontSize: 18.sp),
  titleSmall: TextStyle(fontSize: 16.sp),
);
