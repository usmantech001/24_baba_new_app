import 'package:baba_24/presentation/screens/onboard/widgets/app_text_field.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
import 'package:baba_24/presentation/widgets/custom_button.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: ''),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50.r,
                backgroundColor: AppColors.kAccentPink.withValues(alpha: .1),
              ),
            ),
            Gap(40.h),
            CustomText(
              text: 'Forgot Password?',
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
            Gap(10.h),
            CustomText(
              text:
                  'Enter the email address associated with your account and we will send you a link to reset your password and get back on the road',
              color: AppColors.kDarkerGrey,
              fontSize: 14.sp,
            ),
            Gap(30.h),
            AppTextField(
              controller: TextEditingController(),
              label: 'Email Address',
              prefixIcon: Icon(Icons.mail, color: AppColors.kAccentPink),
              hintText: 'e.g ali@gmail.com',
            ),
            CustomButton(onPressed: () {}, text: 'Send Reset Link'),
            // Gap(10),
            // Center(
            //   child: RichText(
            //     textAlign: TextAlign.center,
            //     text: TextSpan(
            //       text: 'Remember your password?',
            //       style: customTextStyle(
            //         color: AppColors.kDarkerGrey,
            //         fontSize: 14.sp,
            //       ),
            //       children: [TextSpan(text: ' Log in', style: customTextStyle(color: AppColors.kAccentPink, fontSize: 14.sp, fontWeight: FontWeight.bold))],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
