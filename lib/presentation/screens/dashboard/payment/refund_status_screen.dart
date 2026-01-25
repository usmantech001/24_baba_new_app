import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/custom_icon.dart';
import 'package:baba_24/presentation/widgets/custom_button.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class RefundStatusScreen extends StatelessWidget {
  const RefundStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite.withValues(alpha: .95),
      appBar: CustomAppbar(title: 'Refund Status'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(15.r),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.kWhite,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                spacing: 5.h,
                children: [
                  CustomIcon(
                    iconData: Icons.wallet,
                    bgColor: AppColors.kAccentPink.withValues(alpha: .05),
                    iconColor: AppColors.kAccentPink,
                    radius: 25.r,
                  ),
                  Gap(10.h),
                  CustomText(
                    text: 'TOTAL REFUND AMOUNT',
                    fontSize: 12.sp,
                    color: AppColors.kAccentPink.withValues(alpha: .6),
                  ),
                  CustomText(
                    text: '\$140.00',
                    fontWeight: FontWeight.bold,
                    fontSize: 25.sp,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 6.w,
                      vertical: 2.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.kGrey.withValues(alpha: .3),
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: CustomText(
                      text: 'Booking ID: #444-YYDW',
                      fontSize: 10.sp,
                    ),
                  ),
                ],
              ),
            ),
            Gap(30.h),
            CustomText(
              text: 'Tracking Progress',
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
            Gap(10.h),
            Container(
              padding: EdgeInsets.all(15.r),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.kWhite,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                children: [
                  RefundStepItem(
                    icon: Icons.check,
                    title: 'Refund Requested',
                    subtitle: 'initiated by user via app',
                    color: AppColors.kAccentPink,
                    dateTime: 'OCT 20, 10:20 AM',
                  ),
                  RefundStepItem(
                    icon: Icons.check,
                    title: 'Car Inspection Completed',
                    subtitle: 'Vehicle verified at Downtown hub',
                    color: AppColors.kAccentPink,
                    dateTime: 'OCT 20, 10:20 AM',
                  ),
                  RefundStepItem(
                    icon: Icons.reviews,
                    title: 'Processing by 24baba',
                    subtitle: 'In Progress Sent to Bank',
                    color: AppColors.kAccentPink.withValues(alpha: .1),
                    subTitleColor: AppColors.kAccentPink.withValues(alpha: .5),
                  ),
                  RefundStepItem(
                    icon: Icons.time_to_leave,
                    title: 'Refund Completed',
                    subtitle: 'Expected by Oct 24',
                    color: Colors.transparent,
                    subTitleColor: AppColors.kDarkerGrey.withValues(alpha: .5),
                    isLast: true,
                  ),
                ],
              ),
            ),
            Gap(20.h),
            Container(
              padding: EdgeInsets.all(15.r),
              decoration: BoxDecoration(
                color: AppColors.kAccentPink.withValues(alpha: .1),
                borderRadius: BorderRadius.circular(15.sp),
                border: Border.all(
                  color: AppColors.kAccentPink.withValues(alpha: .4),
                ),
              ),
              child: Column(
                spacing: 10.h,
                children: [
                  Row(
                    spacing: 5.w,
                    children: [
                      Icon(Icons.headphones, color: AppColors.kAccentPink),
                      CustomText(
                        text: 'Need a help?',
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      
                    ],
                  ),
                  CustomText(text: 'Our support team is 24/7 for refund inquiries regarding your booking', fontSize: 12.sp, color: AppColors.kAccentPink.withValues(alpha: .3),),
                  CustomButton(onPressed: (){}, text: 'Contact Support', topPadding: 10,)
                
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RefundStepItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String? dateTime;
  final bool isActive;
  final bool isLast;
  final Color color;
  final Color? subTitleColor;

  const RefundStepItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.isActive = false,
    this.isLast = false,
    required this.color,
    this.dateTime,
    this.subTitleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            CircleAvatar(
              radius: 14,
              backgroundColor: color,
              child: Icon(icon, size: 14, color: Colors.white),
            ),
            if (!isLast)
              Container(width: 2, height: 40, color: Colors.grey.shade300),
          ],
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            spacing: 4.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: title,
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
              ),

              if (dateTime != null)
                CustomText(
                  text: dateTime!,
                  fontSize: 12.sp,
                  color: AppColors.kAccentPink.withValues(alpha: .3),
                ),

              CustomText(
                text: subtitle,
                fontSize: 12.spMin,
                color: subTitleColor ?? AppColors.kDarkerGrey,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }
}
