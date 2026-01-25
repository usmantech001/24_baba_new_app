import 'package:baba_24/presentation/screens/dashboard/home/home_screen.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/custom_icon.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/toggle_selector.dart';
import 'package:baba_24/presentation/widgets/custom_button.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:baba_24/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gap/gap.dart';

class SavedCarsScreen extends StatelessWidget {
   SavedCarsScreen({super.key});
  final int selectedIndex = 0;
 final List<String> filters = [
    'Price: Low to High',
    'Price: High to Low',
    'Top Rated',
    'Most Popular'
  ];
  @override
  Widget build(BuildContext context) {
    List<String> filters = ['All Saved', 'Available Now', 'Sort:Price', 'Type'];
    String imageUrl =
        "https://oui4bvk5eo1qol4e.public.blob.vercel-storage.com/cars/draft-1763901772909-935-cqjm7e04n/1764062571004-01-image.webp.jpg";
    return Scaffold(
      backgroundColor: AppColors.kWhite.withValues(alpha: .95),
      appBar: CustomAppbar(
        title: 'Favorites',
        suffix: InkWell(
          onTap: () {
            showModalBottomSheet(
              showDragHandle: true,
              backgroundColor: AppColors.kWhite,
              context: context,
              builder: (context) {
                return Container(
                  padding: EdgeInsets.all(15.sp),
                  decoration: BoxDecoration(
                    color: AppColors.kWhite,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: SafeArea(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: 'Sort By',
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                            ),
                            CustomText(
                              text: 'Reset',
                              color: AppColors.kAccentPink,
                            ),
                          ],
                        ),
                        Gap(20.h),
                        Column(children: List.generate(filters.length, (index){
                          final filter = filters[index];
                          return FilterItem(name: filter, isSelected: index==0? true : false,);
                        }),
                        ),
                        CustomButton(onPressed: (){}, text: 'Apply Selection')
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: Icon(Icons.tune),
        ),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              spacing: 15.w,
              children: List.generate(filters.length, (index) {
                return CategoryTile(
                  text: filters[index],
                  isSelected: selectedIndex == index,
                );
              }),
            ),
          ),

          Expanded(
            child: PageView(
              children: [
                ListView.separated(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 20.h,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: AppColors.kWhite,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.r),
                                    topRight: Radius.circular(20.r),
                                  ),
                                  child: SizedBox(
                                    height: 200,
                                    width: deviceWidth(context),
                                    child: Image.network(
                                      imageUrl,
                                      height: 100.h,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 10.h,
                                left: 10.w,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 5.w,
                                    vertical: 1.5,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.kWhite,
                                    borderRadius: BorderRadius.circular(6.r),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: 15.sp,
                                        color: Colors.yellow,
                                      ),
                                      CustomText(
                                        text: '4.9 (24)',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.sp,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 10.h,
                                right: 10.w,
                                child: CustomIcon(
                                  iconData: Icons.favorite,
                                  iconColor: AppColors.kAccentPink,
                                  bgColor: AppColors.kWhite,
                                ),
                              ),
                            ],
                          ),

                          Padding(
                            padding: EdgeInsets.all(10.sp),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      spacing: 5,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text: 'Tesla Model 3',
                                          fontWeight: FontWeight.bold,
                                        ),
                                        CustomText(
                                          text: 'LongeRange 2023 Electric',
                                          color: AppColors.kDarkerGrey,
                                          fontSize: 12.sp,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      spacing: 5,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        CustomText(
                                          text: '\$120',
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.kAccentPink,
                                        ),
                                        CustomText(
                                          text: "/day",
                                          color: AppColors.kDarkerGrey,
                                          fontSize: 12.sp,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Gap(5),

                                CustomButton(
                                  topPadding: 10.h,
                                  onPressed: () {},
                                  text: 'Reserve',
                                  height: 45,
                                  //bgColor: AppColors.kBlack,
                                  borderColor: Colors.transparent,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Gap(20.h),
                  itemCount: 10,
                ),
                CustomText(text: 'Used'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FilterItem extends StatelessWidget {
  const FilterItem({super.key, required this.name, this.isSelected = false});
  final bool isSelected;
  final String name; 
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15.w),
      decoration: BoxDecoration(
        color: isSelected? AppColors.kAccentPink.withValues(alpha: .03): Colors.transparent,
        borderRadius: BorderRadius.circular(15.sp),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(text: name, fontSize: 14.sp),
          Radio(
            value: true,
            groupValue: isSelected,
            onChanged: (value) {},
            activeColor: AppColors.kAccentPink,
          ),
        ],
      ),
    );
  }
}
