import 'package:finance_ui/core/routing/app_routes.dart';
import 'package:finance_ui/core/styling/app_assets.dart';
import 'package:finance_ui/core/styling/app_colors.dart';
import 'package:finance_ui/core/wedgets/primary_button_wedgit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PasswordChangedScreen extends StatelessWidget {
  const PasswordChangedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // استخدام Image.asset بدلاً من SvgPicture لحل مشكلة الـ Crash نهائياً
                Image.asset(
                  AppAssets
                      .successmark, // تأكد أن المسار في AppAssets ينتهي بـ .png
                  width: 150.w,
                  height: 150.h,
                  fit: BoxFit.contain,
                  // إضافة معالج خطأ احتياطي
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.check_circle,
                      size: 150.w,
                      color: AppColors.primarycolor,
                    );
                  },
                ),

                SizedBox(height: 35.h),

                Text(
                  "Password changed!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 27.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primarycolor,
                  ),
                ),

                SizedBox(height: 12.h),

                Text(
                  "Your password has been changed successfully",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primarycolor,
                  ),
                ),

                SizedBox(height: 64.h),

                PrimaryButtonwidget(
                  onpress: () {
                    context.goNamed(AppRoutes.loginscreen);
                  },
                  buttontext: "Back to Login",
                  buttoncolor: AppColors.primarycolor,
                  textColor: Colors.white,
                  width: double.infinity,
                  height: 56.h,
                  borderradius: 8,
                  fontsize: 15.sp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
