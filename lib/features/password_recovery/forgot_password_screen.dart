import 'package:finance_ui/core/routing/app_routes.dart';
import 'package:finance_ui/core/styling/app_colors.dart';
import 'package:finance_ui/core/styling/app_styles.dart';
import 'package:finance_ui/core/wedgets/custom_text_field.dart';
import 'package:finance_ui/core/wedgets/primary_button_wedgit.dart';
import 'package:finance_ui/core/wedgets/spasing_widgget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(22.6.w),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  HeightSpace(height: 12),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 41.w,
                      height: 41.h,

                      decoration: BoxDecoration(
                        color: Color(0xffE8ECF4),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: IconButton(
                        onPressed: () {
                          GoRouter.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: AppColors.primarycolor,
                        ),
                      ),
                    ),
                  ),
                  HeightSpace(height: 28),
                  SizedBox(
                    width: 331.w,
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        fontSize: 30.sp,
                        color: AppColors.primarycolor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  HeightSpace(height: 16),
                  SizedBox(
                    width: 331.w,
                    child: Text(
                      "Don't worry! It occurs. Please enter the email linked with your account.",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColors.secondarycolor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  HeightSpace(height: 32),
                  CustomTextField(
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      // You can add more complex email validation here if needed
                      return null;
                    },
                    hintText: "Enter your email",
                  ),
                  HeightSpace(height: 32),
                  PrimaryButtonwidget(
                    onpress: () {
                      if (formKey.currentState!.validate()) {
                        // Proceed with sending reset email logic
                      }
                    },
                    buttontext: "Send",
                    buttoncolor: AppColors.primarycolor,
                    textColor: Colors.white,
                    width: 331.w,
                    height: 56.h,
                    borderradius: 8,
                    fontsize: 15.sp,
                  ),
                  HeightSpace(height: 361),
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Remember password?",
                        style: AppStyles.black16w500style.copyWith(
                          color: AppColors.primarycolor,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text: " Login",
                            style: AppStyles.black16w500style.copyWith(
                              color: AppColors.blackcolor,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                GoRouter.of(
                                  context,
                                ).pushNamed(AppRoutes.loginscreen);
                              },
                          ),
                        ],
                      ),
                    ),
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
