import 'package:baba_24/core/app_route.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/custom_icon.dart';
import 'package:baba_24/presentation/widgets/custom_button.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:baba_24/utils/nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class BookingAppreciationScreen extends StatelessWidget {
  const BookingAppreciationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite.withValues(alpha: .95),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              left: 15.w,
              child: CustomIcon(iconData: Icons.close)),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 15.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30.r,
                    backgroundColor: AppColors.kAccentPink.withValues(alpha: .7),
                    child: Icon(Icons.done, color: AppColors.kWhite, size: 30,),
                  ),
                  Gap(20.h),
                  CustomText(text: 'Thank You for \nChoosing 24baba!', fontSize: 25.sp, fontWeight: FontWeight.bold, textAlign: TextAlign.center,),
                  Gap(10.h),
                  CustomText(text: 'Your ride is ready and waiting. We\'ve sent the confirmation details to your email.', fontSize: 12.sp, textAlign: TextAlign.center, color: AppColors.kBlack.withValues(alpha: .6),),
                   Gap(20.h),
                  Container(
                    padding: EdgeInsets.all(15.sp),
                    decoration: BoxDecoration(
                      color: AppColors.kWhite.withValues(alpha: .9),
                      border: Border.all(color: AppColors.kGrey.withValues(alpha: .5)),
                      borderRadius: BorderRadius.circular(20.sp)
                    ),
                    child: Row(
                      spacing: 10.w,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(20.r),
                          child: Image.asset('assets/images/ferarri.png', height: 80.h, width: 80.w, fit: BoxFit.cover,)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 3.h,
                            children: [
                              CustomText(text: 'VEHICLE AND SCHEDULE', color: AppColors.kAccentPink.withValues(alpha: .7), fontSize: 12.sp,),
                              CustomText(text: 'Tesla Model 3', fontWeight: FontWeight.w700,),
                              CustomText(text: 'Oct 12 - Oct 15, 2026', fontSize: 12.sp, color: AppColors.kBlack.withValues(alpha: .6),)
                            ],
                          )
                      ],
                    ),
                  ),
            
                  CustomButton(onPressed: (){}, text: 'View My Booking', radius: 20.r,),
                  Gap(20.h),
                  InkWell(
                    onTap: () => removeAllAndPushScreen(AppRoutes.bottomNav),
                    child: CustomText(text: 'Back to Home'))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}