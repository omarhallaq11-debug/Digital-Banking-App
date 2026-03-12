import 'package:finance_ui/core/routing/app_routes.dart';
import 'package:finance_ui/core/routing/router_genretion_config.dart';
import 'package:finance_ui/core/styling/app_assets.dart';
import 'package:finance_ui/core/styling/app_colors.dart';
import 'package:finance_ui/core/styling/app_styles.dart';
import 'package:finance_ui/core/wedgets/icon_butoon.dart';
import 'package:finance_ui/core/wedgets/primary_button_wedgit.dart';
import 'package:finance_ui/core/wedgets/spasing_widgget.dart';
import 'package:finance_ui/core/wedgets/custom_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RegestarScreen extends StatefulWidget {
  const RegestarScreen({super.key});

  @override
  State<RegestarScreen> createState() => _RegestarScreenState();
}

class _RegestarScreenState extends State<RegestarScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(22.6).w,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
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
                      "Hello! Register to get started",
                      style: TextStyle(
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primarycolor,
                      ),
                    ),
                  ),
                  HeightSpace(height: 32),
                  CustomTextField(
                    controller: nameController,
                    hintText: "User Name",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your name";
                      }
                      return null;
                    },
                  ),
                  HeightSpace(height: 12),
                  CustomTextField(
                    controller: emailController,
                    hintText: "Email",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your email";
                      }
                      return null;
                    },
                  ),
                  HeightSpace(height: 12),
                  CustomTextField(
                    controller: passwordController,
                    hintText: "Password",
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 6) {
                        return "Please enter your password at least 6 characters";
                      }
                      return null;
                    },
                  ),
                  HeightSpace(height: 12),
                  CustomTextField(
                    controller: confirmPasswordController,
                    hintText: "Confirm Password",
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 6) {
                        return "Please enter your password at least 6 characters";
                      }
                      if (value != passwordController.text) {
                        return "Passwords do not match!";
                      }
                      return null;
                    },
                  ),
                  HeightSpace(height: 32),
                  PrimaryButtonwidget(
                    onpress: () {
                      if (_formKey.currentState!.validate()) {
                        print(nameController.text);
                        print(emailController.text);
                        print(passwordController.text);
                        print(confirmPasswordController.text);
                      }
                    },
                    buttontext: "Register",
                    buttoncolor: AppColors.primarycolor,
                    textColor: Colors.white,
                    width: 331.w,
                    height: 56.h,
                    borderradius: 8,
                    fontsize: 15,
                  ),
                  HeightSpace(height: 35),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 96.w, child: Divider()),
                      WidthSpace(width: 12),
                      Text(
                        "Or Register with",
                        style: AppStyles.black15boldstyle.copyWith(
                          color: Color(0xff6A707C),
                          fontSize: 15.sp,
                        ),
                      ),
                      WidthSpace(width: 12),
                      SizedBox(width: 96.w, child: Divider()),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialButton(
                        iconPath: AppAssets.fasebooksvg,
                        onTap: () {},
                      ),
                      WidthSpace(width: 7),
                      SocialButton(iconPath: AppAssets.googlesvg, onTap: () {}),
                      WidthSpace(width: 7),
                      SocialButton(iconPath: AppAssets.appLesvg, onTap: () {}),
                    ],
                  ),
                  HeightSpace(height: 54),
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Already have an account? ",
                        style: AppStyles.black15boldstyle.copyWith(
                          color: AppColors.primarycolor,
                        ),
                        children: [
                          TextSpan(
                            text: "Login",
                            style: AppStyles.black15boldstyle.copyWith(
                              color: AppColors.blackcolor,
                              fontSize: 15.sp,
                            ),
                            recognizer:
                                TapGestureRecognizer() //عشان لما بدنا نعمل الكلمة كزر
                                  ..onTap = () {
                                    RouterGenretionConfig.goRouter.pushNamed(
                                      AppRoutes.loginscreen,
                                    );
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
