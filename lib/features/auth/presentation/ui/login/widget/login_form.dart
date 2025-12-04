import 'package:bookia/core/theming/app_colors.dart';
import 'package:bookia/core/widgets/app_button.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/ui/login/widget/password_filed.dart';
import 'package:bookia/features/home/presentation/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is LoginLoadingState) {
          showDialog(
            context: context,
            builder: (contex) => Center(child: CircularProgressIndicator()),
          );
        } else if (state is LoginSuccessState) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
            (e) => false,
          );
        } else if (state is LoginErrorState) {
          Navigator.pop(context);
          showDialog(
            context: context,
            builder: (context) => AlertDialog(content: Text("Error")),
          );
        }
      },
      child: Form(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                onTapOutside: (f) {
                  FocusScope.of(context).unfocus();
                },
                cursorColor: AppColors.mainColor,
                decoration: InputDecoration(hintText: "Please Enter email"),
              ),
              SizedBox(height: 15.h),
              PasswordFiled(controller: passwordController),
              SizedBox(height: 30),
              AppButton(
                titleButton: "Login",
                backgroundButton: AppColors.mainColor,
                onTap: () {
                  context.read<AuthCubit>().login(
                    email: emailController.text,
                    pass: passwordController.text,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
