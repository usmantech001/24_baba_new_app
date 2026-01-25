import 'package:baba_24/presentation/screens/onboard/widgets/app_text_field.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
import 'package:baba_24/presentation/widgets/custom_button.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class RateExperienceScreen extends StatelessWidget {
  const RateExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite.withValues(alpha: .95),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: SafeArea(
          top: false,
          child: CustomButton(
            topPadding: 10.h,
            onPressed: (){}, text: 'Submit Review')),
      ),
      appBar: CustomAppbar(title: 'Rate Your Experience'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          spacing: 20.h,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: Image.asset(
                    'assets/images/ferarri.png',
                    height: 150.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 10.h,
                  left: 10.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'RECENT TRIP',
                        fontSize: 14.sp,
                        color: AppColors.kGrey,
                      ),
                      CustomText(
                        text: '24baba Car Rental',
                        fontSize: 14.sp,
                        color: AppColors.kWhite,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // How can we be better
            ReviewStarContainer(
              text: 'Vehicle Condition',
              description: 'How clean and well explained was the car?',
            ),

            ReviewStarContainer(
              text: 'Overall Experience',
              description: 'How clean and well explained was the car?',
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(15.sp),
              decoration: BoxDecoration(
                color: AppColors.kWhite,
                borderRadius: BorderRadius.circular(15.sp),
              ),
              child: Column(
                spacing: 10.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'How can we be better?',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  AppTextField(controller: TextEditingController(), minLines: 3, maxLines: 5,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewStarContainer extends StatelessWidget {
  const ReviewStarContainer({
    super.key,
    required this.text,
    required this.description,
  });
  final String text;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.sp),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.kWhite,
        borderRadius: BorderRadius.circular(15.sp),
      ),
      child: Column(
        spacing: 10.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(text: text, fontSize: 14.sp, fontWeight: FontWeight.w500),
          Row(
            children: List.generate(5, (index) {
              return Icon(
                Icons.star,
                color: index < 4
                    ? AppColors.kAccentPink.withValues(alpha: .8)
                    : AppColors.kGrey,
              );
            }),
          ),
          CustomText(
            text: description,
            fontSize: 12.sp,
            color: AppColors.kBlack.withValues(alpha: .5),
          ),
        ],
      ),
    );
  }
}
