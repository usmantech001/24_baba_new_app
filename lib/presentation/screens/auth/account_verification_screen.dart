import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
import 'package:baba_24/presentation/widgets/custom_button.dart';
import 'package:baba_24/presentation/widgets/custom_pinput.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class AccountVerificationScreen extends StatelessWidget {
  const AccountVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Account Verification'),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 15.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
               CustomButton(
                  topPadding: 100.h,
                  onPressed: (){}, text: 'Verify & Continue', radius: 10.sp,),
               Gap(10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 5.w,
                  children: [
                    Icon(Icons.lock, size: 15.sp, color: AppColors.kDarkerGrey,),
                    CustomText(text: 'SECURE VERIFICATION', color: AppColors.kDarkerGrey, fontSize: 12.sp,),
                  ],
                )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                radius: 30.r,
                backgroundColor: AppColors.kAccentPink.withValues(alpha: .1),
                child: Icon(Icons.verified_user, color: AppColors.kAccentPink),
              ),
            ),
            Gap(20.h),
            CustomText(
              text: 'Verify your account',
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
            Gap(5.h),
            CustomText(
              text: 'Enter the 6-digit code sent to',
              color: AppColors.kDarkerGrey,
              fontSize: 13.sp,
            ),
            CustomText(
              text: 'akanjiusman67@gmail.com',
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
            ),
            Gap(40.h),
            CustomPinput(
              lenght: 6,
              // controller: emailController.otpController,
              onChanged: (value) {},
            ),
            Gap(20.h),
            CustomText(
              text: 'Didn\'t receive code?',
              color: AppColors.kDarkerGrey,
              fontSize: 13.sp,
            ),
            Gap(5),
            CustomText(text: 'Resend Code (00:45)', color: AppColors.kAccentPink, fontSize: 13.sp, fontWeight: FontWeight.bold,),
           
          ],
        ),
      ),
    );
  }
}
