import 'package:bookia/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppLightMode {
  static ThemeData theme = ThemeData(
    fontFamily: "DMSerifDispla",
    scaffoldBackgroundColor: Colors.white,
    textTheme: lightTextStyle,
    appBarTheme: AppBarTheme(backgroundColor: Colors.transparent),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.borderColor,
      filled: true,
      hintStyle: TextStyle(fontSize: 15.sp, color: AppColors.grayTextFormFiled),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: AppColors.borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: AppColors.mainColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: AppColors.borderColor),
      ),
    ),
  );
}

TextTheme lightTextStyle = TextTheme(
  displayLarge: TextStyle(fontSize: 30.sp),

  displaySmall: TextStyle(fontSize: 18.sp),
  titleSmall: TextStyle(fontSize: 16.sp),
);
