import 'package:finance_ui/core/routing/app_routes.dart';
import 'package:finance_ui/core/styling/app_assets.dart';
import 'package:finance_ui/core/styling/app_colors.dart';
import 'package:finance_ui/core/styling/app_styles.dart';
import 'package:finance_ui/core/wedgets/primary_button_wedgit.dart';
import 'package:finance_ui/core/wedgets/primary_outedline_wedgit.dart';
import 'package:finance_ui/core/wedgets/spasing_widgget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OnBordingScreen extends StatelessWidget {
  const OnBordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            AppAssets.onBoard1,
            width: double.infinity,
            height: 575.h,
            fit: BoxFit.fill,
          ),
          HeightSpace(height: 21),
          PrimaryButtonwidget(
            onpress: () {
              GoRouter.of(context).pushNamed(AppRoutes.loginscreen);
            },
            buttontext: "Login",
            buttoncolor: AppColors.primarycolor,
            textColor: Colors.white,
            width: 331.w,
            height: 56.h,
            borderradius: 8,
            fontsize: 18,
          ),
          HeightSpace(height: 16),
          PrimaryoutlinedButtonwidget(
            onpress: () {
              GoRouter.of(context).pushNamed(AppRoutes.registerscreen);
            },
            buttontext: "Regester",
            buttoncolor: AppColors.whitecolor,
            textColor: AppColors.primarycolor,
            width: 331.w,
            height: 56.h,
            borderradius: 8,
            fontsize: 18,
          ),

          HeightSpace(height: 46),
          RichText(
            text: TextSpan(
              text: "contnue as a giest",
              style: AppStyles.black15boldstyle.copyWith(
                color: Color(0xff202955),
                fontSize: 15.sp,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  GoRouter.of(context).pushNamed(AppRoutes.mainScreen);
                },
            ),
          ),
        ],
      ),
    );
  }
}
