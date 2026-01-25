import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<String> tabTexts = ['All', 'Unread', 'Archived'];

  int selectedIndex = 0;

  void onTabChanged(int index) {
    selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Notifications'),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.w),
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 7.h),
            decoration: BoxDecoration(
              color: AppColors.kAccentPink.withValues(alpha: .08),
              borderRadius: BorderRadius.circular(10.sp),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(tabTexts.length, (index) {
                final text = tabTexts[index];
                return NotificationTab(
                  text: text,
                  isSelected: selectedIndex == index,
                  onTap: () => onTabChanged(index),
                );
              }),
            ),
          ),

          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 25.h),
              itemBuilder: (contex, index) {
                return NotificationTile();
              },
              separatorBuilder: (context, index) => Gap(20.h),
              itemCount: 40,
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  const NotificationTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w),

      width: double.infinity,
      //color: Colors.red,
      child: Row(
        spacing: 10.w,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.kAccentPink.withValues(alpha: .05),
              borderRadius: BorderRadius.circular(10.sp),
            ),
            child: Icon(Icons.notifications, color: AppColors.kAccentPink),
          ),
          Flexible(
            child: Column(
              spacing: 5.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Booking Confirmed',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    CustomText(
                      text: '2m',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.kAccentPink,
                    ),
                  ],
                ),
                CustomText(
                  text:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                  color: AppColors.kBlack.withValues(alpha: .5),
                  fontSize: 12.sp,
                  maxLines: 3,
                  textOverflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationTab extends StatelessWidget {
  const NotificationTab({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 3.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.kWhite : Colors.transparent,
          borderRadius: BorderRadius.circular(5.sp),
        ),
        child: CustomText(
          text: text,
          fontSize: 14.sp,
          color: isSelected ? AppColors.kAccentPink : AppColors.kGrey,
        ),
      ),
    );
  }
}
