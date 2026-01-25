import 'package:baba_24/presentation/screens/onboard/widgets/custom_icon.dart';
import 'package:baba_24/presentation/widgets/custom_button.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:baba_24/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class SocialConfirmationScreen extends StatelessWidget {
  const SocialConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: deviceHeight(context),
        width: deviceWidth(context),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/ferarri.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Stack(
             // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomIcon(
                        iconData: Icons.close,
                        bgColor: AppColors.kWhite,
                        iconColor: AppColors.kAccentPink,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.kWhite,
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                        child: CustomText(
                          text: 'CONFIRMATION',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(width: 40.w),
                    ],
                  ),
                ),
                // Spacer(),
                Center(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 20.h,
                    ),
                    decoration: BoxDecoration(color: AppColors.kWhite, borderRadius: BorderRadius.circular(20.sp)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 30.r,
                          backgroundColor: AppColors.kAccentPink.withValues(
                            alpha: .09,
                          ),
                          child: Icon(
                            Icons.favorite,
                            color: AppColors.kAccentPink,
                          ),
                        ),
                        Gap(15.h),
                        CustomText(
                          text: 'Thank You!',
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        Gap(10.h),
                        CustomText(
                          text: 'Your journey with us as been a pleasure',
                          color: AppColors.kBlack.withValues(alpha: .6),
                          fontSize: 14.sp,
                        ),
                        Gap(50.h),

                        CustomText(
                          text: 'SHARE YOUR JOURNEY',
                          color: AppColors.kAccentPink.withValues(alpha: .7),
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 50.w,
                            vertical: 20.h,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SocialBtn(icon: Icons.share),
                              SocialBtn(icon: Icons.share),
                              SocialBtn(icon: Icons.share),
                            ],
                          ),
                        ),
                        CustomButton(onPressed: (){}, text: 'Back Home')
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SocialBtn extends StatelessWidget {
  const SocialBtn({super.key, required this.icon});
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 40.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.kAccentPink.withValues(alpha: .2)),
      ),
      child: Icon(icon, color: AppColors.kAccentPink),
    );
  }
}
