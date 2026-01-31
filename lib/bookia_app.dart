import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bookia/core/theming/app_light_mode.dart';
import 'core/local/local_constants.dart';
import 'core/local/local_helper.dart';
import 'features/bottom_nav_bar/presentation/bottom_nav_bar.dart';
import 'features/welcome/presentation/ui/welcome_screen.dart';

class BookiaApp extends StatelessWidget {
  const BookiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppLightMode.theme,
          home: startScreen(),
        );
      },
    );
  }
}

startScreen() {
  if (LocalHelper.getString(LocalConstants.token) != null) {
    return BottomNavBar();
  } else {
    return WelcomeScreen();
  }
}
