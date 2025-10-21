import 'package:bookia/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../gen/assets.gen.dart';

class AuthWithSocial extends StatelessWidget {
  const AuthWithSocial({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Social(svgIcon: Assets.svgicons.googleIc),
        Social(svgIcon: Assets.svgicons.facebook1SvgrepoCom),
        Social(svgIcon: Assets.svgicons.appleIc),
      ],
    );
  }
}

class Social extends StatelessWidget {
  final String svgIcon;
  const Social({super.key, required this.svgIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: SvgPicture.asset(svgIcon, width: 25.w),
    );
  }
}
