import 'package:baba_24/core/app_route.dart';
import 'package:baba_24/presentation/screens/dashboard/home/widgets/car_home_tile.dart';
import 'package:baba_24/presentation/screens/dashboard/home/widgets/section_header.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/app_button.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/app_text_field.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/custom_icon.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:baba_24/utils/global.dart';
import 'package:baba_24/utils/nav.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  final int selectedCategoryIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<String> categories = ["All", "Sedan", "SUV", "Hatchback", "Coupe", "Luxury"];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            //color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.6,
                  child: Row(
                    spacing: 10.w,
                    children: [
                      CircleAvatar(backgroundColor: AppColors.kGrey.withValues(alpha: .09),),
                      Flexible(
                        // color: Colors.red,
                        //width: MediaQuery.sizeOf(context).width * 0.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: 'Dubai, UAE',
                              textOverflow: TextOverflow.ellipsis,
                              fontSize: 12.sp,
                            ),
                            CustomText(
                              text: 'Ready for a road trip?',
                              textOverflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp,
                            ),
                          ],
                        ),
                      ),
                      
                    ],
                  ),
                ),
                CustomIcon(iconData: Icons.notifications_outlined),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        // padding: EdgeInsets.symmetric(vertical: 15.h),
        child: Column(
          children: [
            SizedBox(
              height: 400.h,
              // color: Colors.red,
              //height: deviceHeight(context) * 35,
              child: Stack(
                children: [
                  Image.asset('assets/images//ferarri.png'),

                  Positioned(
                    bottom: 0,
                    right: 15.w,
                    left: 15.w,
                    child: Container(
                      // height: 200.h,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 20.h,
                      ),
                      // margin: EdgeInsets.symmetric(horizontal: 30),
                      width: deviceWidth(context),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(3, 3),
                            color: Colors.grey.withValues(alpha: .2),
                          ),
                          BoxShadow(
                            offset: Offset(-3, -3),
                            color: Colors.grey.withValues(alpha: .2),
                          ),
                        ],
                      ),
                      child: Column(
                        spacing: 10,
                        children: [
                          HomeSelector(
                            icon: FontAwesomeIcons.locationDot,
                            title: 'PICK UP YOUR LOCATION',
                            value: 'Where are you going ?',
                            onTap: () {
                               pushNamed(AppRoutes.location);
                            },
                          ),
                          Row(
                            spacing: 10.w,
                            children: [
                              Expanded(
                                child: HomeSelector(
                                  icon: Icons.calendar_month,
                                  title: 'START DATE',
                                  value: 'OCT 12, 10:00',
                                  valueColor: AppColors.kBlack,
                                  onTap: () {
                                    pushNamed(AppRoutes.dateTime);
                                  },
                                ),
                              ),
                              Expanded(
                                child: HomeSelector(
                                  icon: Icons.calendar_month,
                                  title: 'END DATE',
                                  value: 'OCT 12, 10:00',
                                  valueColor: AppColors.kBlack,
                                  onTap: () {
                                     pushNamed(AppRoutes.dateTime);
                                  },
                                ),
                              ),
                            ],
                          ),
                          AppButton(
                            isLoading: false,
                            onPressed: () {},
                            text: 'Search your perfect ride',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            /*
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                spacing: 10.w,
                children: [
                  Expanded(
                    child: AppTextField(
                      controller: TextEditingController(),
                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'Search cars, brands....',
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
                  ),

                  Container(
                    height: 50.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                      color: AppColors.kAccentPink,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Icon(Icons.tune, color: AppColors.kWhite),
                  ),
                ],
              ),
            ),
            */
            Gap(40.h),
            SectionHeader(text: 'Categories', onTap: () => null),
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 10,
                children: List.generate(categories.length, (index) {
                  return CategoryTile(text: categories[index], isSelected: selectedCategoryIndex == index,);
                }),
              ),
            ),
            // SectionHeader(text: 'All Brands', onTap: () => null),
            // SingleChildScrollView(
            //   padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
            //   physics: const BouncingScrollPhysics(),
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //     spacing: 10,
            //     children: List.generate(10, (index) {
            //       return SizedBox(
            //         width: 50.w,
            //         child: Column(
            //           spacing: 8,
            //           children: [
            //             CircleAvatar(
            //               child: Image.asset('assets/images/bmw_logo.png'),
            //             ),
            //             CustomText(text: 'BMW', maxLines: 2, fontSize: 12),
            //           ],
            //         ),
            //       );
            //     }),
            //   ),
            // ),
            Gap(20.h),
            SectionHeader(
              text: 'Smart Picks',
              shortDesc: 'Premium Cars at great prices',
              onTap: () => null,
            ),
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 10,
                children: List.generate(5, (index) {
                  return CarHomeTile();
                }),
              ),
            ),

            Gap(20.h),
            SectionHeader(
              text: 'Electric Cars',
              shortDesc: 'Eco-friendly and modern electric vehicles',
              onTap: () => null,
            ),
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 10,
                children: List.generate(5, (index) {
                  return CarHomeTile();
                }),
              ),
            ),
            Gap(20.h),
            SectionHeader(
              text: 'Business Class Cars',
              shortDesc: 'Professional vehicles for business and comfort',
              onTap: () => null,
            ),
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 10,
                children: List.generate(5, (index) {
                  return CarHomeTile();
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeSelector extends StatelessWidget {
  const HomeSelector({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    this.valueColor,
    required this.onTap,
  });
  final IconData icon;
  final String title;
  final String value;
  final Color? valueColor;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: AppColors.kGrey.withValues(alpha: .1),
          border: Border.all(color: AppColors.kGrey.withValues(alpha: .5)),
          borderRadius: BorderRadius.circular(10.r),
        ),
      
        child: Row(
          spacing: 10.w,
          children: [
            Icon(icon, color: AppColors.kAccentPink, size: 15.sp),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: title,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.kAccentPink,
                ),
                CustomText(
                  text: value,
                  color: valueColor ?? AppColors.kLightPink.withValues(alpha: .5),
                  fontSize: 11.sp,
                  fontWeight: valueColor != null
                      ? FontWeight.w600
                      : FontWeight.w400,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  const CategoryTile({super.key, required this.text, this.isSelected = false});
  final String text;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
     // alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: isSelected? AppColors.kAccentPink: AppColors.kGrey.withValues(alpha: .1),
        borderRadius: BorderRadius.circular(15.r),
        
      ),
      child: CustomText(text: text, color: isSelected? AppColors.kWhite : AppColors.kBlack, fontSize: 13.sp,) ,
    );
  }
}
