import 'package:bookia/core/widgets/app_button.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/ui/register/widget/register_password.dart';
import 'package:bookia/features/home/presentation/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/theming/app_colors.dart';

class FormFiled extends StatefulWidget {
  const FormFiled({super.key});

  @override
  State<FormFiled> createState() => _FormFiledState();
}

class _FormFiledState extends State<FormFiled> {
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var passController = TextEditingController();
  var confirmPassController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          Navigator.pop(context);
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
            (e) => false,
          );
        } else if (state is RegisterLoadingState) {
          showDialog(
            context: context,
            builder: (context) => Center(child: CircularProgressIndicator()),
          );
        } else if (state is RegisterErrorState) {
          Navigator.pop(context);
          showDialog(
            context: context,
            builder: (context) => AlertDialog(content: Text("Error")),
          );
        }
      },
      child: Form(
        key: formKey,

        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              validator: (v) {
                if ((v?.isEmpty ?? false) || v == null) {
                  return "name is required";
                }
              },

              onTapOutside: (f) {
                FocusScope.of(context).unfocus();
              },
              cursorColor: AppColors.mainColor,
              decoration: InputDecoration(hintText: "Please Enter name"),
            ),
            SizedBox(height: 11.h),
            TextFormField(
              controller: emailController,
              validator: (v) {
                if ((v?.isEmpty ?? false) || v == null) {
                  return "email is required";
                }
              },
              onTapOutside: (f) {
                FocusScope.of(context).unfocus();
              },
              cursorColor: AppColors.mainColor,
              decoration: InputDecoration(hintText: "Please Enter email"),
            ),
            SizedBox(height: 11.h),
            RegisterPassword(
              massage: "please Enter password",
              controller: passController,
              validator: (v) {
                if ((v?.isEmpty ?? false) || v == null) {
                  return "password is required";
                }
              },
            ),
            SizedBox(height: 11.h),
            RegisterPassword(
              massage: "confirm Password ",
              controller: confirmPassController,
              validator: (v) {
                if ((v?.isEmpty ?? false) || v == null) {
                  return "password is required";
                } else if (v != passController.text) {
                  return "confirm Password not  match ";
                }
              },
            ),
            SizedBox(height: 30.h),
            AppButton(
              onTap: () {
                if (formKey.currentState?.validate() ?? false) {
                  context.read<AuthCubit>().register(
                    name: nameController.text,
                    email: emailController.text,
                    password: passController.text,
                    confirmPassword: confirmPassController.text,
                  );
                }
              },
              titleButton: "Register",
              backgroundButton: AppColors.mainColor,
            ),
          ],
        ),
      ),
    );
  }
}
