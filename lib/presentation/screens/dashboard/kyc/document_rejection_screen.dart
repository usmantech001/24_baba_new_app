import 'package:baba_24/core/app_route.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
import 'package:baba_24/presentation/widgets/custom_button.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:baba_24/utils/nav.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class DocumentRejectionScreen extends StatelessWidget {
  const DocumentRejectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Re-upload Documents'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(text: 'Driver\'s Liscense (Front)', fontWeight: FontWeight.w600,),
            CustomText(text: 'Verification Failed', fontSize: 12.sp, color: AppColors.kDarkerGrey,),
            Gap(20.h),
            RejectionReasonsCard(),
            Gap(20.h),
            CustomText(text: 'Previous Upload', fontSize: 12.sp, fontWeight: FontWeight.bold,),
            Gap(10.h),
            DottedBorder(
              options: RoundedRectDottedBorderOptions(radius: Radius.circular(10.r), color: AppColors.kDarkerGrey),
              child: SizedBox(
              width: double.infinity,
              height: 150.h,
            )),
            Gap(20.h),
            CustomText(text: 'Please re-upload a clear photo of your document. To ensure approval:', color: AppColors.kDarkerGrey, fontSize: 14.sp,),
            Gap(10.h),
            Row(
              spacing: 10.w,
              children: [
                Icon(Icons.check_circle, size: 15.sp, color: AppColors.kAccentPink,),
                CustomText(text: 'Ensure all four corners are visible', fontSize: 12.sp, color: AppColors.kDarkerGrey,)
              ],
            ),
            CustomButton(onPressed: (){
              pushNamed(AppRoutes.identity);
            }, text: 'Upload New Document'),
            Gap(20.h),
            Center(child: InkWell(
              onTap: () => pushNamed(AppRoutes.contactSupport),
              child: CustomText(text: 'Contact Support')))
            
          ],
        ),
      ),
    );
  }
}

class RejectionReasonsCard extends StatelessWidget {
  const RejectionReasonsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
              padding: EdgeInsets.all(15.sp),
              decoration: BoxDecoration(
                color: AppColors.kAccentPink.withValues(alpha: .05),
                borderRadius: BorderRadius.circular(15.sp),
                border: Border.all(
                  color: AppColors.kAccentPink.withValues(alpha: .4)
                )
              ),
              child: Column(
                spacing: 5.h,
                children: [
                  Row(
                    spacing: 5.w,
                    children: [
                      Icon(Icons.info, color: AppColors.kAccentPink,),
                      CustomText(text: 'Rejection Reason', fontSize: 12.sp, color: AppColors.kAccentPink, fontWeight: FontWeight.bold,),
                      
                    ],
                  ),
                  CustomText(text: 'The photo of your Driver\'s liscense was too blurry. Please ensure the text is legible and there\'s no glare.', fontSize: 12.sp, color: AppColors.kDarkerGrey,)
                ],
              ),
            );
  }
}