import 'package:flutter/material.dart';

import '../../../../../../core/theming/app_colors.dart';

class RegisterPassword extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String massage;

  const RegisterPassword({
    super.key,
    required this.controller,
    this.validator,
    required this.massage,
  });

  @override
  State<RegisterPassword> createState() => _RegisterPasswordState();
}

class _RegisterPasswordState extends State<RegisterPassword> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      onTapOutside: (f) {
        FocusScope.of(context).unfocus();
      },
      obscureText: isObscure,
      cursorColor: AppColors.mainColor,
      decoration: InputDecoration(
        hintText: widget.massage,

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
    ;
  }
}
