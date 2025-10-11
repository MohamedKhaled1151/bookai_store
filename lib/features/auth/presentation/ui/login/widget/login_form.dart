import 'package:bookia/core/theming/app_colors.dart';
import 'package:bookia/features/auth/presentation/ui/login/widget/password_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            onTapOutside: (f) {
              FocusScope.of(context).unfocus();
            },
            cursorColor: AppColors.mainColor,
            decoration: InputDecoration(hintText: "Please Enter email"),
          ),
          SizedBox(height: 15.h),
          PasswordFiled(),
        ],
      ),
    );
  }
}
