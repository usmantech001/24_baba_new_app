import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/custom_icon.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class DriverEligibilityScreen extends StatelessWidget {
  const DriverEligibilityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite.withValues(alpha: .98),
      appBar: CustomAppbar(title: 'Eligibility'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: 'Ready to ',
                style: customTextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: 'Drive?',
                    style: customTextStyle(
                      fontSize: 25.sp,
                      color: AppColors.kAccentPink,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Gap(5.h),
            CustomText(
              text:
                  'Please review the requiremments below to ensure you are eligible to rent a car with 24baba',
              color: AppColors.kDarkerGrey,
              fontSize: 14.sp,
            ),
            Gap(20.h),
            Column(
              spacing: 10.h,
              children: [
                EligibilityItem(
                  text: 'Minimum Age',
                  subText:
                      'You must be at least 21 years old to rent standard vehicles.For luxury or sports categories, a minimum age of 25 is required.',
                  icon: Icons.event,
                ),
                EligibilityItem(
                  text: 'Valid Driving License',
                  subText:
                      'Must hold a valid original driving license. Foreigners need a valid International Driving Permit (IDP) alongside their home license.',
                  icon: Icons.badge,
                ),
                EligibilityItem(
                  text: 'Driving Experience',
                  subText:
                      'A minimum of 1 year of driving experience is mandatory. This is calculated from the issue date of your current valid license.',
                  icon: Icons.history,
                ),
                EligibilityItem(
                  text: 'Identity Verification',
                  subText:
                      'A valid Passport or National ID and a Credit Card in the driver’s name must be presented for the security deposit upon pickup.',
                  icon: Icons.description,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class EligibilityItem extends StatelessWidget {
  const EligibilityItem({
    super.key,
    required this.text,
    required this.subText,
    required this.icon,
  });
  final String text;
  final String subText;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.sp),
      decoration: BoxDecoration(
        color: AppColors.kWhite,
        border: Border.all(color: AppColors.kGrey.withValues(alpha: .2)),
        borderRadius: BorderRadius.circular(15.sp),
      ),
      child: Row(
        spacing: 10.w,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomIcon(
            iconData: icon,
            bgColor: AppColors.kAccentPink.withValues(alpha: .08),
            iconColor: AppColors.kAccentPink,
            iconSize: 18,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: text,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
                CustomText(
                  text: subText,
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
