import 'package:baba_24/presentation/screens/onboard/widgets/app_text_field.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
import 'package:baba_24/presentation/widgets/custom_button.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:baba_24/utils/global.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ContactSupportScreen extends StatelessWidget {
  const ContactSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Contact Support'),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 50.h),
        child: Column(
          spacing: 20.h,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: 'How can we help?',
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                ),
                Gap(10.h),
                CustomText(
                  text:
                      'Our car rental is available 24/7. Send us a message and we will respond as soon as possible',
                  color: AppColors.kDarkerGrey,
                  fontSize: 13.sp,
                ),
              ],
            ),
            AppTextField(
              controller: TextEditingController(),
              label: 'Reason for your contact',
              hintText: 'Select a category',
            ),
            AppTextField(
              controller: TextEditingController(),
              label: 'Subject',
              hintText: 'e.g Tire pressure warning',
            ),
            AppTextField(
              controller: TextEditingController(),
              label: 'Message',
              hintText: 'Describe your issue in details..',
              minLines: 5,
            ),

            DottedBorder(
              options: RoundedRectDottedBorderOptions(radius: Radius.circular(10.sp), color: AppColors.kGrey),
              child: Container(
                width: deviceWidth(context),
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                child: Column(
                  spacing: 5.h,
                  children: [
                    Icon(Icons.add),
                    CustomText(text: 'Add photos or documents', fontSize: 13.sp, fontWeight: FontWeight.w500,),
                    CustomText(text: 'PNG, JPG or PDF (MAX 10Mb)', fontSize: 12.sp, color: AppColors.kDarkerGrey,)
                  ],
                ),
              ),
            ),
            CustomButton(onPressed: (){}, text: '', child: Row(
              spacing: 10.w,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(text: 'Send Message', fontSize: 14.sp, fontWeight: FontWeight.w600, color: AppColors.kWhite,),
                Icon(Icons.send, color: AppColors.kWhite,)
              ],
            ),),
            CustomText(text: 'By contacting us, you agree to our terms of service. We typically reply within 2 hours', color: AppColors.kDarkerGrey, fontSize: 12.sp, textAlign: TextAlign.center,)
          ],
        ),
      ),
    );
  }
}
