import 'package:baba_24/presentation/screens/dashboard/booking/booking_info_screen.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
import 'package:baba_24/presentation/widgets/custom_button.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class IdentityVerificationScreen extends StatelessWidget {
  const IdentityVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Identity'),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 50.h),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15.w, horizontal: 10.w),
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(blurRadius: 10, color: Colors.white)],
            borderRadius: BorderRadius.circular(20.r),
            color: AppColors.kWhite,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: 10.w,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.info_outline,
                    color: AppColors.kBlack.withValues(alpha: .6),
                  ),
                  Flexible(
                    child: CustomText(
                      text:
                          'Ensure documents are clear and valid. Passport required for international bookings. Emirates ID optional.',
                      fontSize: 12.sp,
                      color: AppColors.kDarkerGrey,
                    ),
                  ),
                ],
              ),
              Gap(20.h),
              CustomText(text: 'Driver\'s License', fontSize: 14.sp),
              Gap(10.h),
              Column(
                spacing: 15.h,
                children: [
                  CustomDottedContainer(text: 'Front Side', onTap: () {}),
                  CustomDottedContainer(text: 'Back Side', onTap: () {}),
                ],
              ),
              Gap(20.h),
              CustomText(text: 'Passport', fontSize: 14.sp),
              Gap(10.h),
              CustomDottedContainer(text: 'Photo Page', onTap: () {}),
              Gap(20.h),
              CustomText(
                text: 'Emirates ID (Optional)',
                fontSize: 14.sp,
                color: AppColors.kDarkerGrey,
              ),
              Gap(10.h),
              Column(
                spacing: 15.h,
                children: [
                  CustomDottedContainer(
                    text: 'Front Side',
                    onTap: () {},
                    isRequired: false,
                  ),
                  CustomDottedContainer(
                    text: 'Back Side',
                    onTap: () {},
                    isRequired: false,
                  ),
                ],
              ),
              CustomButton(onPressed: (){}, text: 'Submit for Verification')
            ],
          ),
        ),
      ),
    );
  }
}
