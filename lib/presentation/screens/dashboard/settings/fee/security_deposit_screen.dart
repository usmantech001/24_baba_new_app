import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/custom_icon.dart';
import 'package:baba_24/presentation/widgets/custom_button.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SecurityDepositScreen extends StatelessWidget {
  const SecurityDepositScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: AppColors.kWhite.withValues(alpha: .95),
      appBar: CustomAppbar(title: 'Security Deposit'),
      body: SingleChildScrollView(
         padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 50.h),
        child: Column(
          children: [
            Center(
              child: CustomText(
                text: 'Transparency First.',
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Gap(10.h),
            CustomText(
              text:
                  'Here is everything you need to know about your rental security hold',
              color: AppColors.kBlack.withValues(alpha: .6),
              fontSize: 13.sp,
              textAlign: TextAlign.center,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30.h),
              padding: EdgeInsets.only(left:  15.w, right: 15.w, top: 15.h, bottom: 25.h),
              decoration: BoxDecoration(
                color: AppColors.kWhite,
                borderRadius: BorderRadius.circular(20.sp),
                border: Border.all(color: AppColors.kGrey.withValues(alpha: .4))
              ),
              child: Column(
                spacing: 10.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    spacing: 10.w,
                    children: [
                      CustomIcon(iconData: Icons.wallet, bgColor: AppColors.kAccentPink.withValues(alpha: .1), iconColor: AppColors.kAccentPink,),
                      CustomText(text: 'DEPOSIT AMOUNT', fontSize: 12.sp, color: AppColors.kAccentPink,)
                    ],
                  ),

                  CustomText(text: '\$50,000', fontSize: 20.sp, fontWeight: FontWeight.bold,),
                    CustomText(
                  text: 'This amount will bbe temporary held in your account credit card. No funds will be withdrawn unless conditions are unmet',
                  fontSize: 13.sp,
                  color: AppColors.kDarkerGrey,
                ),
                Gap(10.h),
                Row(
                  spacing: 10.w,
                  children: [
                    Icon(Icons.health_and_safety, size: 20.sp, color: AppColors.kDarkerGrey,),
                    Flexible(child: CustomText(text: 'Securely processed vis 24baba Payment', fontSize: 12.sp, color: AppColors.kDarkerGrey,))
                  ],
                )
                ],
              ),
            ),
            BookingSteps(),
            CustomButton(onPressed: (){}, text: 'I understand & Agree')
          ],
        ),
      ),
    );
  }
}


class BookingSteps extends StatelessWidget {
  const BookingSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        StepItem(
          icon: Icons.check,
          title: "Booking Hold",
          subtitle: "Hold is authorized at time of reservation to secure your vehicle.",
          
          color: AppColors.kAccentPink,
        ),
        StepItem(
          icon: Icons.directions_car,
          title: "Rental Period",
          subtitle: "The \$500.00 hold remains active on your card for the duration of your trip.",
          color: AppColors.kAccentPink.withValues(alpha: .2),
        ),
        StepItem(
          icon: Icons.sync,
          title: "Release & Refund",
          subtitle: "After inspection, the hold is released back to your card.",
          isLast: true,
          color: AppColors.kDarkerGrey.withValues(alpha: .5),
        ),

      ],
    );
  }
}

class StepItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isActive;
  final bool isLast;
  final Color color;

  const StepItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.isActive = false,
    this.isLast = false,
    required this.color
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
              Container(
                width: 2,
                height: 40,
                color: Colors.grey.shade300,
              ),
          ],
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text:  title,fontSize: 13.sp, fontWeight: FontWeight.w600,),
              const SizedBox(height: 4),
              CustomText(
               text:  subtitle,
                fontSize: 12.spMin,
                color: AppColors.kDarkerGrey,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }
}
