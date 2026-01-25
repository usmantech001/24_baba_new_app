import 'package:baba_24/core/app_route.dart';
import 'package:baba_24/presentation/screens/dashboard/home/widgets/car_home_tile.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/app_text_field.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:baba_24/utils/nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: Container(
          color: AppColors.kAccentPink,
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 5.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.kWhite.withValues(alpha: .2),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Row(
                        spacing: 5.w,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.calendar_today,
                            color: AppColors.kWhite,
                            size: 20.sp,
                          ),
                          CustomText(
                            text: '15 Jan - 17 Jan 1 day',
                            color: AppColors.kWhite,
                            fontSize: 12.sp,
                          ),
                          RotatedBox(
                            quarterTurns: -1,
                            child: Icon(
                              Icons.navigate_before,
                              color: AppColors.kWhite,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 5.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.kWhite.withValues(alpha: .2),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Row(
                        spacing: 2.w,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomText(
                            text: 'Dubai',
                            color: AppColors.kWhite,
                            fontSize: 12.sp,
                          ),
                          RotatedBox(
                            quarterTurns: -1,
                            child: Icon(
                              Icons.navigate_before,
                              color: AppColors.kWhite,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Gap(20.h),
                Row(
                  spacing: 10.w,
                  children: [
                    Expanded(
                      child: AppTextField(
                        controller: TextEditingController(),
                        decoration: InputDecoration(
                          isDense: true,
                          filled: true,
                          hintText: 'Search cars',
                          prefixIcon: Icon(Icons.search),
                          fillColor: AppColors.kWhite,
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
                    ),
                    InkWell(
                      onTap: () => pushNamed(AppRoutes.filter),
                      child: Icon(Icons.tune, color: AppColors.kWhite,))
                  ],
                ),
                
                // Gap(10.h),
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(
                //     spacing: 10.w,
                //     children: [
                //       CustomFilter(text: 'Price'),
                //       CustomFilter(text: 'Luxury'),
                //       CustomFilter(text: 'Convertible'),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MediaQuery.removePadding(
              context: context,
              removeTop: true,
              removeBottom: true,
              child: GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5.w,
                  mainAxisSpacing: 10.h,
                  childAspectRatio: 0.57,
                ),
                itemBuilder: (context, index) {
                  return CarHomeTile();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomFilter extends StatelessWidget {
  const CustomFilter({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: AppColors.kWhite.withValues(alpha: .2),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        spacing: 2.w,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(
            text: text,
            color: AppColors.kWhite,
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
          ),
          RotatedBox(
            quarterTurns: -1,
            child: Icon(Icons.navigate_before, color: AppColors.kWhite),
          ),
        ],
      ),
    );
  }
}
