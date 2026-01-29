import 'package:baba_24/core/app_route.dart';
import 'package:baba_24/presentation/screens/dashboard/home/widgets/section_header.dart';
import 'package:baba_24/presentation/screens/dashboard/settings/settings_screen.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/app_text_field.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/custom_icon.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:baba_24/utils/nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> topics = [
      'Booking & Cancellations',
      'Payments & Pricing',
      'Insurance & Coverage',
      'Vehicle Pickup & Drop-off',
      'Report Damage',
    ];

    final List<IconData> icons =[
      FontAwesomeIcons.calendar
    ];
    return Scaffold(
      appBar: CustomAppbar(title: 'Help & Support'),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 50.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextField(
              controller: TextEditingController(),
              hintText: 'Serch for help, topics, or FAQs',
            ),
            GestureDetector(
              onTap: () => pushNamed(AppRoutes.roadAssistance),
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 20.h),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: AppColors.kLightPink,
                  borderRadius: BorderRadius.circular(15.sp),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10,
                  children: [
                    Icon(Icons.report, color: AppColors.kWhite),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'Roadside Assistance',
                          color: AppColors.kWhite,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        CustomText(
                          text: 'Available 24/7for emergencies',
                          color: AppColors.kWhite,
                          fontSize: 12.sp,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SectionHeader(
              text: 'Quick Links',
              onTap: () {},
              textSize: 14.sp,
              hasMargin: false,
            ),
            Gap(10.h),
            Row(
              spacing: 10.w,
              children: [
                Expanded(
                  child: HelpSupportContainer(
                    icon: Icons.help,
                    text: 'FAQ',
                    subtext: 'Instant answers to common questions',
                    onTap: () => pushNamed(AppRoutes.faq),
                  ),
                ),
                Expanded(
                  child: HelpSupportContainer(
                    icon: Icons.help,
                    text: 'CONTACT US',
                    subtext: 'Talk to our support team',
                    onTap: () => pushNamed(AppRoutes.supportCenter),
                  ),
                ),
              ],
            ),
            Gap(20.h),
            SectionHeader(
              text: 'Support topics',
              onTap: () {},
              textSize: 14.sp,
              hasMargin: false,
            ),
            Gap(10.h),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return HelpTile(title: topics[index], icon: Icons.event);
              },
              separatorBuilder: (context, index) => Gap(10),
              itemCount: topics.length,
            ),

            Center(
              child: CustomText(
                text: 'Can\'t find what you are looking for?',
                fontSize: 12.sp,
                color: AppColors.kAccentPink,
              ),
            ),
            Gap(10.h),
            Row(
              spacing: 20.w,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomIcon(
                  iconData: Icons.message,
                  iconColor: AppColors.kAccentPink,
                  bgColor: AppColors.kAccentPink.withValues(alpha: .03),
                  radius: 30,
                  text: 'Live Chat',
                  onTap: () => pushNamed(AppRoutes.liveChat),
                ),
                CustomIcon(
                  iconData: Icons.phone,
                  iconColor: AppColors.kAccentPink,
                  bgColor: AppColors.kAccentPink.withValues(alpha: .03),
                  radius: 30,
                  text: 'Call us',
                ),
                CustomIcon(
                  iconData: Icons.mail,
                  iconColor: AppColors.kAccentPink,
                  bgColor: AppColors.kAccentPink.withValues(alpha: .03),
                  radius: 30,
                  text: 'Email',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HelpSupportContainer extends StatelessWidget {
  const HelpSupportContainer({
    super.key,
    required this.icon,
    required this.text,
    required this.subtext,
    required this.onTap
  });
  final IconData icon;
  final String text;
  final String subtext;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
        decoration: BoxDecoration(
          color: AppColors.kLightPink.withValues(alpha: .02),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10.h,
          children: [
            Container(
              padding: EdgeInsets.all(10.sp),
              decoration: BoxDecoration(
                color: AppColors.kAccentPink.withValues(alpha: .07),
                borderRadius: BorderRadius.circular(10.sp),
              ),
              child: Icon(Icons.question_answer, color: AppColors.kAccentPink),
            ),
            CustomText(text: text, fontSize: 14.sp, fontWeight: FontWeight.w600),
            CustomText(
              text: subtext,
              fontSize: 12.sp,
              color: AppColors.kAccentPink.withValues(alpha: .6),
            ),
          ],
        ),
      ),
    );
  }
}

class HelpTile extends StatelessWidget {
  const HelpTile({
    super.key,
    required this.title,
    required this.icon,
    this.iconColor,

    this.shortDescColor,

    this.onTap,
  });
  final String title;

  final Color? iconColor;
  final IconData icon;
  final Color? shortDescColor;

  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        decoration: BoxDecoration(
          color: AppColors.kGrey.withValues(alpha: .1),
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: AppColors.kGrey),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 10.w,
              children: [
                Icon(icon, color: AppColors.kLightPink),
                CustomText(
                  text: title,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
            Icon(Icons.navigate_next, color: AppColors.kGrey),
          ],
        ),
      ),
    );
  }
}
