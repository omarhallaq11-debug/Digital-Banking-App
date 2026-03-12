import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialButton extends StatelessWidget {
  final String iconPath;
  final VoidCallback onTap;

  const SocialButton({super.key, required this.iconPath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        width: 105.w, // نفس عرض الـ Divider الذي استخدمته ليكون متناسقاً
        height: 60.h,
        padding: EdgeInsets.symmetric(vertical: 15.h),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xffE8ECF4),
          ), // لون الإطار الخفيف
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: SvgPicture.asset(iconPath, fit: BoxFit.contain),
      ),
    );
  }
}
