import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
import 'package:baba_24/presentation/widgets/custom_button.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class RoadAssistanceScreen extends StatelessWidget {
  const RoadAssistanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite.withValues(alpha: .95),
      appBar: CustomAppbar(title: 'Emergency Support'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(10.sp),
              decoration: BoxDecoration(
                color: AppColors.kBlack,
                borderRadius: BorderRadius.circular(10.sp),
              ),
              child: Row(
                spacing: 10.w,
                children: [
                  Container(
                    padding: EdgeInsets.all(10.sp),
                    decoration: BoxDecoration(
                      color: AppColors.kAccentPink,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Icon(Icons.car_rental, color: AppColors.kWhite),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'CURRENT RENTAL',
                        color: AppColors.kGrey,
                        fontSize: 12.sp,
                      ),
                      CustomText(
                        text: 'Tesla Model 3',
                        color: AppColors.kWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.w,
                      vertical: 3.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.kAccentPink.withValues(alpha: .3),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: CustomText(
                      text: 'INSURED',
                      color: AppColors.kAccentPink,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ),
            Gap(30.h),
            CircleAvatar(
              radius: 45.sp,
              backgroundColor: AppColors.kAccentPink.withValues(alpha: .1),
              child: CircleAvatar(
                backgroundColor: AppColors.kWhite,
                radius: 35.r,
                child: CircleAvatar(
                  backgroundColor: AppColors.kAccentPink,
                  radius: 32.r,
                  child: Icon(Icons.help, color: AppColors.kWhite),
                ),
              ),
            ),
            Gap(10.h),
            CustomText(
              text: 'Need Imediate Help?',
              fontWeight: FontWeight.w600,
            ),
            Gap(5.h),
            CustomText(
              text: 'Dispatch is availabe 24/7 for accidents and breakdowns',
              fontSize: 12.sp,
              textAlign: TextAlign.center,
              color: AppColors.kAccentPink.withValues(alpha: .5),
            ),
            CustomButton(
              onPressed: () {},
              text: '',
              radius: 10.sp,
              child: Row(
                spacing: 10.w,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.phone, color: AppColors.kWhite),
                  CustomText(
                    text: 'CALL ROADSIDE ASSISTANCE',
                    color: AppColors.kWhite,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(vertical: 20.h),
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.kWhite,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Row(
                    spacing: 10.w,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10.sp),
                        decoration: BoxDecoration(
                          color: AppColors.kAccentPink.withValues(alpha: .1),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Icon(
                          Icons.key,
                          color: AppColors.kAccentPink,
                          size: 20,
                        ),
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: 'Towing Service',
                            fontWeight: FontWeight.w500,
                            fontSize: 13.sp,
                          ),
                          CustomText(
                            text: 'Mobile tire replacement',
                            fontSize: 12.sp,
                            color: AppColors.kAccentPink.withValues(alpha: .6),
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 2.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.kAccentPink.withValues(alpha: .1),
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: CustomText(
                          text: 'CALL',
                          fontSize: 11.sp,
                          color: AppColors.kAccentPink,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => Gap(10),
              itemCount: 10,
            ),
          ],
        ),
      ),
    );
  }
}
