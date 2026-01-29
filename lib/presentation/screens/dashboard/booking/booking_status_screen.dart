import 'package:baba_24/core/app_route.dart';
import 'package:baba_24/presentation/screens/dashboard/cars/price_details_screen.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/custom_icon.dart';
import 'package:baba_24/presentation/widgets/custom_button.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:baba_24/utils/global.dart';
import 'package:baba_24/utils/nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class BookingStatusScreen extends StatelessWidget {
  const BookingStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(15.sp),
        child: SafeArea(child: Row(
          spacing: 10.w,
          children: [
            Expanded(child: CustomButton(onPressed: ()=> pushNamed(AppRoutes.modifyBooking), text: 'Extend Trip', topPadding: 0, borderColor: AppColors.kAccentPink, textColor: AppColors.kAccentPink, bgColor: AppColors.kWhite,)),
             Expanded(child: CustomButton(onPressed: (){}, text: 'Support', topPadding: 0,))
          ],
        )),
      ),
      backgroundColor: AppColors.kWhite.withValues(alpha: .95),
      appBar: CustomAppbar(title: 'Booking Status'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          spacing: 20.h,
          children: [
            BookingStatusStepper(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
              decoration: BoxDecoration(
                color: AppColors.kAccentPink.withValues(alpha: .03),
                borderRadius: BorderRadius.circular(10.sp),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 5.w,
                children: [
                  Icon(
                    Icons.info,
                    color: AppColors.kLightPink.withValues(alpha: .7),
                  ),
                  CustomText(
                    text: 'Your rental is currently active. Drive safe!',
                    fontSize: 12.sp,
                    color: AppColors.kAccentPink,
                  ),
                ],
              ),
            ),
            CarDetailsCard(),
             Periodcard(),
             Container(
              width: double.infinity,
              padding: EdgeInsets.all(15.sp),
              decoration: BoxDecoration(
                color: AppColors.kWhite,
                borderRadius: BorderRadius.circular(15.sp),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10.h,
                children: [
                  CustomText(
                    text: 'PRICE BREAKDOWN',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.kAccentPink,
                  ),
                  PriceBreakdownItem(text: 'BASE RENTAL (3 DAYS)', price: '500', hasDivider: false, hasMargin: false, textFontWeight: FontWeight.w500,),
                  PriceBreakdownItem(text: 'Insurance & Fees', price: '50', hasDivider: false, hasMargin: false,),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(text: 'Total Paid', fontWeight: FontWeight.w600,),
                      CustomText(text: '\$550', fontWeight: FontWeight.bold, color: AppColors.kAccentPink, fontSize: 20.sp,)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
class Periodcard extends StatelessWidget {
  const Periodcard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
              width: double.infinity,
              padding: EdgeInsets.all(15.sp),
              decoration: BoxDecoration(
                color: AppColors.kWhite,
                borderRadius: BorderRadius.circular(15.sp),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10.h,
                children: [
                  CustomText(
                    text: 'RENTAL PERIOD',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.kAccentPink,
                  ),
                  PeriodItem(),
                  PeriodItem()
                ],
              ),
            );
  }
}
class PeriodItem extends StatelessWidget {
  const PeriodItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10.w,
      children: [
        CustomIcon(
          iconData: FontAwesomeIcons.calendar,
          bgColor: AppColors.kAccentPink.withValues(alpha: .04),
          iconSize: 15.sp,
          iconColor: AppColors.kAccentPink,
        ),
        Column(
          spacing: 2.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "Pick-Up",
              fontSize: 12.sp,
              color: AppColors.kAccentPink,
            ),
            CustomText(text: 'Oct 24, 10:00AM', fontWeight: FontWeight.w500),
            CustomText(
              text: 'Downtown Hub, Los Angeles',
              fontSize: 12.sp,
              color: AppColors.kDarkerGrey,
            ),
          ],
        ),
      ],
    );
  }
}

class CarDetailsCard extends StatelessWidget {
  const CarDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    String imageUrl =
        "https://oui4bvk5eo1qol4e.public.blob.vercel-storage.com/cars/draft-1763901772909-935-cqjm7e04n/1764062571004-01-image.webp.jpg";
    return Container(
      decoration: BoxDecoration(
        color: AppColors.kWhite,
        borderRadius: BorderRadius.circular(15.sp),
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
                top: 10.h,
                left: 10.w,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.kAccentPink,
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  child: CustomText(
                    text: 'PREMIUM',
                    fontSize: 10.sp,
                    color: AppColors.kWhite,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(15.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: 15.w,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: 'Tesla Model 3',
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp,
                          ),
                          CustomText(
                            text: 'Dual Motor Performance • 2024',
                            fontSize: 12.sp,
                            color: AppColors.kAccentPink.withValues(alpha: .6),
                          ),
                        ],
                      ),
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomText(
                          text: 'PLATE',
                          fontSize: 12.sp,
                          color: AppColors.kAccentPink.withValues(alpha: .6),
                        ),
                        CustomText(
                          text: 'BABA-2401',
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                        ),
                      ],
                    ),
                  ],
                ),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Divider(color: AppColors.kGrey.withValues(alpha: .2)),
                ),
                ChargeDistanceInfo(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChargeDistanceInfo extends StatelessWidget {
  const ChargeDistanceInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16.w,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildItem(icon: Icons.flash_on, text: "85% Charge"),

        _buildItem(icon: Icons.location_on, text: "14.2k mi"),
      ],
    );
  }
}

Widget _buildItem({required IconData icon, required String text}) {
  return Row(
    children: [
      Icon(icon, size: 16, color: Colors.pinkAccent),
      const SizedBox(width: 4),
      Text(
        text,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
    ],
  );
}

class BookingStatusStepper extends StatelessWidget {
  const BookingStatusStepper({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildStep(icon: Icons.check, label: "CONFIRMED", isActive: true),
        _buildLine(isActive: true),
        _buildStep(icon: Icons.directions_car, label: "ACTIVE", isActive: true),
        _buildLine(isActive: false),
        _buildStep(icon: Icons.flag, label: "COMPLETED", isActive: false),
      ],
    );
  }

  Widget _buildStep({
    required IconData icon,
    required String label,
    required bool isActive,
  }) {
    final color = isActive ? const Color(0xFFFF5C8D) : Colors.grey.shade300;

    return Column(
      children: [
        Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: color,
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }

  Widget _buildLine({required bool isActive}) {
    return Container(
      width: 40,
      height: 2,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      color: isActive ? const Color(0xFFFF5C8D) : Colors.grey.shade300,
    );
  }
}
