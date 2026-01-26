import 'package:baba_24/core/app_route.dart';
import 'package:baba_24/presentation/screens/dashboard/home/widgets/section_header.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/custom_icon.dart';
import 'package:baba_24/presentation/widgets/custom_button.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:baba_24/utils/nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Wallet', ),
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
                    color: AppColors.kAccentPink.withValues(alpha: .8),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'AVAILABLE BALANCE',
                        color: AppColors.kWhite,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      CustomText(
                        text: '\$2,245',
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.kWhite,
                      ),
                      Gap(50.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(text: 'CURRENT ACCOUNT', fontSize: 12.sp, color: AppColors.kWhite,),
                              CustomText(text: '24Baba Platinum Credits', fontSize: 12.sp, color: AppColors.kWhite, fontWeight: FontWeight.w600,)
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 10.h),
                            decoration: BoxDecoration(
                              color: AppColors.kWhite,
                              borderRadius: BorderRadius.circular(50.r)
                            ),
                            child: CustomText(text: 'Add Funds', color: AppColors.kAccentPink
                            ,),
                          )
                        ],
                      )
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

            Gap(30.h),
            SectionHeader(
              text: 'Recent Activity',
              hasMargin: false,
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
                return WalletActivityTile();
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


class WalletActivityTile extends StatelessWidget {
  const WalletActivityTile({super.key});

  @override
  Widget build(BuildContext context) {
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
                      CustomIcon(iconData: FontAwesomeIcons.car, bgColor: AppColors.kAccentPink.withValues(alpha: .05), iconColor: AppColors.kAccentPink, iconSize: 15.sp,),
                      Gap(10.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: 'Monthly Top-Up',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          CustomText(
                            text: 'Oct 24 • 12:25 PM',
                            fontSize: 12.sp,
                            color: AppColors.kAccentPink.withValues(alpha: .4),
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
  }
}