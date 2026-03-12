import 'package:finance_ui/core/styling/app_colors.dart';
import 'package:finance_ui/core/styling/app_styles.dart';
import 'package:finance_ui/core/wedgets/custem_back_butoon.dart';
import 'package:finance_ui/core/wedgets/primary_button_wedgit.dart';
import 'package:finance_ui/core/wedgets/spasing_widgget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController printCodeControlar = TextEditingController();

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
                  CustomBackButton(),
                  HeightSpace(height: 28),
                  SizedBox(
                    width: 280.w,

                    child: Text(
                      "OTP Verification",
                      style: AppStyles.primaryheadlinestyle.copyWith(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  HeightSpace(height: 10),
                  SizedBox(
                    width: 331.w,
                    child: Text(
                      "Enter the verification code we just sent on your email address.",
                      style: AppStyles.subtitlestyle.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                  HeightSpace(height: 32),
                  MaterialPinField(
                    length: 4,
                    // التأكد أن النوع PinInputController
                    keyboardType: TextInputType.number,
                    onCompleted: (pin) => print('PIN: $pin'),
                    theme: MaterialPinTheme(
                      cellSize: Size(70.w, 60.h), // الدمج بين العرض والارتفاع
                      shape: MaterialPinShape.outlined,
                      borderRadius: BorderRadius.circular(8.r),
                      spacing: 16.w,
                      // الألوان الجديدة (تحويل من active/selected إلى المسميات الجديدة)
                      // ignore: deprecated_member_use
                      borderColor: AppColors.primarycolor.withOpacity(
                        0.2,
                      ), // inactiveColor
                      focusedBorderColor:
                          AppColors.primarycolor, // selectedColor
                      completeBorderColor: const Color(0xFFE8E8E8),
                      filledBorderColor: AppColors.whitecolor, // activeColor
                      // تنسيق النص داخل المربعات
                      textStyle: AppStyles.primaryheadlinestyle.copyWith(
                        fontSize: 22.sp,
                        color: AppColors.primarycolor,
                      ),
                    ),
                    onChanged: (value) {
                      printCodeControlar.text = value;
                    },
                  ),
                  HeightSpace(height: 32),
                  PrimaryButtonwidget(
                    buttontext: "Verify",
                    onpress: () {
                      if (printCodeControlar.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please enter the OTP code"),
                          ),
                        );
                      } else {
                        // قم بإجراء عملية التحقق هنا
                      }
                    },
                  ),
                  HeightSpace(height: 357),
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Didn’t received code?",
                        style: AppStyles.black15boldstyle.copyWith(
                          color: AppColors.primarycolor,
                        ),
                        children: [
                          TextSpan(
                            text: "Resend",
                            style: AppStyles.black15boldstyle.copyWith(
                              color: AppColors.blackcolor,
                              fontSize: 15.sp,
                            ),
                            recognizer:
                                TapGestureRecognizer() //عشان لما بدنا نعمل الكلمة كزر
                                  ..onTap = () {},
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
