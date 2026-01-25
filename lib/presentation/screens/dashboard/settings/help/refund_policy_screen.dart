import 'package:baba_24/presentation/screens/dashboard/booking/booking_info_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/cars/price_details_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/settings/fee/security_deposit_screen.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
import 'package:baba_24/presentation/widgets/custom_button.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:baba_24/utils/nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class RefundPolicyScreen extends StatelessWidget {
  const RefundPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite.withValues(alpha: .98),
      appBar: CustomAppbar(title: 'Refund Policy'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: 'UnderStanding ',
                style: customTextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: 'Our Policy',
                    style: customTextStyle(
                      fontSize: 20.sp,
                      color: AppColors.kAccentPink,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Gap(10.h),
            CustomText(
              text:
                  'At 24baba, we believe in transparency. We understand plans change, so we\'ve designed our policy to be as flexible as possible while keeping our rentals affordable.',
              fontSize: 14.sp,
              color: AppColors.kDarkerGrey,
            ),
            Gap(10.h),
            Container(
              padding: EdgeInsets.all(15.r),
              decoration: BoxDecoration(
                color: AppColors.kAccentPink.withValues(alpha: .06),
                border: Border.all(
                  color: AppColors.kAccentPink.withValues(alpha: .1),
                ),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                spacing: 5.h,
                children: [
                  Row(
                    spacing: 5.w,
                    children: [
                      Icon(Icons.verified, color: AppColors.kAccentPink),
                      CustomText(
                        text: 'The Gold Standard',
                        color: AppColors.kAccentPink,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  CustomText(
                    text:
                        'Enjoy free cancellation on most rentals up to 48 hours before your pickup time.',
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                  ),
                ],
              ),
            ),
            Gap(30.h),
            Row(
              spacing: 5.w,
              children: [
                Icon(FontAwesomeIcons.calendar),
                CustomText(
                  text: 'Cancellation Timeline',
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            Gap(25.h),
            StepItem(
              icon: Icons.check_circle,
              title: '100% Refund',
              subtitle: 'More than 48h before pickup',
              color: AppColors.kAccentPink,
            ),
            Gap(10),
            StepItem(
              icon: Icons.access_time,
              title: '50% Refund',
              subtitle: '24h to 48h before pickup',
              color: AppColors.kAccentPink.withValues(alpha: .2),
            ),

            StepItem(
              icon: Icons.access_time,
              title: 'No Refund',
              subtitle: 'Less than 48h before pickup',
              color: AppColors.kAccentPink.withValues(alpha: .2),
            ),

            Container(
              margin: EdgeInsets.symmetric(vertical: 20.h),
              padding: EdgeInsets.all(15.sp),
              decoration: BoxDecoration(
                color: AppColors.kWhite,
                borderRadius: BorderRadius.circular(15.sp),
                border: Border.all(
                  color: AppColors.kGrey.withValues(alpha: .4),
                ),
              ),
              child: Column(
                spacing: 10.h,
                children: [
                  Row(
                    spacing: 5.w,
                    children: [
                      Icon(Icons.flight, color: AppColors.kAccentPink),
                      CustomText(
                        text: 'Processing Time',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  CustomText(
                    text:
                        'Refunds are typically processed back to your original payment method within 5–10 business days, depending on your bank\'s policies.',
                    fontSize: 12.sp,
                    color: AppColors.kDarkerGrey,
                  ),
                ],
              ),
            ),
            CustomButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      insetPadding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Container(
                        width: double.infinity,
                        //padding: EdgeInsets.all(15.sp),
                        decoration: BoxDecoration(
                          color: AppColors.kWhite,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                                padding: EdgeInsets.all(15.sp),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(width: 20.w,),
                                      CustomText(
                                        text: 'Taxes & Fees',
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      GestureDetector(
                                        onTap: () => popScreen(),
                                        child: Icon(Icons.close))
                                    ],
                                  ),
                                  Gap(20.h),
                                  CustomText(
                                    text: 'BOOKING SUMMARY',
                                    fontSize: 12.sp,
                                    color: AppColors.kLightPink,
                                  ),
                                  Gap(10.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                        text: '24baba Rental',
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      CustomText(
                                        text: '#BK-2928',
                                        color: AppColors.kDarkerGrey,
                                        fontSize: 13.sp,
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 15.h),
                                    child: Divider(),
                                  ),
                                  CustomText(
                                    text: 'DETAILED BREAKDOWN',
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  PriceBreakdownItem(
                                    text: 'VAT',
                                    price: '45.00',
                                    secText: 'Standard Value Added Tax',
                                    secTextColor: AppColors.kDarkerGrey,
                                    textFontWeight: FontWeight.w400,
                                  ),
                                  PriceBreakdownItem(
                                    text: 'Local Airport Fee',
                                    price: '12.00',
                                    secText: 'Dubai intl Airport',
                                    secTextColor: AppColors.kDarkerGrey,
                                    textFontWeight: FontWeight.w400,
                                  ),
                                  PriceBreakdownItem(
                                    text: 'Service Fee',
                                    price: '8.00',
                                    secText: '24/7 Roadside Assistance & Admin',
                                    secTextColor: AppColors.kDarkerGrey,
                                    textFontWeight: FontWeight.w400,
                                  ),
                                  PriceBreakdownItem(
                                    text: 'Environmental Fee',
                                    price: '2.00',
                                    secText: 'Carbon offset contribution',
                                    secTextColor: AppColors.kDarkerGrey,
                                    textFontWeight: FontWeight.w400,
                                    hasDivider: false,
                                  ),
                              
                                 
                                ],
                              ),
                            ),
                             Container(
                              width: double.infinity,
                              color: AppColors.kAccentPink.withValues(alpha: .08),
                              padding: EdgeInsets.all(15.sp),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        width: 150.w,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            CustomText(text: 'TOTAL FEES', fontSize: 14.sp, fontWeight: FontWeight.w600,),
                                            CustomText(text: 'Prices Inclusive of all local mandates and service charges.', fontSize: 12.sp, color: AppColors.kDarkerGrey,)
                                          ],
                                        ),
                                      ),
                                      CustomText(text: '\$67.50', fontSize: 30.sp, color: AppColors.kAccentPink, fontWeight: FontWeight.bold,)
                                  
                                    ],
                                  ),
                                  CustomButton(onPressed: (){}, text: 'Confirm & Continue', topPadding: 10.h,)
                                ],
                              ),
                             )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              text: 'Contact Support',
            ),
          ],
        ),
      ),
    );
  }
}
