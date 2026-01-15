import 'package:baba_24/presentation/screens/onboard/widgets/app_button.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String imageUrl =
        "https://oui4bvk5eo1qol4e.public.blob.vercel-storage.com/cars/draft-1763901772909-935-cqjm7e04n/1764062571004-01-image.webp.jpg";
    return Scaffold(
      appBar: CustomAppbar(title: 'Confirmation', canPop: false),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
        child: SafeArea(
          child: AppButton(isLoading: false, onPressed: () {}, text: 'Done'),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 24.h),
        child: Column(
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.all(15.sp),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.kAccentPink.withValues(alpha: .2),
                  ),
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  radius: 28.r,
                  backgroundColor: AppColors.kAccentPink.withValues(alpha: .4),
                  child: CircleAvatar(
                    radius: 15.r,
                    backgroundColor: AppColors.kAccentPink,
                    child: Icon(Icons.check, color: AppColors.kWhite),
                  ),
                ),
              ),
            ),
            Gap(20.h),
            CustomText(
              text: 'Success Your ride is reserved.',
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
            Gap(10.h),
            CustomText(
              text: 'A confirmation email has been sent to',
              color: AppColors.kGrey,
              fontSize: 13.sp,
            ),
            CustomText(
              text: 'akanji67@gmail.com',
              color: AppColors.kBlack,
              fontSize: 13.sp,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.h),
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.05),
                  ),
                ],
              ),
              child: Column(
                spacing: 5.h,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    text: 'BOOKING ID',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.kGrey,
                  ),
                  Row(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: '#TRY-8845',
                        color: AppColors.kAccentPink,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                      Icon(Icons.copy_rounded),
                    ],
                  ),
                  CustomText(
                    text: 'Shopw this ID at the counter',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.kGrey,
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.05),
                  ),
                ],
              ),
              child: Column(
                children: [
                  CachedNetworkImage(
                    imageUrl: imageUrl,
                    imageBuilder: (context, imageProvider) => Container(
                      height: 150.h,
                      width: double.infinity,
                      //width: 200.w,
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.only(
                        //   topLeft: Radius.circular(20.r),
                        //   topRight: Radius.circular(20.r),
                        // ),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.sp),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: 'Tesla Model 3',
                              fontWeight: FontWeight.bold,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                CustomText(
                                  text: 'Total Price',
                                  color: AppColors.kGrey,
                                ),
                                CustomText(
                                  text: '\$345.00',
                                  color: AppColors.kAccentPink,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                          ],
                        ),
                        RowIconWidget(
                          firstText: 'PICK UP',
                          secText: 'OCT 1, 10:00am',
                          icon: Icons.calendar_month,
                        ),
                        Gap(10.h),
                        RowIconWidget(
                          firstText: 'DROP OFF',
                          secText: 'OCT 11, 10:00am',
                          icon: Icons.calendar_month,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(15.sp),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.05),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 20.h,
                children: [
                  CustomText(text: 'Rental Details', fontWeight: FontWeight.w600,),
                  RowIconWidget(
                    firstText: 'Pickup location',
                    secText: 'LAX Terminal 4',
                    icon: FontAwesomeIcons.locationDot,
                  ),
                  RowIconWidget(
                    firstText: 'Drop off location',
                    secText: 'LAX Terminal 4',
                    icon: FontAwesomeIcons.locationDot,
                  ),
                  RowIconWidget(
                    firstText: 'Pickup location',
                    secText: 'LAX Terminal 4',
                    icon: FontAwesomeIcons.flagUsa,
                  ),
                   RowIconWidget(
                    firstText: 'Insurance',
                    secText: 'Full Coverage',
                    icon: FontAwesomeIcons.c,
                  ),
                  RowIconWidget(
                    firstText: 'Payment Method',
                    secText: 'Visa ending 5467',
                    icon: Icons.card_giftcard,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RowIconWidget extends StatelessWidget {
  const RowIconWidget({
    super.key,
    required this.firstText,
    required this.secText,
    required this.icon,
  });
  final String firstText;
  final String secText;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        Icon(icon, color: AppColors.kGrey),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: firstText,
              fontSize: 10.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.kGrey,
            ),
            CustomText(
              text: secText,
              fontSize: 10.sp,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ],
    );
  }
}
