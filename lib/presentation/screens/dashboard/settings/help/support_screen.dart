import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
import 'package:baba_24/presentation/widgets/custom_button.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Support'),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 40.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: 'How do i extend my rental?',
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
            Gap(20.h),
            RichText(
              text: TextSpan(
                text:
                    'You can easily extend your rent through the "My Trips" section of the app, select your active rental and tap',
                style: customTextStyle(
                  fontSize: 13.sp,
                  color: AppColors.kDarkerGrey,
                ),
                children: [
                  TextSpan(
                    text: " 'Extend Trip'\n",
                    style: customTextStyle(
                      color: AppColors.kAccentPink,
                      fontSize: 13.sp,
                    ),
                  ),
                ],
              ),
            ),
            CustomText(
              text:
                  'Please note that extensions are subject to vehicle availability and may incur additional charges at the prevailing daily rate. If the vehicle is already booked by another customer, you may need to return it as originally scheduled. \n\nIf you are unable to extend via the app or encounter any errors, please contact our 24/7 support team via the chat feature or call us at least 2 hours before your scheduled return time to avoid late fees.',
              fontSize: 13.sp,
              color: AppColors.kDarkerGrey,
            ),
            Gap(20.h),
            Row(
              spacing: 5.w,
              children: [
                Icon(
                  Icons.check_circle,
                  color: AppColors.kAccentPink,
                  size: 15.sp,
                ),
                CustomText(
                  text: 'Availability check is real-time',
                  fontSize: 12.sp,
                  color: AppColors.kDarkerGrey,
                ),
              ],
            ),
            Gap(10.h),
            Row(
              spacing: 5.w,
              children: [
                Icon(
                  Icons.check_circle,
                  color: AppColors.kAccentPink,
                  size: 15.sp,
                ),
                CustomText(
                  text: 'ALate fees apply after 30 mins grace period',
                  fontSize: 12.sp,
                  color: AppColors.kDarkerGrey,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 40.h),
              child: Divider(color: AppColors.kGrey),
            ),
            CustomText(text: 'Was this help?', fontWeight: FontWeight.bold),
            Row(
              spacing: 15.w,
              children: [
                Expanded(
                  child: CustomButton(
                    onPressed: () {},
                    text: '',
                    child: Row(
                      spacing: 5.w,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.thumb_up, color: AppColors.kWhite),
                        CustomText(
                          text: 'Yes',
                          color: AppColors.kWhite,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                ),

                Expanded(
                  child: CustomButton(
                    onPressed: () {},
                    text: '',
                    bgColor: AppColors.kAccentPink.withValues(alpha: .07),
                    child: Row(
                      spacing: 5.w,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.thumb_down, color: AppColors.kAccentPink),
                        CustomText(
                          text: 'No',
                          color: AppColors.kAccentPink,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Gap(20.h),
            Center(
              child: CustomText(
                text: 'Still need help?',
                color: AppColors.kDarkerGrey,
                fontSize: 14.sp,
              ),
            ),
            Gap(10.h),
            Row(
              spacing: 5.w,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.message_rounded, color: AppColors.kAccentPink),
                CustomText(
                  text: 'Contact Support',
                  color: AppColors.kAccentPink,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
