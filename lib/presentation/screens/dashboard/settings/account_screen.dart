import 'package:baba_24/presentation/screens/onboard/widgets/app_text_field.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/custom_icon.dart';
import 'package:baba_24/presentation/widgets/custom_button.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Account'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  DottedBorder(
                    //color: Colors.red,
                    options: CircularDottedBorderOptions(
                      dashPattern: [5, 5],
                      color: AppColors.kAccentPink,
                    ),
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: AppColors.kGrey.withValues(
                            alpha: .2,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: CustomIcon(
                            iconData: Icons.edit,
                            bgColor: AppColors.kAccentPink,
                            iconColor: AppColors.kWhite,
                            radius: 15,
                            iconSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(15.h),
                  CustomText(
                    text: 'Ali Ahmad',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
            Gap(50.h),
            Column(
              spacing: 20.h,
              children: [
                AppTextField(
                  controller: TextEditingController(),
                  label: 'Email',
                  readOnly: true,
                ),
                AppTextField(
                  controller: TextEditingController(),
                  label: 'Username',
                  readOnly: true,
                ),
                AppTextField(
                  controller: TextEditingController(),
                  label: 'Phone Number',
                  readOnly: true,
                ),
                CustomButton(onPressed: (){}, text: 'Save')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
