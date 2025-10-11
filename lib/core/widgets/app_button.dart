import 'package:bookia/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final String titleButton;
  final Color backgroundButton;
  final void Function()? onTap;
  const AppButton({
    super.key,
    required this.titleButton,
    required this.backgroundButton,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 16.h),
        width: double.infinity,

        decoration: BoxDecoration(
          color: backgroundButton,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: backgroundButton == AppColors.mainColor
                ? AppColors.mainColor
                : Colors.black,
          ),
        ),
        child: Text(
          titleButton,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: backgroundButton == AppColors.mainColor
                ? Colors.white
                : Colors.black,
          ),
        ),
      ),
    );
  }
}
