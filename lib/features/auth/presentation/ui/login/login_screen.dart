import 'package:bookia/core/theming/app_colors.dart';
import 'package:bookia/core/widgets/app_button.dart';
import 'package:bookia/core/widgets/button_text.dart';
import 'package:bookia/core/widgets/custom_app_bar.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/ui/login/widget/auth_with_social.dart';
import 'package:bookia/features/auth/presentation/ui/login/widget/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:text_divider/text_divider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        appBar: CustomAppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 29.h),
                Text(
                  "Welcome back! Glad \n to see you, Again!",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                SizedBox(height: 34.h),
                LoginForm(),
                SizedBox(height: 13.h),

                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forget password ?",
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontSize: 14.sp,
                      color: AppColors.darkGray,
                    ),
                  ),
                ),

                SizedBox(height: 34.h),
                TextDivider(
                  thickness: 2,
                  indent: 10,
                  endIndent: 10,
                  text: Text(
                    "Or Login with",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: AppColors.grayTextFormFiled,
                    ),
                  ),
                ),
                SizedBox(height: 21.h),
                AuthWithSocial(),
                SizedBox(height: 120.h),
                ButtonText(
                  textButton: "Register Now",
                  descriptionButton: "Don't have account ? ",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
