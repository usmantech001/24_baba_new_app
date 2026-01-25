import 'package:baba_24/core/app_route.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/app_text_field.dart';
import 'package:baba_24/presentation/widgets/custom_button.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class PromoCodeScreen extends StatelessWidget {
  const PromoCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
                padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 30.h),
                child: SafeArea(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                  
                      CustomButton(
                        topPadding: 0,
                        onPressed: (){
                          pushNamed(AppRoutes.bookingInfo);
                        }, text: 'Redeem'),
                    ],
                  ),
                )),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/onboarding_1.png', height: 300,),
              Gap(50.h),
              CustomText(text: 'Have a Promo Code?', fontWeight: FontWeight.w700,),
              Gap(30.h),
              AppTextField(controller: TextEditingController()),
              
              
            ],
          ),
        ),
      ),
    );
  }
}