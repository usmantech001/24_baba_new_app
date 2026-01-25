import 'package:baba_24/presentation/screens/dashboard/settings/settings_screen.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class LegacyTrustPrivacyScreen extends StatelessWidget {
  const LegacyTrustPrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite.withValues(alpha: .97),
      appBar: CustomAppbar(title: 'Legacy, Trust & Privacy'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(text: 'Our Commitment', fontWeight: FontWeight.bold),
            Gap(10.h),
            CustomText(
              text:
                  'At 24baba, your safety and privacy are our top priorities. We employ industry leading security measures to ensure every rental experience is protected and transparent',
              color: AppColors.kDarkerGrey,
              fontSize: 12.sp,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30.h),
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
              decoration: BoxDecoration(
                color: AppColors.kWhite,
                borderRadius: BorderRadius.circular(15.sp),
              ),
              child: Column(
                spacing: 15.h,
                children: [
                  Row(
                    spacing: 10.w,
                    children: [
                      Icon(Icons.safety_check, color: AppColors.kAccentPink),
                      CustomText(
                        text: 'Trust & Safety',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                     
                    ],
                  ),
                   TrustSafetyContainer(text: 'Secure SSl Encryption', descrp: 'Your data is protected with 256 bit encryption', icon: Icons.lock),
                   TrustSafetyContainer(text: 'Verified Partner', descrp: 'Certified 24baba rental network provider', icon: Icons.lock),
                   TrustSafetyContainer(text: 'Secure Payments', descrp: 'PCI-DSS Complaint transaction processing', icon: Icons.lock),
                ], 
              ),
            ),

            CustomText(text: 'Legal Document', fontWeight: FontWeight.bold,),
             Gap(20.h),
            Column(
              spacing: 15.h,
              children: [
                SettingsTile(title: 'Terms & Conditions', icon: Icons.folder, iconColor: AppColors.kLightPink.withValues(alpha: .3)),
                SettingsTile(title: 'Privacy Policy', icon: Icons.folder, iconColor: AppColors.kLightPink.withValues(alpha: .3)),
                SettingsTile(title: 'Rental Agreement', icon: Icons.folder, iconColor: AppColors.kLightPink.withValues(alpha: .3)),
                SettingsTile(title: 'Cookie Settings', icon: Icons.folder, iconColor: AppColors.kLightPink.withValues(alpha: .3)),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TrustSafetyContainer extends StatelessWidget {
  const TrustSafetyContainer({super.key, required this.text, required this.descrp, required this.icon});
   final String text;
   final String descrp;
   final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
        color: AppColors.kAccentPink.withValues(alpha: .04),
        borderRadius: BorderRadius.circular(15.sp),
      ),
      child: Row(
        spacing: 10.w,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.kWhite,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Icon(Icons.lock, color: AppColors.kAccentPink),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: text,
                  fontWeight: FontWeight.bold,
                  fontSize: 13.sp,
                ),
                CustomText(
                  text: descrp,
                  fontSize: 12.sp,
                  color: AppColors.kDarkerGrey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
