import 'package:baba_24/core/app_route.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:baba_24/utils/nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class PaymentHistoryScreen extends StatelessWidget {
  const PaymentHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite.withValues(alpha: .95),
      appBar: CustomAppbar(title: 'Payment History'),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: 'Past 12 Months', fontSize: 14.sp,),
                Row(
                  children: [
                    Icon(Icons.tune, color: AppColors.kAccentPink.withValues(alpha: .5)),
                    CustomText(text: 'Filter', fontSize: 14.sp, color: AppColors.kAccentPink.withValues(alpha: .5),)
                  ],
                ),

              ],
            ),
          ),
            Gap(10.h),
          Expanded(
            
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
              itemBuilder: (context, index){
            return PaymentHistoryTile();
          }, separatorBuilder: (context, index)=> Gap(10.h), itemCount: 10))
        ],
      ),
    );
  }
}

class PaymentHistoryTile extends StatelessWidget {
  const PaymentHistoryTile({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => pushNamed(AppRoutes.invoiceDetails),
      child: Container(
                padding: EdgeInsets.all(15.sp),
                decoration: BoxDecoration(
                  color: AppColors.kWhite,
                  border: Border.all(color: AppColors.kGrey.withValues(alpha: .3)),
                  borderRadius: BorderRadius.circular(10.r)
                ),
      
                child: Column(
                  spacing: 10.h,
                  children: [
                    Row(
                      spacing: 10.w,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          spacing: 10.w,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.r),
                              child: Image.asset('assets/images/ferarri.png', height: 60.h,)),
                              SizedBox(
                                width: 120.w,
                                child: Column(
                                  spacing: 5.h,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(text: 'Toyota Land Cruiser rrrrr', fontSize: 13.sp, fontWeight: FontWeight.w700, textOverflow: TextOverflow.ellipsis, maxLines: 1,),
                                    CustomText(text: 'Oct 23, 2024', color: AppColors.kBlack.withValues(alpha: .4), fontSize: 12.sp,)
                                  ],
                                ),
                              )
                          ],
                        ),
                        CustomText(text: '\$200.00', fontSize: 12.sp, fontWeight: FontWeight.w500,)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          spacing: 6,
                          children: [
                            Icon(Icons.check_circle, color: AppColors.kAccentGreen, size: 15.sp,),
                            CustomText(text: 'Completed', fontSize: 12.sp, color: AppColors.kBlack.withValues(alpha: .4),),
                          ],
                        ),
                        CustomText(text: 'Download Invoice', textDecoration: TextDecoration.underline, fontSize: 12.sp, color: AppColors.kAccentPink,),
                      ],
                    )
                  ],
                ),
              ),
    );
  }
}