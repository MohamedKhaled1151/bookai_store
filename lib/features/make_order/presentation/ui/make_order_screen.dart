import 'package:bookia/core/theming/app_colors.dart';
import 'package:bookia/core/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MakeOrderScreen extends StatelessWidget {
  const MakeOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        spacing: 15,
        children: [
          SizedBox(height: 100.h),
          TextFormField(decoration: InputDecoration(hintText: "Name")),

          TextFormField(decoration: InputDecoration(hintText: "Phone")),
          TextFormField(decoration: InputDecoration(hintText: "Address")),
          TextFormField(decoration: InputDecoration(hintText: "Email")),
          SizedBox(height: 20.h),
          AppButton(
            titleButton: "Place Order",
            backgroundButton: AppColors.mainColor,
          ),
        ],
      ),
    );
  }
}
