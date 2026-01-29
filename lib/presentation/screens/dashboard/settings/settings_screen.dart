import 'package:baba_24/core/app_route.dart';
import 'package:baba_24/presentation/screens/dashboard/booking/booking_info_screen.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/custom_icon.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:baba_24/utils/nav.dart';
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
                   CustomText(
                    text: 'faiz@gmail.com',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.kBlack.withValues(alpha: .3),
                  ),
                ],
              ),
            ),
            Gap(30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SettingsBox(text: 'Favorite', icon: Icons.favorite_outline, onTap: () {
                  pushNamed(AppRoutes.savedCars);
                },),
                SettingsBox(text: 'Schedule', icon: Icons.calendar_month, onTap: () {
                 // pushNamed(AppRoutes.savedCars);
                },),
                SettingsBox(text: 'Booking', icon: Icons.book_online, onTap: () {
                  pushNamed(AppRoutes.bookings);
                },),
              ],
            ),
             Gap(30.h),
            // CustomText(text: 'ACCOUNT', color: AppColors.kGrey),
            //Gap(15.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              decoration: BoxDecoration(
                   color: AppColors.kGrey.withValues(alpha: .1),
                   borderRadius: BorderRadius.circular(20.r),
                  //  boxShadow: [
                  //     BoxShadow(
                  //       offset: Offset(3, 3),
                  //       color: Colors.white,
                  //     ),
                  //     BoxShadow(
                  //       offset: Offset(-3, -3),
                  //      color: Colors.white,
                  //     ),
                  //   ],

              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8.h,
                children: [
                  SettingsTile(
                    title: 'Edit Profile',
                    icon: Icons.person,
                    iconColor: AppColors.kAccentPink,
                    onTap: () => pushNamed(AppRoutes.account),
                  ),
                  SettingsTile(
                    title: 'Payment Methods',
               
                    icon: Icons.card_giftcard,
                    iconColor: Colors.orange,
                    onTap: () => pushNamed(AppRoutes.paymentMethods),
                  ), 
                  SettingsTile(
                    title: 'Security',
                     
                    icon: Icons.lock,
                    iconColor: AppColors.kAccentGreen,
                    onTap: () => pushNamed(AppRoutes.security),
                  ),
                   SettingsTile(
                  title: 'KYC',
                  icon: Icons.language,
                  iconColor: Colors.orange,
                  onTap: () => pushNamed(AppRoutes.identity),
                ),
                  SettingsTile(
                    title: 'Loyalty & Rewards',
                    //shortDesc: 'Earn points on every booking',
                    icon: Icons.card_giftcard,
                    iconColor: Colors.orange,
                    onTap: () => pushNamed(AppRoutes.rewards),
                  ),
                  SettingsTile(
                    title: 'Push Notification',
                    icon: Icons.notifications,
                    iconColor: Colors.blueAccent,
                    suffix: Transform.scale(
                      alignment: Alignment.centerRight,
                      scale: 0.7,
                      child: Switch(
                        value: true,
                        activeColor: AppColors.kWhite,
                        activeTrackColor: AppColors.kLightPink,
                        onChanged: (value) {
                          //showSnackBar(context, 'Light mode is coming soon');
                          return;
                        },
                      ),
                    ),
                  ),
                  SettingsTile(
                  title: 'Language',
                  icon: Icons.language,
                  iconColor: Colors.orange,
                  onTap: () => pushNamed(AppRoutes.languageCurrency),
                ),
                SettingsTile(
                  title: 'My Address',
                  icon: Icons.location_city,
                  iconColor: Colors.indigo,
                  onTap: () => pushNamed(AppRoutes.addresses),
                ),
                ],
              ),
            ),
            // Gap(20.h),
            // CustomText(text: 'Preferences', color: AppColors.kGrey),
            Gap(15.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              decoration: BoxDecoration(
                   color: AppColors.kGrey.withValues(alpha: .1),
                   borderRadius: BorderRadius.circular(20.r),
                  //  boxShadow: [
                  //     BoxShadow(
                  //       offset: Offset(3, 3),
                  //       color: Colors.white,
                  //     ),
                  //     BoxShadow(
                  //       offset: Offset(-3, -3),
                  //      color: Colors.white,
                  //     ),
                  //   ],

              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 5.h,
                children: [
                  SettingsTile(
                    title: 'Emergency Support',
                    icon: Icons.help,
                    iconColor: Colors.teal,
                    onTap: () => pushNamed(AppRoutes.emergencySupport),
                  ),
                 SettingsTile(
                    title: 'Trust and Safety',
                    icon: Icons.help,
                    iconColor: Colors.teal,
                    onTap: () => pushNamed(AppRoutes.trustSafety),
                  ),
                  SettingsTile(
                    title: 'Refunds Policy',
                    icon: Icons.lock,
                    iconColor: Colors.teal,
                    onTap: () => pushNamed(AppRoutes.refundPolicy),
                  ),
                  SettingsTile(
                    title: 'Driver Eligibility Rules',
                    icon: Icons.lock,
                    iconColor: Colors.teal,
                    onTap: () => pushNamed(AppRoutes.driverEligibility),
                  ),
                   SettingsTile(
                    title: 'Help and Support',
                    icon: Icons.help,
                    iconColor: Colors.teal,
                    onTap: () => pushNamed(AppRoutes.helpSupport),
                  ),
                 
                 SettingsTile(
                  title: 'Log Out',
                  icon: Icons.card_giftcard,
                  iconColor: Colors.orange,
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

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    super.key,
    required this.title,
    required this.icon,
    required this.iconColor,
    this.shortDesc,
    this.shortDescColor,
    this.suffix,
    this.onTap,
  });
  final String title;
  final String? shortDesc;
  final Color iconColor;
  final IconData icon;
  final Color? shortDescColor;
  final Widget? suffix;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 15.w,
            children: [
              Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: AppColors.kAccentPink.withValues(alpha: .1),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Icon(icon, color: AppColors.kAccentPink, size: 20.sp,),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: title,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  if (shortDesc != null)
                    CustomText(
                      text: shortDesc!,
                      color:
                          shortDescColor ??
                          AppColors.kGrey.withValues(alpha: .8),
                      fontSize: 12.sp,
                    ),
                ],
              ),
            ],
          ),
          suffix ?? Icon(Icons.navigate_next, color: AppColors.kGrey),
        ],
      ),
    );
  }
}

class SettingsBox extends StatelessWidget {
  const SettingsBox({super.key, required this.text, required this.icon, required this.onTap});

  final String text;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        decoration: BoxDecoration(
          color: AppColors.kAccentPink.withValues(alpha: .15),
          borderRadius: BorderRadius.circular(15.sp),
        ),
        child: Column(
          spacing: 8.h,
          children: [
            Icon(icon, color: AppColors.kAccentPink,),
            CustomText(text: text, fontSize: 12.sp),
          ],
        ),
      ),
    );
  }
}
