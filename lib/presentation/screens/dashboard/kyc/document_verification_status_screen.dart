import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
import 'package:baba_24/presentation/widgets/custom_button.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class VerificationProgressScreen extends StatelessWidget {
  const VerificationProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF7F7),
      appBar: CustomAppbar(title: '24baba Verification'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Circular Progress
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 180,
                  width: 180,
                  child: CircularProgressIndicator(
                    value: 0.65,
                    strokeWidth: 8,
                    backgroundColor: Colors.pink.shade100,
                    valueColor: const AlwaysStoppedAnimation(AppColors.kAccentPink),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFFBE5EC),
                  ),
                  child: const Icon(Icons.verified, size: 40, color: Colors.pink),
                )
              ],
            ),

            const SizedBox(height: 24),

             CustomText(
             text:  "Verification in\nProgress",
              textAlign: TextAlign.center,
              fontSize: 20.sp, fontWeight: FontWeight.bold
             
            ),
            Gap(8.h),
             CustomText(
             text:  "Almost there, hang tight!",
             color: AppColors.kDarkerGrey,
             fontSize: 14.sp,
            ),

            Gap(20.h),

            // Review Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 2))
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children:  [
                      CircleAvatar(
                        backgroundColor: Color(0xFFFBE5EC),
                        child: Icon(Icons.timer, color:  AppColors.kAccentPink),
                      ),
                      SizedBox(width: 12),
                      CustomText(
                        
                        text: "Review Period",
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        ),
                    ],
                  ),
                  Gap(8.h),
                   CustomText(
                   text:  "Our team is reviewing your driver's license. This typically takes 30–60 minutes.",
                    fontSize: 12.sp,
                    color: AppColors.kDarkerGrey.withValues(alpha: .5),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      CustomText( text: "Current Progress", fontSize: 13.sp,),
                      CustomText(text:  "65%", color: AppColors.kAccentPink, fontSize: 13.sp,),
                    ],
                  ),
                  const SizedBox(height: 6),
                  LinearProgressIndicator(
                    value: 0.65,
                    backgroundColor: Colors.pink.shade100,
                    valueColor: const AlwaysStoppedAnimation(AppColors.kAccentPink),
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ID Cards
            Row(
              children: [
                Expanded(child: _idCard("assets/front.png", "FRONT VIEW")),
                const SizedBox(width: 12),
                Expanded(child: _idCard("assets/back.png", "BACK VIEW")),
              ],
            ),

       

         CustomButton(onPressed: (){}, text: 'Back to Dashboard'),

            Gap(8),
             CustomText(
              text: 
              "Why is this required?",
               color: AppColors.kAccentPink, fontSize: 12.sp,),
          ],
        ),
      ),
    );
  }

  Widget _idCard(String image, String label) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(image, height: 80, fit: BoxFit.cover),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.pink)),
      ],
    );
  }
}
