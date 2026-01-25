import 'package:baba_24/presentation/screens/dashboard/home/widgets/section_header.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/app_text_field.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/toggle_selector.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:baba_24/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Select Location'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              children: [
                AppTextField(
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'Where are you picking up',
                    prefixIcon: Icon(Icons.search),
                    fillColor: AppColors.kGrey.withValues(alpha: .1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                      // borderSide: BorderSide(color: Colors.red, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.transparent),
                      // borderSide: BorderSide(color: Colors.red, width: 1),
                    ),
                  ),
                ),
                Gap(20.h),
                ToggleSelectorWidget(
                  tabIndex: 0,
                  tabText: ['List View', 'Map View'],
                  onTap: (index) {},
                  selectedColor: AppColors.kWhite,
                  selectedTexColor: AppColors.kBlack,
                  unSelectedTexColor: AppColors.kAccentPink,
                  bgColor: AppColors.kAccentPink.withValues(alpha: .05),
                  hasMargin: false,
                ),
                Gap(20.h),
              ],
            ),
          ),
          Flexible(
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              //controller: controller.pageController,
              children: [
                LocationListView(),
                CustomText(text: 'Map View'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LocationListView extends StatelessWidget {
  const LocationListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            decoration: BoxDecoration(
              color: AppColors.kLightPink.withValues(alpha: .05),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              spacing: 10.w,
              children: [
                Icon(
                  FontAwesomeIcons.locationArrow,
                  color: AppColors.kAccentPink,
                ),
                CustomText(
                  text: 'Use my current location',
                  fontWeight: FontWeight.bold,
                  color: AppColors.kAccentPink,
                  fontSize: 14.sp,
                ),
              ],
            ),
          ),
          Gap(20.h),
          CustomText(text: 'Search Shortcuts'),
          Gap(10.h),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 30.w,
              children: [
                CustomShortcut(text: 'Airport', icon: Icons.location_city),
                CustomShortcut(text: 'City Hubs', icon: Icons.location_city),
                CustomShortcut(text: 'Airport', icon: Icons.location_city),
                CustomShortcut(text: 'Airport', icon: Icons.location_city),
                CustomShortcut(text: 'Airport', icon: Icons.location_city),
                CustomShortcut(text: 'Airport', icon: Icons.location_city),
              ],
            ),
          ),
          Gap(30.h),
          SectionHeader(
            text: 'Recent Locations',
            suffixText: 'Clear',
            textSize: 14.sp,
            suffixTextSize: 12.sp,
            onTap: () {},
            hasMargin: false,
          ),
          ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return LocationTile(
                firstText: 'Los Angeles International',
                secText: '1 world way Los Angeles, CA 100023',
              );
            },
            separatorBuilder: (context, index) => Gap(15.h),
            itemCount: 2,
          ),
          Gap(30.h),
          SectionHeader(
            text: 'Popular Cities',
            textSize: 14.sp,
            suffixTextSize: 12.sp,
            onTap: () {},
            hasMargin: false,
          ),
          Gap(20.h),
          SizedBox(
            height: 270.h,
            child: Stack(
              children: [
                Wrap(
                  spacing: 10.w,
                  runSpacing: 10.h,
                  children: [
                    PopularCityItem(name: 'New York'),
                    PopularCityItem(name: 'New York'),
                    PopularCityItem(name: 'New York'),
                    PopularCityItem(name: 'New York'),
                  ],
                ),
                Positioned(
                  bottom: 25.h,
                  left: 0,
                  right: 0,
                  //alignment: Alignment.bottomCenter,
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                      decoration: BoxDecoration(
                        color: AppColors.kAccentPink,
                        borderRadius: BorderRadius.circular(15.sp)
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        spacing: 5.w,
                        children: [
                          Icon(Icons.map, color: AppColors.kWhite,),
                          CustomText(text: 'View on Map', fontSize: 12.sp, fontWeight: FontWeight.bold, color: AppColors.kWhite,)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Gap(30.h),
          SectionHeader(
            text: 'Nearby Rental Offices',

            textSize: 14.sp,
            suffixTextSize: 12.sp,
            onTap: () {},
            hasMargin: false,
          ),
          ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return LocationTile(
                firstText: 'Bverly Hills Center',
                secText: '2.4 miles away • Open 24/7',
                hasSuffix: false,
                iconData: FontAwesomeIcons.locationDot,
              );
            },
            separatorBuilder: (context, index) => Gap(15.h),
            itemCount: 3,
          ),
        ],
      ),
    );
  }
}

class LocationTile extends StatelessWidget {
  const LocationTile({
    super.key,
    required this.firstText,
    required this.secText,
    this.hasSuffix = true,
    this.hasDecoration = false,
    this.iconData,
  });
  final String firstText;
  final String secText;
  final bool hasSuffix;
  final bool hasDecoration;
  final IconData? iconData;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 15.w,
            children: [
              Container(
                padding: EdgeInsets.all(15.sp),
                decoration: BoxDecoration(
                  color: AppColors.kLightPink.withValues(alpha: .05),
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Icon(
                  iconData ?? FontAwesomeIcons.locationCrosshairs,
                  color: AppColors.kAccentPink,
                ),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: firstText,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                    CustomText(
                      text: secText,
                      color: AppColors.kLightPink.withValues(alpha: .8),
                      fontSize: 12.sp,
                      maxLines: 2,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (hasSuffix) Icon(Icons.navigate_next, color: AppColors.kGrey),
        ],
      ),
    );
  }
}

class CustomShortcut extends StatelessWidget {
  const CustomShortcut({super.key, required this.text, required this.icon});
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5.h,
      children: [
        Container(
          height: 50.h,
          width: 50.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.kAccentPink.withValues(alpha: .2),
            ),
          ),
          child: Icon(icon, color: AppColors.kAccentPink),
        ),
        CustomText(text: text, fontSize: 12.sp),
      ],
    );
  }
}

class PopularCityItem extends StatelessWidget {
  const PopularCityItem({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: deviceWidth(context) * .44,
      padding: EdgeInsets.only(bottom: 10.h, left: 10.w),
      decoration: BoxDecoration(
        color: AppColors.kGrey.withValues(alpha: .3),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: 'New York',
            fontSize: 13.sp,
            color: AppColors.kWhite,
            fontWeight: FontWeight.bold,
          ),
          CustomText(text: '18 Rental Sports', fontSize: 12.sp, color: AppColors.kDarkerGrey,)
        ],
      ),
    );
  }
}
