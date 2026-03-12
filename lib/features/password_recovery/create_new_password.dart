import 'package:finance_ui/core/routing/app_routes.dart';
import 'package:finance_ui/core/styling/app_colors.dart';
import 'package:finance_ui/core/wedgets/custem_back_butoon.dart';
import 'package:finance_ui/core/wedgets/custom_text_field.dart';
import 'package:finance_ui/core/wedgets/primary_button_wedgit.dart';
import 'package:finance_ui/core/wedgets/spasing_widgget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  HeightSpace(height: 12),
                  CustomBackButton(),
                  HeightSpace(height: 28),
                  SizedBox(
                    width: 331.w,
                    child: Text(
                      "Create New Password",
                      style: TextStyle(
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primarycolor,
                      ),
                    ),
                  ),
                  HeightSpace(height: 10),
                  SizedBox(
                    width: 331.w,
                    child: Text(
                      "Your new password must be unique from those previously used.",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.secondarycolor,
                      ),
                    ),
                  ),
                  HeightSpace(height: 28),
                  CustomTextField(
                    controller: passwordController,
                    hintText: "Password",
                    suffixIcon: Icon(
                      Icons.remove_red_eye,
                      color: AppColors.secondarycolor,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 6) {
                        return 'Please enter your password at least 6 characters';
                      }
                      // You can add more complex password validation here if needed
                      return null;
                    },
                  ),
                  HeightSpace(height: 15),
                  CustomTextField(
                    controller: confirmPasswordController,
                    hintText: "Confirm Password",
                    suffixIcon: Icon(
                      Icons.remove_red_eye,
                      color: AppColors.secondarycolor,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (passwordController.text != value) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  HeightSpace(height: 38),
                  PrimaryButtonwidget(
                    onpress: () {
                      if (formKey.currentState!.validate()) {
                        context.goNamed(AppRoutes.passChangedScreen);
                      }
                    },
                    buttontext: "Reset Password",
                    buttoncolor: AppColors.primarycolor,
                    textColor: Colors.white,
                    width: 331.w,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
