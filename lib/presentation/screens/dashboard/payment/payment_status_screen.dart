import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/custom_icon.dart';
import 'package:baba_24/presentation/widgets/custom_button.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class PaymentStatusScreen extends StatelessWidget {
  const PaymentStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Payment Status'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                radius: 50.r,
                backgroundColor: AppColors.kAccentPink.withValues(alpha: .1),
                child: CircleAvatar(
                  radius: 30.r,
                  backgroundColor: AppColors.kAccentPink.withValues(alpha: .5),
                  child: Icon(Icons.card_giftcard, color: AppColors.kWhite),
                ),
              ),
            ),
            Gap(20.h),
            CustomText(
              text: 'Payment Failed',
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'We couldn\'t process your payment for the ',
                  style: customTextStyle(
                    fontSize: 13.sp,
                    color: AppColors.kDarkerGrey,
                  ),
                  children: [
                    TextSpan(
                      text: 'Toyota Camry ',
                      style: customTextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text:
                          'rental. Don\'t worry, your reservation is still held for the next 15 minutes.',
                    ),
                  ],
                ),
              ),
            ),
            Gap(20.h),
            Container(
              padding: EdgeInsets.all(15.r),
              decoration: BoxDecoration(
                color: AppColors.kAccentPink.withValues(alpha: .08),
                borderRadius: BorderRadius.circular(15.sp),
                border: Border.all(
                  color: AppColors.kAccentPink.withValues(alpha: .4),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    spacing: 10.w,
                    children: [
                      CustomIcon(
                        iconData: Icons.warning_sharp,
                        bgColor: AppColors.kAccentPink.withValues(alpha: .1),
                        iconColor: AppColors.kAccentPink,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: 'REASON',
                            color: AppColors.kAccentPink.withValues(alpha: .7),
                            fontSize: 13.sp,
                          ),
                          CustomText(text: 'Insufficient funds', fontSize: 12.sp, fontWeight: FontWeight.bold,)
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: Divider(color: AppColors.kAccentPink.withValues(alpha: .1),),
                  ),
                  Row(
                    children: [
                      CustomText(text: 'View Error Details', fontSize: 12.sp, color: AppColors.kLightPink,),
                      Icon(Icons.arrow_forward, size: 15, color: AppColors.kLightPink,)
                    ],
                  )
                ],
              ),
            ),

            CustomButton(onPressed: (){}, text: 'Try Again'),
            CustomButton(
              topPadding: 15.h,
              onPressed: (){}, text: 'Try Differnt Card', bgColor: AppColors.kWhite, textColor: AppColors.kAccentPink,),
          ],
        ),
      ),
    );
  }
}
