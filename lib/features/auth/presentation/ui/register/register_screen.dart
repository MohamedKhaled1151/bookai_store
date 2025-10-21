import 'package:bookia/core/widgets/custom_app_bar.dart';
import 'package:bookia/features/auth/presentation/ui/register/widget/regiater_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/button_text.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 28.h),
                Text(
                  "Hello! Register to get \n started",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                SizedBox(height: 32.h),
                FormFiled(),
                SizedBox(height: 150.h),
                ButtonText(
                  textButton: "Login Now",
                  descriptionButton: "Already have an account?",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
