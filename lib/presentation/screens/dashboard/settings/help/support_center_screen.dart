import 'package:baba_24/core/app_route.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:baba_24/utils/nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SupportCenterScreen extends StatefulWidget {
  const SupportCenterScreen({super.key});

  @override
  State<SupportCenterScreen> createState() => _SupportCenterScreenState();
}

class _SupportCenterScreenState extends State<SupportCenterScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite.withValues(alpha: .95),
      floatingActionButton: InkWell(
        onTap: () => pushNamed(AppRoutes.liveChat),
        child: CircleAvatar(
          radius: 25.r,
          backgroundColor: AppColors.kAccentPink,
          child: Icon(Icons.message, color: AppColors.kWhite,),
        ),
      ),
      appBar: CustomAppbar(title: 'Support Center'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(15.r),
              decoration: BoxDecoration(
                color: AppColors.kWhite,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'ACTIVITY',
                    fontSize: 13.sp,
                    color: AppColors.kAccentPink.withValues(alpha: .7),
                  ),
                  Gap(3.h),
                  CustomText(
                    text: 'How can we help?',
                    fontWeight: FontWeight.bold,
                  ),
                  Gap(8.h),
                  CustomText(
                    text:
                        'You have 2 active inquiries regarding your recent rentals. Our team is working on them',
                    fontSize: 13.sp,
                    color: AppColors.kBlack.withValues(alpha: .6),
                  ),
                ],
              ),
            ),
            Gap(30.h),
            TabBar(
              controller: tabController,
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              indicatorColor: AppColors.kAccentPink,
              labelColor: AppColors.kAccentPink,

              tabs: [
                CustomText(text: 'Active', fontWeight: FontWeight.bold),
                CustomText(text: 'Closed'),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(vertical: 24.h),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(15.sp),
                        decoration: BoxDecoration(
                          color: AppColors.kWhite,
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                        child: Column(
                          spacing: 10.h,
                          children: [
                            Row(
                              spacing: 5.w,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 3.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.kAccentPink.withValues(
                                      alpha: .07,
                                    ),
                                    borderRadius: BorderRadius.circular(10.sp),
                                  ),
                                  child: CustomText(
                                    text: 'In progress',
                                    color: AppColors.kAccentPink,
                                    fontSize: 10.sp,
                                  ),
                                ),
                                CustomText(
                                  text: 'Updated 2h ago',
                                  fontSize: 10.sp,
                                  color: AppColors.kBlack.withValues(alpha: .5),
                                ),
                              ],
                            ),
                            Row(
                              spacing: 10.w,
                              children: [
                                SizedBox(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.sp),
                                    child: Image.asset(
                                      'assets/images/ferarri.png',
                                      height: 80.h,
                                      width: 80.w,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Column(
                                    spacing: 5.h,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: 'RENTAL #3333 - Damage Report',
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.bold,
                                        maxLines: 2,
                                      ),

                                      CustomText(
                                        text: 'Tesla Model3',
                                        fontSize: 10.sp,
                                        color: AppColors.kBlack.withValues(
                                          alpha: .6,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.all(10.sp),
                              decoration: BoxDecoration(
                                color: AppColors.kGrey.withValues(alpha: .06),
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                              child: Row(
                                spacing: 10.w,
                                children: [
                                  CircleAvatar(
                                    radius: 15.r,
                                    backgroundColor: AppColors.kGrey.withValues(
                                      alpha: .3,
                                    ),
                                  ),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text: 'SARAH FROM 24BABA',
                                          fontSize: 12.sp,
                                          color: AppColors.kAccentPink,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        CustomText(text:'"We are reviewing the photos you sent regarding"', fontSize: 12.sp,fontStyle: FontStyle.italic, )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Gap(10.h),
                    itemCount: 10,
                  ),
                  CustomText(text: 'Closed'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
