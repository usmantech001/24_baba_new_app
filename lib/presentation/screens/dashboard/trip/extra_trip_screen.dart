import 'package:baba_24/presentation/screens/dashboard/home/widgets/section_header.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ExtraTripScreen extends StatelessWidget {
  const ExtraTripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite.withValues(alpha: .95),
      appBar: CustomAppbar(title: 'Extras'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: 'Customize Your Trip',
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
            ),
            CustomText(
              text: 'Enhance your journey with our premiun add-ons',
              color: AppColors.kDarkerGrey,
              fontSize: 12.sp,
            ),
            Gap(20.h),
            SectionHeader(
              text: 'Protection & Insurance',
              onTap: () {},
              textSize: 14.sp,
              hasMargin: false,
            ),
            Gap(10.h),
            Column(
              spacing: 10.h,
              children: [
                TripItem(
                  text: 'Full Coverage',
                  shortDesc: 'Zero excess, tires & glass included.',
                  price: '120',
                  isSelected: true,
                ),
                TripItem(
                  text: 'Roadside Plus',
                  shortDesc: '24/7 towing and key replacement.',
                  price: '8.5',
                ),
              ],
            ),

            Gap(20.h),
            SectionHeader(
              text: 'Equipment',
              onTap: () {},
              textSize: 14.sp,
              hasMargin: false,
            ),
            Gap(10.h),
            Column(
              spacing: 10.h,
              children: [
                TripItem(
                  text: 'Child Safety Seat',
                  shortDesc: 'Suitable for 1-4 years.',
                  price: '12',
                ),
                TripItem(
                  text: 'GPS Navigation',
                  shortDesc: 'Updated maps and traffic.',
                  price: '8.5',
                ),
              ],
            ),

            Gap(20.h),
            SectionHeader(
              text: 'Services',
              onTap: () {},
              textSize: 14.sp,
              hasMargin: false,
            ),
            Gap(10.h),
            Column(
              spacing: 10.h,
              children: [
                TripItem(
                  text: 'Additional Driver',
                  shortDesc: 'Share the driver.',
                  price: '15',
                ),
                TripItem(
                  text: 'Pre-paid Fuel',
                  shortDesc: 'Return empty, no hassle.',
                  price: '8.5',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TripItem extends StatelessWidget {
  const TripItem({
    super.key,
    required this.text,
    required this.shortDesc,
    required this.price,
    this.suffix,
    this.isSelected = false,
  });

  final String text;
  final String shortDesc;
  final String price;
  final Widget? suffix;
  final bool isSelected;
  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.kAccentPink.withValues(alpha: .06)
            : AppColors.kWhite,
        borderRadius: BorderRadius.circular(15.sp),
        border: Border.all(
          color: isSelected ? AppColors.kAccentPink : Colors.transparent,
        ),
      ),
      child: Row(
        spacing: 10.w,
        children: [
          Container(
            padding: EdgeInsets.all(10.sp),
            decoration: BoxDecoration(
              color: AppColors.kAccentPink.withValues(alpha: .1),
              borderRadius: BorderRadius.circular(10.sp),
            ),
            child: Icon(
              Icons.roundabout_left,
              size: 15,
              color: AppColors.kAccentPink,
            ),
          ),
          Flexible(
            child: Column(
              spacing: 5.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: text,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                ),
                CustomText(
                  text: shortDesc,
                  fontSize: 12.sp,
                  color: AppColors.kDarkerGrey,
                ),
                RichText(
                  text: TextSpan(
                    text: '\$$price',
                    style: customTextStyle(
                      color: AppColors.kAccentPink,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: ' / day',
                        style: customTextStyle(
                          fontSize: 12.sp,
                          color: AppColors.kDarkerGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Transform.scale(
            alignment: Alignment.centerRight,
            scale: 0.7,
            child: Switch(
              value: isSelected,
              activeColor: AppColors.kWhite,
              activeTrackColor: AppColors.kLightPink,
              inactiveTrackColor: AppColors.kGrey.withValues(alpha: .3),
              inactiveThumbColor: AppColors.kWhite,
              
              onChanged: (value) {
                //showSnackBar(context, 'Light mode is coming soon');
                return;
              },
            ),
          ),
        ],
      ),
    );
  }
}
