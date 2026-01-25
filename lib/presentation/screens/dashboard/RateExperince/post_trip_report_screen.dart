import 'package:baba_24/presentation/screens/onboard/widgets/app_text_field.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
import 'package:baba_24/presentation/widgets/custom_button.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class PostTripReportScreen extends StatelessWidget {
  const PostTripReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Post-Trip Report'),
         bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: SafeArea(
          top: false,
          child: CustomButton(
            topPadding: 10.h,
            onPressed: (){}, text: 'Submit Report')),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: 'Something went wrong?',
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
            Gap(10.h),
            CustomText(
              text:
                  'We\'re sorry your trip wasn\'t perfect Tell us what happened so we can make it right for your next ride with 24baba',
              color: AppColors.kBlack.withValues(alpha: .5),
              fontSize: 12.sp,
            ),
            Gap(20.h),
            CustomText(
              text: 'WHAT WAS THE ISSUE?',
              color: AppColors.kGrey,
              fontWeight: FontWeight.w700,
              fontSize: 13.sp,
            ),
            Gap(5.h),
            Container(
              padding: EdgeInsets.all(15.sp),
              decoration: BoxDecoration(
                color: AppColors.kGrey.withValues(alpha: .07),
                borderRadius: BorderRadius.circular(20.sp),
              ),
              child: Column(
                spacing: 20.h,
                children: [
                  IssueSelector(text: 'Cleaning (interior/exterior)'),
                  IssueSelector(text: 'Mechanical problem'),
                  IssueSelector(text: 'Fuel discrepancy'),
                  IssueSelector(text: 'Exterior damage'),
                ],
              ),
            ),
            Gap(20.h),
            CustomText(text: 'DESCRIPTION', fontSize: 14.sp, color: AppColors.kBlack.withValues(alpha: .5),),
            Gap(5.h),
            AppTextField(controller: TextEditingController(), minLines: 4, hintText: 'Describe the issue in detail. The more info the better ...', ),
            Gap(20.h),
            CustomText(text: 'EVIDENCE', fontSize: 14.sp, color: AppColors.kBlack.withValues(alpha: .5),),
            Gap(5.h),
            DottedBorder(
              options: RoundedRectDottedBorderOptions(radius: Radius.circular(20.r), color: AppColors.kAccentPink.withValues(alpha: .6)),
              child: Container(
                height: 80.h,
                width: 80.w,
                color: AppColors.kAccentPink.withValues(alpha: .04),
                child: Icon(Icons.add),
              ))
          ],
        ),
      ),
    );
  }
}

class IssueSelector extends StatelessWidget {
  const IssueSelector({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(text: text),
                      Radio.adaptive(
                        value: false,
                        groupValue: false,
                        activeColor: AppColors.kAccentPink,
                        toggleable: true,
                        onChanged: (value) {},
                      ),
                    ],
                  );
  }
}
