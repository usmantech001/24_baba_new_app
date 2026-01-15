import 'package:baba_24/presentation/screens/onboard/widgets/custom_icon.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kWhite,
        automaticallyImplyLeading: false,
        title: CustomText(text: 'Profile'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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

            Gap(30.h),
            CustomText(text: 'ACCOUNT', color: AppColors.kGrey),
            Gap(15.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10.h,
              children: [
                SettingsTile(
                  title: 'Personal Information',
                  shortDesc: 'Name, Email, Phone',
                  icon: Icons.person,
                  iconColor: AppColors.kAccentPink,
                ),
                SettingsTile(
                  title: 'Payment Methods',
                  shortDesc: 'Visa ding in 4243',
                  icon: Icons.card_giftcard,
                  iconColor: Colors.orange,
                ),
                SettingsTile(title: 'Security', shortDesc: 'Password, 2FA',
                icon: Icons.lock,
                  iconColor: AppColors.kAccentGreen,
                ),
              ],
            ),
            Gap(20.h),
            CustomText(text: 'Preferences', color: AppColors.kGrey),
            Gap(15.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10.h,
              children: [
                SettingsTile(title: 'Push Notification', icon: Icons.notifications,
                  iconColor: Colors.blueAccent,),
                SettingsTile(title: 'Dark Mode',
                icon: Icons.mode,
                  iconColor: Colors.deepPurple,
                ),

                SettingsTile(title: 'Language',
                icon: Icons.language
                ,
                  iconColor: Colors.orange,
                ),
              ],
            ),
            Gap(20.h),
            CustomText(text: 'Support', color: AppColors.kGrey),
            Gap(15.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10.h,
              children: [
                SettingsTile(title: 'Help Center',
                icon: Icons.card_giftcard,
                  iconColor: Colors.orange,
                ),
                SettingsTile(title: 'Log Out',
                icon: Icons.card_giftcard,
                  iconColor: Colors.orange,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsTile extends StatelessWidget {
  const SettingsTile({super.key, required this.title, required this.icon, required this.iconColor, this.shortDesc});
  final String title;
  final String? shortDesc;
  final Color iconColor;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.kGrey.withValues(alpha: .1),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 10.w,
            children: [
              Container(
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: .1),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Icon(icon, color: iconColor,),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: title),
                  if (shortDesc != null)
                    CustomText(
                      text: shortDesc!,
                      color: AppColors.kGrey.withValues(alpha: .8),
                      fontSize: 12.sp,
                    ),
                ],
              ),
            ],
          ),
          Icon(Icons.navigate_next, color: AppColors.kGrey),
        ],
      ),
    );
  }
}
