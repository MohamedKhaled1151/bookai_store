import 'package:bookia/core/theming/app_colors.dart';
import 'package:flutter/material.dart';

class ButtonText extends StatelessWidget {
  final String textButton;
  final String descriptionButton;
  const ButtonText({
    super.key,
    required this.textButton,
    required this.descriptionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(descriptionButton, style: Theme.of(context).textTheme.titleSmall),

        TextButton(
          onPressed: () {},
          child: Text(
            textButton,
            style: Theme.of(
              context,
            ).textTheme.displaySmall?.copyWith(color: AppColors.mainColor),
          ),
        ),
      ],
    );
  }
}
