import 'package:finance_ui/core/styling/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryoutlinedButtonwidget extends StatelessWidget {
  final String? buttontext;
  final Color? buttoncolor;
  final double? width;
  final double? height;
  final double? borderradius;
  final Color? textColor;
  final double? fontsize;
  final void Function()? onpress;
  final Color? bordercolor;

  const PrimaryoutlinedButtonwidget({
    super.key,
    this.buttontext,
    this.buttoncolor,
    this.width,
    this.height,
    this.borderradius,
    this.textColor,
    this.onpress,
    this.fontsize,
    this.bordercolor,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onpress,
      style: OutlinedButton.styleFrom(
        //backgroundColor: buttoncolor ?? AppColors.whitecolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderradius ?? 8.r),
        ),
        fixedSize: Size(width ?? 331.w, height ?? 56.h),
        side: BorderSide(
          color: bordercolor ?? AppColors.primarycolor,
          width: 1.w,
        ),
      ),
      child: Text(
        buttontext ?? "Button",
        style: TextStyle(
          color: textColor ?? AppColors.primarycolor,
          fontSize: fontsize ?? 16.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
