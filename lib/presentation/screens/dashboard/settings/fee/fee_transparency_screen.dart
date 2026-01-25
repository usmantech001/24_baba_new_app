import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
import 'package:baba_24/presentation/widgets/custom_button.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class FeeTransparencyScreen extends StatelessWidget {
  const FeeTransparencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite.withValues(alpha: .99),
      appBar: CustomAppbar(title: 'Fee Transparency'),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 50.h),
        child: Column(
          children: [
            Center(
              child: CustomText(
                text: 'No Suprises',
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Gap(10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: RichText(
                text: TextSpan(
                  text: 'At ',

                  style: customTextStyle(
                    fontSize: 13.sp,
                    color: AppColors.kBlack.withValues(alpha: .6),
                  ),
                  children: [
                    TextSpan(
                      text: '24baba, ',
                      style: customTextStyle(
                        color: AppColors.kAccentPink,
                        fontSize: 13.sp,
                      ),
                    ),
                    TextSpan(
                      text:
                          'we believe honesty is the best policy. Here\'s everything you need to know about extra costs.',
                    ),
                  ],
                ),

                textAlign: TextAlign.center,
              ),
            ),
            Gap(30.h),
            Column(
              spacing: 20.h,
              children: [
                FeeTransparencyContainer(
                  text: 'Late Return Fee',
                  desc:
                      'Charged if the vehicle is returned 1 hour past your scheduled drop-off time',
                  suffixText: '\$12/hr',
                  icon: Icons.cleaning_services,
                ),
                FeeTransparencyContainer(
                  text: 'Cleaning Fee',
                  desc:
                      'Applies only if the vehicle requires professional deep cleaning beyond normal use.',
                  suffixText: 'Up to \$150',
                  icon: Icons.cleaning_services,
                ),
                FeeTransparencyContainer(
                  text: 'Airport Surcharge',
                  desc:
                      'Local airport authority fee for pickups at airport terminals.',
                  suffixText: '12%',
                  icon: Icons.airplane_ticket_outlined,
                ),
                FeeTransparencyContainer(
                  text: 'Refueling Service',
                  desc:
                      'Charged if the vehicle is returned with less fuel than at the start of the rental.',
                  suffixText: '\$15 + fuel',
                  icon: Icons.cleaning_services,
                ),
              ],
            ),
            CustomButton(onPressed: (){}, text: 'Got it, thanks!', radius: 20.sp,)
          ],
        ),
      ),
    );
  }
}

class FeeTransparencyContainer extends StatelessWidget {
  const FeeTransparencyContainer({
    super.key,
    required this.text,
    required this.desc,
    required this.suffixText,
    required this.icon,
  });
  final String text;
  final String desc;
  final String suffixText;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.sp),
      decoration: BoxDecoration(
        color: AppColors.kWhite,
        borderRadius: BorderRadius.circular(20.sp),
        border: Border.all(color: AppColors.kGrey.withValues(alpha: .2)),
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10.w,
        children: [
          Container(
            padding: EdgeInsets.all(10.sp),
            decoration: BoxDecoration(
              color: AppColors.kAccentPink.withValues(alpha: .05),
              borderRadius: BorderRadius.circular(10.sp),
            ),
            child: Icon(icon, color: AppColors.kAccentPink),
          ),
          Flexible(
            child: Column(
              spacing: 5.h,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: text,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomText(
                      text: suffixText,
                      color: AppColors.kAccentPink,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                CustomText(
                  text: desc,
                  fontSize: 13.sp,
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
