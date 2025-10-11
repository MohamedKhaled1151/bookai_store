import 'package:bookia/core/theming/app_colors.dart';
import 'package:bookia/core/widgets/app_button.dart';
import 'package:bookia/features/auth/presentation/ui/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:bookia/gen/assets.gen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.images.welcome.path),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Column(
            children: [
              SizedBox(height: 135.h),
              Image.asset(Assets.logos.splashLogo.path),
              SizedBox(height: 26.h),

              Text(
                "Order Your Book Now!",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Spacer(),
              AppButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                titleButton: "login",
                backgroundButton: AppColors.mainColor,
              ),
              SizedBox(height: 15.h),
              AppButton(
                titleButton: "Register",
                backgroundButton: Colors.white,
              ),
              SizedBox(height: 94.h),
            ],
          ),
        ),
      ),
    );
  }
}
