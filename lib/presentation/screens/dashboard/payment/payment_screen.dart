import 'package:baba_24/presentation/screens/dashboard/cars/price_details_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/home/widgets/section_header.dart';
import 'package:baba_24/presentation/screens/dashboard/payment/payment_methods_screen.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite.withValues(alpha: .95),
      appBar: CustomAppbar(title: 'Payment'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: CustomText(
                text: '\$450.00',

                fontWeight: FontWeight.bold,
                fontSize: 25.sp,
              ),
            ),

            CustomText(
              text: 'Total for 3 rental days • Porsche',
              color: AppColors.kAccentPink.withValues(alpha: .4),
              fontSize: 12.sp,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30.h),
              padding: EdgeInsets.all(15.sp),
              decoration: BoxDecoration(
                color: AppColors.kWhite,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
                children: [
                  PriceBreakdownItem(
                    text: 'Daily Rate (\$120 x 3)',
                    price: '360.00',
                    textColor: AppColors.kDarkerGrey,
                  ),
                  PriceBreakdownItem(
                    text: 'Insurance & Protection',
                    price: '50.00',
                    textColor: AppColors.kDarkerGrey,
                  ),
                  PriceBreakdownItem(
                    text: 'Taxes & Fees',
                    price: '25.00',
                    textColor: AppColors.kDarkerGrey,
                    hasDivider: false,
                  ),
                  
                ],
              ),
            ),

            SectionHeader(text: 'Payment Method',hasMargin: false, textSize: 14.sp, suffixText: 'Add New',suffixTextSize: 14.sp, onTap: (){}),
            Column(
              spacing: 10.h,
              children: List.generate(3, (index){
                return PaymentCard(icon: index==0? Icons.check_circle : Icons.circle, iconColor: index == 0? AppColors.kAccentPink : AppColors.kGrey, isSelected: index == 0,);
              }),
            )
          ],
        ),
      ),
    );
  }
}
