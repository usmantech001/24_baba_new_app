import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
import 'package:baba_24/presentation/widgets/custom_button.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:baba_24/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class PriceDetailsScreen extends StatelessWidget {
  const PriceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String imageUrl =
        "https://oui4bvk5eo1qol4e.public.blob.vercel-storage.com/cars/draft-1763901772909-935-cqjm7e04n/1764062571004-01-image.webp.jpg";
    return Scaffold(
      appBar: CustomAppbar(title: 'Price Details'),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 40.h),
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.w, ),
        decoration: BoxDecoration(
          color: AppColors.kAccentPink.withValues(alpha: .035),
          border: Border.all(
            color: AppColors.kAccentPink.withValues(alpha: .3),
            
          ),
          borderRadius: BorderRadius.circular(10.sp)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText(text: 'TOTAL AMOUNT', fontSize: 12.sp,fontWeight: FontWeight.w500,),
               CustomText(text: '\$450.00', color: AppColors.kAccentPink, fontWeight: FontWeight.bold,)
              ],
            ),
            CustomButton(
              topPadding: 0,
              radius: 10,
              onPressed: (){}, text: 'Pay Now', width: deviceWidth(context)* .4,)
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 10.w,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    imageUrl,
                    height: 80.h,
                    width: 100.w,
                    fit: BoxFit.cover,
                  ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'Tesla Model 3',
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                      ),
                      CustomText(
                        text: '4 Days rental Los Angeles International Airport',
                        fontSize: 12.sp,
                        color: AppColors.kAccentPink.withValues(alpha: .4),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h),
              child: Divider(
                color: AppColors.kAccentPink.withValues(alpha: .08),
              ),
            ),
            CustomText(
              text: 'PRICE BREAKDOWN',
              fontSize: 13.sp,
              color: AppColors.kDarkerGrey,
            ),

            PriceBreakdownItem(
              text: 'Base Rental Fee',
              price: '320.00',
              secText: '\$80.00 x 4 days',
            ),
            PriceBreakdownItem(text: 'Premium Insurance', price: '20.00'),
            PriceBreakdownItem(text: 'Service & Platform', price: '10.00'),
            Gap(20.h),
            CustomText(
              text: 'ADD-ONS',
              fontSize: 13.sp,
              color: AppColors.kDarkerGrey,
            ),
            PriceBreakdownItem(text: 'GPS navigation', price: '20.00'),
            PriceBreakdownItem(text: 'Child Safety Seat', price: '10.00'),
            Gap(20.h),
            CustomText(
              text: 'Applicable Taxes (12%) included in total',
              color: AppColors.kAccentPink.withValues(alpha: .7),
              fontSize: 12.sp,
              fontStyle: FontStyle.italic,
            ),
          ],
        ),
      ),
    );
  }
}

class PriceBreakdownItem extends StatelessWidget {
  const PriceBreakdownItem({
    super.key,
    required this.text,
    required this.price,
    this.secText,
    this.textColor,
    this.hasDivider = true,
    this.secTextColor,
    this.textFontWeight,
    this.hasMargin = true
  });
  final String text;
  final String price;
  final String? secText;
  final Color? textColor;
  final bool hasDivider;
  final bool hasMargin;
  final Color? secTextColor;
  final FontWeight? textFontWeight;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: hasMargin? EdgeInsets.symmetric(vertical: 15.h): EdgeInsets.zero,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: hasDivider? AppColors.kAccentPink.withValues(alpha: .08): Colors.transparent,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: text,
                fontSize: 13.sp,
                fontWeight: textFontWeight?? FontWeight.w500,
                color: textColor??AppColors.kBlack,
              ),
              if (secText != null)
                CustomText(
                  text: secText!,
                  fontSize: 12.sp,
                  color: secTextColor?? AppColors.kAccentPink.withValues(alpha: .6),
                ),
            ],
          ),
          CustomText(
            text: '\$$price',
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
