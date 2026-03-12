import 'package:finance_ui/core/routing/app_routes.dart';
import 'package:finance_ui/core/routing/router_genretion_config.dart';
import 'package:finance_ui/core/styling/app_assets.dart';
import 'package:finance_ui/core/styling/app_colors.dart';
import 'package:finance_ui/core/styling/app_styles.dart';
import 'package:finance_ui/core/wedgets/custom_text_field.dart';
import 'package:finance_ui/core/wedgets/icon_butoon.dart';
import 'package:finance_ui/core/wedgets/primary_button_wedgit.dart';
import 'package:finance_ui/core/wedgets/spasing_widgget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.6.w),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeightSpace(height: 12.h),
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
                    width: 280.w,

                    child: Text(
                      "Welcome Back! Again! ",
                      style: AppStyles.primaryheadlinestyle,
                    ),
                  ),
                  HeightSpace(height: 32),
                  CustomTextField(
                    controller: emailController,
                    hintText: "Enter Email ",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      // You can add more complex email validation here if needed
                      return null;
                    },
                  ),
                  HeightSpace(height: 15),
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
                  Align(
                    alignment: Alignment.centerRight,
                    child: RichText(
                      text: TextSpan(
                        text: "Forget Password ?",
                        style: AppStyles.black15boldstyle.copyWith(
                          color: Color(0xff6A707C),
                          fontSize: 15.sp,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            RouterGenretionConfig.goRouter.pushNamed(
                              AppRoutes.forgetpassword,
                            );
                          },
                      ),
                    ),
                  ),
                  HeightSpace(height: 30),
                  PrimaryButtonwidget(
                    onpress: () {
                      if (formKey.currentState!.validate()) {
                        GoRouter.of(
                          context,
                        ).pushNamed(AppRoutes.verifyCodeScreen);
                      }
                    },
                    buttontext: "Login",
                    buttoncolor: AppColors.primarycolor,
                    textColor: Colors.white,
                    width: 331.w,
                  ),
                  const HeightSpace(height: 35),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 105.w, child: const Divider()),
                      WidthSpace(width: 12),
                      Text(
                        "Or Login With",
                        style: AppStyles.black15boldstyle.copyWith(
                          color: Color(0xff6A707C),
                          fontSize: 15.sp,
                        ),
                      ),
                      WidthSpace(width: 12),
                      SizedBox(width: 105.w, child: const Divider()),
                    ],
                  ),
                  HeightSpace(height: 22),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialButton(
                        iconPath: AppAssets.fasebooksvg,
                        onTap: () {},
                      ),
                      const WidthSpace(width: 7),
                      SocialButton(iconPath: AppAssets.googlesvg, onTap: () {}),
                      const WidthSpace(width: 7),
                      SocialButton(iconPath: AppAssets.appLesvg, onTap: () {}),
                    ],
                  ),
                  HeightSpace(height: 155),
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Don't have an account ? ",
                        style: AppStyles.black15boldstyle.copyWith(
                          color: AppColors.primarycolor,
                        ),
                        children: [
                          TextSpan(
                            text: "Register",
                            style: AppStyles.black15boldstyle.copyWith(
                              color: AppColors.blackcolor,
                              fontSize: 15.sp,
                            ),
                            recognizer:
                                TapGestureRecognizer() //عشان لما بدنا نعمل الكلمة كزر
                                  ..onTap = () {
                                    RouterGenretionConfig.goRouter.pushNamed(
                                      AppRoutes.registerscreen,
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
