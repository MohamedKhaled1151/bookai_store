import 'package:bookia/core/theming/app_colors.dart';
import 'package:flutter/material.dart';

class ButtonText extends StatelessWidget {
  const ButtonText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t have an account?",
          style: Theme.of(context).textTheme.titleSmall,
        ),

        TextButton(
          onPressed: () {},
          child: Text(
            "Register Now",
            style: Theme.of(
              context,
            ).textTheme.displaySmall?.copyWith(color: AppColors.mainColor),
          ),
        ),
      ],
    );
  }
}
