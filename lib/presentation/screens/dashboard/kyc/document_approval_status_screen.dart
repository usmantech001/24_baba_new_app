import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/custom_icon.dart';
import 'package:baba_24/presentation/widgets/custom_button.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class DocumentApprovalStatusScreen extends StatelessWidget {
  const DocumentApprovalStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite.withValues(alpha: .98),

      appBar: CustomAppbar(title: 'Verification Status'),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w,),
        child: SafeArea(
          child: CustomButton(
            topPadding: 10,
            onPressed: (){}, text: '', child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add, color: AppColors.kWhite,),
              CustomText(text: 'Add Another Document', color: AppColors.kWhite, fontSize: 14.sp, fontWeight: FontWeight.w600,)
            ],
          ),),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: 'Document Approval',
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
            Gap(5.h),
            CustomText(
              text:
                  'Track the status of your uploaded documents to start your next journey',
              color: AppColors.kDarkerGrey,
              fontSize: 14.sp,
            ),
            Gap(20.h),
            Column(
              spacing: 15.h,
              children: [
                VerificationStatusItem(
                  text: 'Identity Card',
                  subText: 'Verified on Oct 24, 2023',
                  status: 'APPROVED',
                  statusColor: Colors.green,
                  statusIcon: Icons.check_circle,
                ),
                VerificationStatusItem(
                  text: 'Driver\'s Liscense',
                  subText: 'Estimated review 24h',
                  status: 'PENDING',
                  statusColor: const Color.fromARGB(255, 255, 230, 0),
                  statusIcon: Icons.history,
                ),
                VerificationStatusItem(
                  text: 'Identity Card',
                  subText: 'Verified on Oct 24, 2023',
                  status: 'REJECTED',
                  statusColor: Colors.red,
                  statusIcon: Icons.cancel,
                ),
              ],
            ),
            Gap(20.h),
            Container(
              padding: EdgeInsets.all(15.r),
              decoration: BoxDecoration(
                color: AppColors.kWhite,
                borderRadius: BorderRadius.circular(10.sp),
              ),
              child: Row(
                spacing: 10.w,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.info, color: AppColors.kAccentPink),
                  Flexible(
                    child: CustomText(
                      text:
                          'Our team manually verifies each document.Verification usually takes up to 24 business hours.You\'ll receive a notification once approved.',
                    fontSize: 12.sp,
                    color: AppColors.kDarkerGrey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VerificationStatusItem extends StatelessWidget {
  const VerificationStatusItem({
    super.key,
    required this.text,
    required this.subText,
    required this.status,
    required this.statusColor,
    required this.statusIcon,
  });
  final String text;
  final String subText;
  final String status;
  final Color statusColor;
  final IconData statusIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.sp),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.kWhite,
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: Row(
        spacing: 10.w,
        children: [
          CustomIcon(
            iconData: Icons.badge,
            bgColor: AppColors.kAccentPink.withValues(alpha: .03),
            iconColor: AppColors.kAccentPink,
            iconSize: 18,
            radius: 23.r,
          ),
          Column(
            spacing: 3.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: text,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
              CustomText(
                text: subText,
                fontSize: 12.sp,
                color: AppColors.kDarkerGrey,
              ),
            ],
          ),
          Spacer(),
          Column(
            spacing: 5.h,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              StatusItem(text: status, color: statusColor),
              Icon(statusIcon, color: statusColor, size: 15.sp),
            ],
          ),
        ],
      ),
    );
  }
}

class StatusItem extends StatelessWidget {
  const StatusItem({super.key, required this.text, required this.color});
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: color.withValues(alpha: .1),
      ),
      child: CustomText(text: text, fontSize: 10.sp, color: color),
    );
  }
}
