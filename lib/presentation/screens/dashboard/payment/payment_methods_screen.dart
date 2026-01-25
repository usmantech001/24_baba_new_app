import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
import 'package:baba_24/presentation/widgets/custom_button.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite.withValues(alpha: .95),
      appBar: CustomAppbar(title: 'Payment Methods'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: 'YOUR CARDS',
              color: AppColors.kDarkerGrey,
              fontSize: 14.sp,
            ),
            Gap(20.h),
            Column(
              spacing: 15.h,
              children: [
                PaymentCard(icon: Icons.edit),
                PaymentCard(icon: Icons.edit),
              ],
            ),
            Gap(30.h),
            CustomText(
              text: 'DIGITAL WALLETS',
              color: AppColors.kDarkerGrey,
              fontSize: 14.sp,
            ),
            Gap(20.h),

            Column(children: [DigitalWalletCard()]),

            CustomButton(
              onPressed: () {},
              text: '',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10.w,
                children: [
                  Icon(Icons.add_card_rounded, color: AppColors.kWhite),
                  CustomText(
                    text: 'Add New Card',
                    color: AppColors.kWhite,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
            Gap(20.h),
            Row(
              spacing: 5.w,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.lock, color: AppColors.kDarkerGrey, size: 15.sp),
                CustomText(
                  text: 'Payments are 100% secure',
                  fontSize: 12.sp,
                  color: AppColors.kDarkerGrey,
                ),
              ],
            ),
            Gap(10.h),
            CustomText(
              text: 'Your payment information is encrypted and stored securely',
              fontSize: 12.sp,
              color: AppColors.kDarkerGrey.withValues(alpha: .6),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentCard extends StatelessWidget {
  const PaymentCard({
    super.key,
    required this.icon,
    this.isDefault = false,
    this.iconColor,
    this.isSelected = false,
  });
  final IconData icon;
  final bool isDefault;
  final bool isSelected;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.kWhite,
        borderRadius: BorderRadius.circular(15.sp),
        border: Border.all(
          color: isSelected? AppColors.kAccentPink: Colors.transparent
        )
      ),
      child: Column(
        children: [
          if (isDefault)
            Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: AppColors.kAccentPink.withValues(alpha: .06),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15.r),
                  ),
                ),
                child: CustomText(
                  text: 'Default',
                  fontSize: 12.sp,
                  color: AppColors.kAccentPink,
                ),
              ),
            ),
          Padding(
            padding: EdgeInsets.only(
              left: 10.w,
              right: 10.w,
              bottom: 15.h,
              top: 10.h,
            ),
            child: Row(
              spacing: 10.w,
              children: [
                Image.asset('assets/images/visa.jpg', height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: '••••••••••4582',
                      fontWeight: FontWeight.bold,
                      fontSize: 13.sp,
                    ),
                    CustomText(
                      text: 'Expires 09/26',
                      fontSize: 12.sp,
                      color: AppColors.kDarkerGrey,
                    ),
                  ],
                ),
                Spacer(),
                Icon(icon, color: iconColor?? AppColors.kGrey),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DigitalWalletCard extends StatelessWidget {
  const DigitalWalletCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.kWhite,
        borderRadius: BorderRadius.circular(15.sp),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 10.w,
              right: 10.w,
              bottom: 25.h,
              top: 25.h,
            ),
            child: Row(
              spacing: 10.w,
              children: [
                Image.asset('assets/images/visa.jpg', height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Apple Pay',
                      fontWeight: FontWeight.bold,
                      fontSize: 13.sp,
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: AppColors.kAccentGreen.withValues(alpha: .06),
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  child: Row(
                    spacing: 5.w,
                    children: [
                      CustomText(
                        text: 'Connected',
                        fontSize: 12.sp,
                        color: Colors.green,
                      ),
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 15.sp,
                      ),
                    ],
                  ),
                ),
                //Icon(icon, color: AppColors.kGrey),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
