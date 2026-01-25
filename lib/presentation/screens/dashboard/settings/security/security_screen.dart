import 'package:baba_24/presentation/screens/dashboard/settings/settings_screen.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Security'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
        child: Column(
          spacing: 10.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SettingsTile(
              title: 'Your account is secure',
              icon: FontAwesomeIcons.lock,
              iconColor: AppColors.kAccentGreen,
              shortDesc: 'Security Status: High',
              shortDescColor: AppColors.kLightPink,
              suffix: SizedBox.shrink(),
            ),
            Gap(10.h),
            CustomText(text: 'SIGN IN', fontSize: 12.sp),
            SettingsTile(
              title: 'Change Password',
              icon: FontAwesomeIcons.lock,
              iconColor: AppColors.kAccentPink,
            ),
            SettingsTile(
              title: 'Enable FaceID',
              icon: FontAwesomeIcons.lock,
              iconColor: AppColors.kAccentPink,
            ),
            SettingsTile(
              title: 'Two-Factor Auth',
              icon: FontAwesomeIcons.lock,
              iconColor: AppColors.kAccentPink,
            ),
            Gap(10.h),
            CustomText(text: 'RECENT DEVICES', fontSize: 12.sp),
            SettingsTile(
              title: 'iPhone 13',
              shortDesc: 'London, UK Now',
              icon: Icons.phone_android,
              iconColor: AppColors.kBlack,
            ),
            SettingsTile(
              title: 'iPhone 15 Pro',
              shortDesc: 'London, UK Now',
              icon: Icons.phone_android,
              iconColor: AppColors.kBlack,
            ),
          ],
        ),
      ),
    );
  }
}
