import 'package:baba_24/core/app_route.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
import 'package:baba_24/presentation/widgets/custom_button.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:baba_24/utils/nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class TrustSafetyScreen extends StatelessWidget {
  const TrustSafetyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<IconData> icons = [
      Icons.lock,
      Icons.verified,
      Icons.headset,
      Icons.payments,
      Icons.health_and_safety,
      Icons.health_and_safety_outlined
    ];

    List<CertificationModel> certifications =[
      CertificationModel(text: 'SSL Secured', description: 'Bank-grade data encryption', icon: Icons.lock),
      CertificationModel(text: 'Verified Partner', description: 'Official licensed provider', icon: Icons.verified),
      CertificationModel(text: '24/7 Roadside', description: 'Help whenever you need', icon: Icons.headphones),
      CertificationModel(text: 'Money-Back', description: 'Transparent refund policy', icon: Icons.payments),

      CertificationModel(text: 'Full Coverage', description: 'Premium insurance included', icon: Icons.health_and_safety),
      CertificationModel(text: 'Fleet Health', description: 'Regular 50-point checks', icon: Icons.health_and_safety_outlined),
    ];
    return Scaffold(
      backgroundColor: AppColors.kWhite.withValues(alpha: .95),
      appBar: CustomAppbar(title: 'Trust & Safety'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
              decoration: BoxDecoration(
                color: AppColors.kLightPink.withValues(alpha: .08),
                borderRadius: BorderRadius.circular(10.sp)
              ),
              child: CustomText(text: 'VERIFIED PLATFORM', fontSize: 13.sp, color: AppColors.kAccentPink,),
            ),
            Gap(10.h),
            CustomText(text: 'Your safety is our priority', fontSize: 25.sp, fontWeight: FontWeight.bold,),
            Gap(5.h),
            CustomText(text: 'We go the extra mile to ensureyour rental experience is secure, verified and completely worry-free', color: AppColors.kBlack.withValues(alpha: .6), fontSize: 14.sp,),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: SizedBox(
                width: 50,
                child: Divider(color: AppColors.kAccentPink,)),
            ),
            CustomText(text: 'CERTIFICATION AND GUARANTEES', color: AppColors.kBlack.withValues(alpha: .7), fontSize: 14.sp,),
            GridView.builder(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              shrinkWrap: true,
              itemCount: certifications.length,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10), itemBuilder: (context, index){
                final certification = certifications[index];
                return Container(
                  padding: EdgeInsets.all(15.sp),
                decoration: BoxDecoration(
                  color: AppColors.kWhite,
                  borderRadius: BorderRadius.circular(10.r)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.sp),
                      decoration: BoxDecoration(
                        color: AppColors.kAccentPink.withValues(alpha: .05),
                        borderRadius: BorderRadius.circular(10.sp)
                      ),
                      child: Icon(certification.icon, color: AppColors.kAccentPink,),
                    ),
                    CustomText(text: certification.text, fontWeight: FontWeight.bold, fontSize: 14.sp,),
                    CustomText(text: certification.description, color: AppColors.kDarkerGrey.withValues(alpha: .8), fontSize: 14.sp,),
                  ],
                ),
                );
            }),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
              decoration: BoxDecoration(
                color: AppColors.kBlack,
                borderRadius: BorderRadius.circular(15.r)
              ),
              child: Row(
                spacing: 10.w,
                children: [
                  Container(
                      padding: EdgeInsets.all(6.sp),
                      decoration: BoxDecoration(
                        color: AppColors.kGrey.withValues(alpha: .5),
                        borderRadius: BorderRadius.circular(10.sp)
                      ),
                      child: Icon(Icons.lock, color: AppColors.kAccentPink,),
                    ),
                    SizedBox(
                      width: 250,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(text: '24baba Trust Guarantee', color: AppColors.kWhite, fontWeight: FontWeight.w600,),
                          CustomText(text: 'Audited monthly by Global Transport Board', fontSize: 11, color: AppColors.kGrey,)
                        ],
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.check_circle, color: AppColors.kAccentPink, size: 18.sp,)
                ],
              ),
            ),

            CustomButton(onPressed: (){
              pushNamed(AppRoutes.contactSupport);
            }, text: 'Contact Support')
          ],
        ),
      ),
    );
  }
}

class CertificationModel{
  final String text;
  final String description;
  final IconData icon;
  CertificationModel({required this.text, required this.description, required this.icon});

}