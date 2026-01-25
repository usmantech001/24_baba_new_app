import 'package:baba_24/core/app_route.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/app_text_field.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/custom_icon.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:baba_24/utils/global.dart';
import 'package:baba_24/utils/nav.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class BookingsScreen extends StatefulWidget {
  const BookingsScreen({super.key});

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  List<String> status = ['Upcoming', 'Completed', 'Cancelled'];

  int selectedIndex = 0;

  void onTabChanged(int index) {
    selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    String imageUrl =
        "https://oui4bvk5eo1qol4e.public.blob.vercel-storage.com/cars/draft-1763901772909-935-cqjm7e04n/1764062571004-01-image.webp.jpg";
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(deviceHeight(context)*.25),
        child: Container(
          //color: Colors.red,
          padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 15.h),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: 'My Bookings',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      CustomIcon(iconData: Icons.notifications_outlined),
                    ],
                  ),
                ),
                Gap(20.h),
                SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                spacing: 10.w,
                children: List.generate(3, (index) {
                  return BookingStatusTile(
                    text: status[index],
                    isSelected: selectedIndex == index,
                    onTap: () {
                      onTabChanged(index);
                    },
                  );
                }),
              ),
            ),
            Gap(20.h),
                Padding(
                   padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: AppTextField(
                    controller: TextEditingController(),
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'Search bookings',
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
                ),
              ],
            ),
          ),
        ),
      ),

      body: ListView.separated(
        shrinkWrap: true,

        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 0.h),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => pushNamed(AppRoutes.modifyBooking),
            child: Container(
              decoration: BoxDecoration(color: AppColors.kGrey.withValues(alpha: .07),
              borderRadius: BorderRadius.circular(15.r),
              
              ),
              child: Column(
                children: [
                  Row(
                    spacing: 10.w,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        spacing: 3.h,
                        children: [
                          CachedNetworkImage(
                            imageUrl: imageUrl,
                            height: 80,
                            imageBuilder: (context, imageProvider) => Container(
                              height: 80.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15.r), bottomRight: Radius.circular(15.r))
                              ),
                            ),
                          ),
              
                          CustomText(text: '#BK-25252', color: AppColors.kGrey, fontSize: 14.sp,)
                        ],
                      ),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(text: 'Mercedes G63', fontSize: 15.sp, fontWeight: FontWeight.w600, maxLines: 1,),
                                  CustomText(text: 'Sun, 4 Jan 2 Days', fontSize: 13.sp, fontWeight: FontWeight.w400, color: AppColors.kDarkerGrey,),
                                  Gap(10.h),
                                  RichText(text: TextSpan(
                                    text: 'AED 6,000',
                                    style: customTextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                                    children: [
                                      TextSpan(
                                        text: ' (Total)',
                                        style: customTextStyle(color: AppColors.kGrey, fontSize: 12.sp)
                                      )
                                    ]
                                  )),
                                  Gap(5.h),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3.h),
                                    decoration: BoxDecoration(
                                      color: AppColors.kAccentGreen.withValues(alpha: .05),
                                      borderRadius: BorderRadius.circular(5.r)
                                    ),
                                    child: CustomText(text: 'Confirmed', fontSize: 10.sp,color: Colors.green,),
                                  )
                                ],
                              ),
                              Icon(Icons.navigate_next)
                            ],
                          ),
                        ),
                      ),
                       
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => Gap(20.h),
        itemCount: 20,
      ),
    );
  }
}

class BookingStatusTile extends StatelessWidget {
  const BookingStatusTile({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  final bool isSelected;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 5.h),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.kAccentPink
              : AppColors.kGrey.withValues(alpha: .3),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          spacing: 10.w,
          children: [
           // if (isSelected) Icon(Icons.done, color: AppColors.kWhite),
            CustomText(
              text: text,
              color: isSelected ? AppColors.kWhite : AppColors.kBlack,
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
            ),
          ],
        ),
      ),
    );
  }
}
