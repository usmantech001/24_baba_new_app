import 'package:baba_24/core/app_route.dart';
import 'package:baba_24/presentation/screens/dashboard/home/widgets/section_header.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
import 'package:baba_24/presentation/widgets/custom_button.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:baba_24/utils/nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class LoyaltyRewardsScreen extends StatelessWidget {
  const LoyaltyRewardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Loyalty & Rewards', ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 20.h,
                  ),
                  // height: 200.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.kAccentPink,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: 'Total Balance',
                        color: AppColors.kWhite,
                        fontSize: 14.sp,
                      ),
                      CustomText(
                        text: '2,245',
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.kWhite,
                      ),
                      Gap(10.h),
                      CustomText(
                        text: 'Points',
                        color: AppColors.kWhite,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      CustomButton(
                        topPadding: 20,
                        radius: 20.r,
                        onPressed: () {},
                        text: 'Redeem Now',
                        bgColor: AppColors.kWhite,
                        textColor: AppColors.kAccentPink,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: -20,
                  top: -10,
                  child: CircleAvatar(
                    radius: 45.r,
                    backgroundColor: AppColors.kGrey.withValues(alpha: .25),
                  ),
                ),
                Positioned(
                  left: -20,
                  bottom: -10,
                  child: CircleAvatar(
                    radius: 50.r,
                    backgroundColor: AppColors.kGrey.withValues(alpha: .15),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 30.h),
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
              decoration: BoxDecoration(
                color: AppColors.kGrey.withValues(alpha: .08),
                borderRadius: BorderRadius.circular(10.r)
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        spacing: 5.w,
                        children: [
                          CircleAvatar(
                            radius: 10.r,
                            backgroundColor: Colors.orange,
                            child: Icon(
                              Icons.star,
                              size: 15,
                              color: AppColors.kWhite,
                            ),
                          ),
                          CustomText(
                            text: 'Sliver Tier',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                      CustomText(
                        text: 'Gold is Next',
                        fontSize: 12.sp,
                        color: AppColors.kAccentPink,
                      ),
                    ],
                  ),
                  Gap(10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: 'Gold Tier Progress',
                        fontSize: 14.sp,
                        color: AppColors.kBlack.withValues(alpha: .5),
                      ),
                      CustomText(
                        text: '550 pts left',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.kAccentPink,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: SizedBox(
                      height: 10,
                      child: LinearProgressIndicator(
                        backgroundColor: AppColors.kGrey.withValues(alpha: .3),
                        value: .8,
                        color: AppColors.kAccentPink,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  CustomText(text: 'You are in the top 15 of 24 baba drivers this month', fontSize: 12.sp, color: AppColors.kBlack.withValues(alpha: .5),)
                ],
              ),
            ),
            Gap(30.h),
            SectionHeader(
              text: 'Current Rewards',
              onTap: () {
                pushNamed(AppRoutes.allRewards);
              },
              suffixText: 'View All',
              textSize: 14.sp,
              suffixTextSize: 12.sp,
            ),
            ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 15.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.kGrey.withValues(alpha: .12),
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(13.sp),
                        decoration: BoxDecoration(
                          color: AppColors.kAccentPink.withValues(alpha: .08),
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                        child: Icon(
                          FontAwesomeIcons.car,
                          color: AppColors.kLightPink,
                        ),
                      ),
                      Gap(10.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: 'Free Vehicle Upgrade',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          CustomText(
                            text: 'Valid until Dec 31, 2027',
                            fontSize: 12.sp,
                            color: AppColors.kGrey,
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 3.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.kGrey.withValues(alpha: .4),
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                        child: CustomText(text: 'Claim', fontSize: 10.sp),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => Gap(10.h),
              itemCount: 10,
            ),
          ],
        ),
      ),
    );
  }
}
