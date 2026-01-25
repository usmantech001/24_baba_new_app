import 'package:baba_24/presentation/screens/dashboard/home/home_screen.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
import 'package:baba_24/presentation/widgets/custom_button.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class AllRewardsScreen extends StatelessWidget {
  const AllRewardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> filters = ['All', 'Services', 'Discount', 'Fuel'];
    return Scaffold(
      backgroundColor: AppColors.kWhite.withValues(alpha: .95),
      appBar: CustomAppbar(title: 'Rewards Shop'),
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10.h,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Redeem your ',
                        style: customTextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                        ),
                        children: [
                          TextSpan(
                            text: 'Perks',
                            style: customTextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.kAccentPink,
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustomText(
                      text:
                          'Choose from our curated selection of member benefits',
                      fontSize: 14.sp,
                      color: AppColors.kDarkerGrey,
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                child: Row(
                  spacing: 20.w,
                  children: List.generate(filters.length, (index) {
                    return CategoryTile(
                      text: filters[index],
                      isSelected: index == 0,
                    );
                  }),
                ),
              ),
            ],
          ),
          Expanded(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              removeBottom: true,
              child: GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                physics: const BouncingScrollPhysics(),
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5.w,
                  mainAxisSpacing: 10.h,
                  childAspectRatio: 0.6,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: AppColors.kWhite,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.r),
                            topRight: Radius.circular(20.r),
                          ),
                          child: Image.asset(
                            'assets/images/ferarri.png',
                            height: 170.h,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 10.h,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: 'Premium Car Washdddddd',
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                                maxLines: 1,
                                textOverflow: TextOverflow.ellipsis,
                              ),
                              CustomText(
                                text: '500 pts',
                                fontSize: 12.sp,
                                color: AppColors.kAccentPink,
                              ),
                              Gap(10),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 8.h),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: AppColors.kAccentPink,
                                  borderRadius: BorderRadius.circular(15.r)
                                ),
                                alignment: Alignment.center,
                                child: CustomText(text: 'Get Reward', fontSize: 12.sp,color: AppColors.kWhite,),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
