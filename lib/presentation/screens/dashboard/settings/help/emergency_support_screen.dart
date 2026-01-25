import 'package:baba_24/presentation/screens/onboard/widgets/custom_icon.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class EmergencySupportScreen extends StatelessWidget {
  const EmergencySupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite.withValues(alpha: .99),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            //height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.kAccentPink,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.r),
                bottomRight: Radius.circular(20.r),
              ),
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomIcon(
                        iconData: Icons.navigate_before,
                        bgColor: AppColors.kWhite.withValues(alpha: .4),
                        iconColor: AppColors.kWhite,
                      ),
                      CustomText(
                        text: 'Emergency Support',
                        color: AppColors.kWhite,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox.shrink(),
                    ],
                  ),
                  Gap(20.h),
                  CustomText(
                    text: 'Accident Assistance',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.kWhite,
                  ),
                  Gap(3.h),
                  CustomText(
                    text: 'Follow these steps for your safety',
                    color: AppColors.kWhite,
                    fontSize: 12.sp,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 20.h, bottom: 40.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 15.h,
                children: [
                  EmergencyContainer(
                    text: 'Call Emergency Services',
                    descr: 'Immediate medical or police help',
                    icon: Icons.headphones,
                  ),
            
                  EmergencyContainer(
                    text: 'Call Emergency Services',
                    descr: 'Immediate medical or police help',
                    icon: Icons.headphones,
                    bgColor: AppColors.kWhite,
                  ),
                  Container(
                    padding: EdgeInsets.all(15.sp),
                    decoration: BoxDecoration(
                      color: AppColors.kGrey.withValues(alpha: .1),
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                    child: Row(
                      spacing: 10.w,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.kGrey.withValues(alpha: .4),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(Icons.support, color: AppColors.kWhite),
                        ),
                        SizedBox(
                          width: 200.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: 'CURRENT LOCATION',
                                color: AppColors.kDarkerGrey,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                              CustomText(
                                text: '10, ifelajulo street senle inu ewe',
                                fontSize: 12.sp,
                                maxLines: 1,
                                textOverflow: TextOverflow.ellipsis,
                                color: AppColors.kBlack.withValues(alpha: .78),
                                fontWeight: FontWeight.w600,
                              ),
                              CustomText(
                                text: 'Lat: 37.555, Lng: 127.55',
                                fontSize: 12.sp,
                                maxLines: 1,
                                textOverflow: TextOverflow.ellipsis,
                                color: AppColors.kLightPink.withValues(
                                  alpha: .78,
                                ),
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Icon(
                          FontAwesomeIcons.locationDot,
                          color: AppColors.kLightPink,
                        ),
                      ],
                    ),
                  ),
                  Gap(10.h),
                  CustomText(
                    text: 'What to do next',
                    fontWeight: FontWeight.w600,
                  ),
                  Column(
                    spacing: 10.h,
                    children: [
                      WhatToDoNextContainer(
                        text: 'Ensure Safety',
                        descr:
                            'Turn on hazard light and move to a safe area away from traffic',
                      ),
                      WhatToDoNextContainer(
                        text: 'Take Photos',
                        descr:
                            'Capture vehicles, license plate, and the surrounding scene',
                      ),
                      WhatToDoNextContainer(
                        text: 'Exchange Info',
                        descr:
                            'Get insurance details driver\'s liscenceinfo and contact numbers',
                      ),
                    ],
                  ),
                  Gap(20.h),
                  Center(
                    child: CircleAvatar(
                      backgroundColor: AppColors.kDarkerGrey.withValues(alpha: .3),
                      child: Icon(Icons.help, color: AppColors.kGrey,),
                    ),
                  ),
                  CustomText(text: '"24baba is here to help you through this process. You are fully covered by our premium insuranceplan"', fontStyle: FontStyle.italic, fontSize: 12.sp, color: AppColors.kGrey,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WhatToDoNextContainer extends StatelessWidget {
  const WhatToDoNextContainer({
    super.key,
    required this.text,
    required this.descr,
    this.isSelected = false,
  });
  final String text;
  final String descr;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.sp),
      decoration: BoxDecoration(
        color: AppColors.kWhite,
        borderRadius: BorderRadius.circular(15.sp),
        border: Border.all(color: AppColors.kGrey.withValues(alpha: .2)),
      ),
      child: Row(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check_circle, color: Colors.green),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: text,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
                CustomText(
                  text:descr,
                  fontSize: 12.sp,
                  color: AppColors.kDarkerGrey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EmergencyContainer extends StatelessWidget {
  const EmergencyContainer({
    super.key,
    required this.text,
    required this.descr,
    required this.icon,
    this.bgColor,
  });
  final String text;
  final String descr;
  final Color? bgColor;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.sp),
      decoration: BoxDecoration(
        color: bgColor ?? AppColors.kAccentPink,
        borderRadius: BorderRadius.circular(25.r),
        border: Border.all(
          color: bgColor != null
              ? AppColors.kLightPink.withValues(alpha: .2)
              : Colors.transparent,
        ),
      ),
      child: Row(
        spacing: 10.w,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15.h),
            decoration: BoxDecoration(
              color: bgColor != null
                  ? AppColors.kLightPink.withValues(alpha: .2)
                  : AppColors.kWhite.withValues(alpha: .4),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.support,
              color: bgColor != null ? AppColors.kAccentPink : AppColors.kWhite,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: text,
                color: bgColor != null
                    ? AppColors.kAccentPink
                    : AppColors.kWhite,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
              CustomText(
                text: descr,
                fontSize: 12.sp,
                color: bgColor != null
                    ? AppColors.kDarkerGrey
                    : AppColors.kWhite.withValues(alpha: .78),
              ),
            ],
          ),
          Spacer(),
          Icon(
            Icons.phone,
            color: bgColor != null ? AppColors.kAccentPink : AppColors.kWhite,
          ),
        ],
      ),
    );
  }
}
