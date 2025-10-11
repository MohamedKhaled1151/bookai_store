import 'package:bookia/core/theming/app_colors.dart';
import 'package:flutter/material.dart';

class PasswordFiled extends StatefulWidget {
  const PasswordFiled({super.key});

  @override
  State<PasswordFiled> createState() => _PasswordFiledState();
}

class _PasswordFiledState extends State<PasswordFiled> {
  @override
  bool isObscure = true;

  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (f) {
        FocusScope.of(context).unfocus();
      },
      obscureText: isObscure,
      cursorColor: AppColors.mainColor,
      decoration: InputDecoration(
        hintText: " Please enter your password ",

        suffixIcon: InkWell(
          onTap: () {
            setState(() {
              isObscure = !isObscure;
            });
          },
          child: Icon(isObscure ? Icons.visibility_off : Icons.visibility),
        ),
      ),
    );
  }
}
