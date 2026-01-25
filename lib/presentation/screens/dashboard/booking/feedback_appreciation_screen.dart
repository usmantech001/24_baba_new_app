import 'package:baba_24/presentation/screens/onboard/widgets/custom_icon.dart';
import 'package:baba_24/presentation/widgets/custom_button.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class FeedbackAppreciationScreen extends StatelessWidget {
  const FeedbackAppreciationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite.withValues(alpha: .95),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              left: 15.w,
              child: CustomIcon(iconData: Icons.close),
            ),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 15.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30.r,
                    backgroundColor: AppColors.kAccentPink.withValues(
                      alpha: .7,
                    ),
                    child: Icon(Icons.done, color: AppColors.kWhite, size: 30),
                  ),
                  Gap(20.h),
                  CustomText(
                    text: 'Thank You for \nChoosing 24baba!',
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  ),
                  Gap(10.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: RichText(
                      text: TextSpan(
                        text: 'We appreciate you helping us improve ',
                    
                        style: customTextStyle(
                          fontSize: 13.sp,
                          color: AppColors.kBlack.withValues(alpha: .6),
                        ),
                        children: [
                         TextSpan(text: '24baba. ', style: customTextStyle(color: AppColors.kAccentPink, fontSize: 13.sp)) ,
                         TextSpan(text: 'Here is a little something for your next trip.')
                        ]
                      ),
                      
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Gap(20.h),
                  Container(
                    //padding: EdgeInsets.all(15.sp),
                    decoration: BoxDecoration(
                      color: AppColors.kWhite.withValues(alpha: .9),
                      border: Border.all(
                        color: AppColors.kGrey.withValues(alpha: .5),
                      ),
                      borderRadius: BorderRadius.circular(20.sp),
                    ),
                    child: Column(
                      //spacing: 10.w,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadiusGeometry.only(topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
                          child: Image.asset(
                            'assets/images/ferarri.png',
                            height: 180.h,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 3.h,
                            children: [
                              CustomText(
                                text: 'EXCLUSIVE REWARD',
                                color: AppColors.kAccentPink.withValues(
                                  alpha: .7,
                                ),
                                fontSize: 12.sp,
                              ),
                              CustomText(
                                text: '5% OFF your next rental',
                                fontWeight: FontWeight.w700,
                                fontSize: 24.sp,
                              ),
                              CustomText(
                                text: 'Valid for all premiums and luxury vehicles. Use the code at checkout to claim your reward.',
                                fontSize: 12.sp,
                                color: AppColors.kBlack.withValues(alpha: .6),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  CustomButton(
                    onPressed: () {},
                    text: '#933-prh888',
                    radius: 20.r,
                    bgColor: AppColors.kAccentPink.withValues(alpha: .7),
                  ),
                  // Gap(20.h),
                  // CustomText(text: 'Back to Home'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
