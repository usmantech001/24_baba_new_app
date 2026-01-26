import 'package:baba_24/core/app_route.dart';
import 'package:baba_24/data/controller/booking/booking_controller.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/app_text_field.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
import 'package:baba_24/presentation/widgets/custom_button.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:baba_24/utils/nav.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class BookingInfoScreen extends StatelessWidget {
  const BookingInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bookingController = context.watch<BookingController>();

    return Scaffold(
      backgroundColor: AppColors.kWhite.withValues(alpha: .97),
      appBar: CustomAppbar(title: 'Booking Info'),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomButton(
                topPadding: 10,
                onPressed: () {
                if(bookingController.bookingInfoIndex == 2){
                  removeAllAndPushScreen(AppRoutes.bookingAppreciation);
                }else{
                  bookingController.onBookingInfoPageChange(bookingController.bookingInfoIndex+1);
                }
                
              }, text: bookingController.bookingInfoIndex==0? 'Next' : bookingController.bookingInfoIndex==1? 'Continue' : 'Confirm Booking'
              ),
              CustomButton(
                topPadding: 20,
              bgColor: AppColors.kWhite,
              textColor: AppColors.kBlack,
              borderColor: Colors.grey,
                onPressed: () {
                 bookingController.onBookingInfoPageChange(bookingController.bookingInfoIndex-1);
              }, text: 'Back'
              ),
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: List.generate(3, (index){
                return Container(
                  height: 3.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                   // color: bookingController.bookingInfoIndex=index? AppColors.kAccentPink : Colors.red
                  ),
                );
              }),
            )
            /*
             SmoothPageIndicator(
              controller: bookingController.pageController,
              count: 3,
              effect: WormEffect(
                activeDotColor: AppColors.kAccentPink,
                dotHeight: 8,
              ),
            ),
            */
          ),
          Gap(10.h),
         // CustomText(text: 'Step ${bookingController.bookingInfoIndex +1} of 3'),
          Expanded(
            child: PageView(
              controller: bookingController.pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index) {

                bookingController.onBookingInfoPageChange(index);
              },
              children: [
                BookingLocationDetails(),
                BookingCustomerDetails(),
                BookingIdentityDetails(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BookingIdentityDetails extends StatelessWidget {
  const BookingIdentityDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 24.h),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.w, horizontal: 10.w),
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(blurRadius: 10, color: Colors.white)],
          borderRadius: BorderRadius.circular(20.r),
          color: AppColors.kWhite,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 10.w,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.info_outline,
                  color: AppColors.kBlack.withValues(alpha: .6),
                ),
                Flexible(
                  child: CustomText(
                    text:
                        'Ensure documents are clear and valid. Passport required for international bookings. Emirates ID optional.',
                    fontSize: 12.sp,
                    color: AppColors.kDarkerGrey,
                  ),
                ),
              ],
            ),
            Gap(20.h),
            CustomText(text: 'Driver\'s License', fontSize: 14.sp),
            Gap(10.h),
            Column(
              spacing: 15.h,
              children: [
                CustomDottedContainer(text: 'Front Side', onTap: () {}),
                CustomDottedContainer(text: 'Back Side', onTap: () {}),
              ],
            ),
            Gap(20.h),
            CustomText(text: 'Passport', fontSize: 14.sp),
            Gap(10.h),
            CustomDottedContainer(text: 'Photo Page', onTap: () {}),
             Gap(20.h),
            CustomText(text: 'Emirates ID (Optional)', fontSize: 14.sp, color: AppColors.kDarkerGrey,),
            Gap(10.h),
            Column(
              spacing: 15.h,
              children: [
                CustomDottedContainer(text: 'Front Side', onTap: () {}, isRequired: false,),
                CustomDottedContainer(text: 'Back Side', onTap: () {}, isRequired: false,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDottedContainer extends StatelessWidget {
  const CustomDottedContainer({
    super.key,
    required this.text,
    this.isRequired = true,
    required this.onTap,
  });

  final String text;
  final bool isRequired;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: DottedBorder(
        options: RoundedRectDottedBorderOptions(
          radius: Radius.circular(10),
          color: AppColors.kGrey,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Row(
            spacing: 15.w,
            children: [
              Row(
                children: [
                  Icon(Icons.camera_alt_outlined, color: AppColors.kDarkerGrey),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: text, fontSize: 12.sp),
                  CustomText(
                    text: isRequired
                        ? 'Required • Max 1 MB'
                        : 'Optional • Max 1 MB',
                    fontSize: 12.sp,
                    color: AppColors.kDarkerGrey,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BookingCustomerDetails extends StatelessWidget {
  const BookingCustomerDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 0.h),
      child: Container(
        // padding: EdgeInsets.symmetric(vertical: 15.w, horizontal: 10.w),
        // decoration: BoxDecoration(
        //   boxShadow: [BoxShadow(blurRadius: 10, color: Colors.white)],
        //   borderRadius: BorderRadius.circular(20.r),
        //   color: AppColors.kWhite,
        // ),
        child: Column(
          spacing: 10.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: 'Personal Details',
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
            ),
          
            Column(
              spacing: 15.h,
              children: [
                Row(
                  spacing: 10.w,
                  children: [
                    Expanded(
                      child: AppTextField(
                        controller: TextEditingController(),
                        label: 'First Name',
                      ),
                    ),
                    Expanded(
                      child: AppTextField(
                        controller: TextEditingController(),
                        label: 'Last Name',
                      ),
                    ),
                  ],
                ),
                AppTextField(
                  controller: TextEditingController(),
                  label: 'Date of birth',
                  readOnly: true,
                  
                ),
                
               
              ],
            ),
            Gap(10.h),
            CustomText(
              text: 'Contact Info',
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
            ),
            
            Column(
              spacing: 15.h,
              children: [
                AppTextField(
                  controller: TextEditingController(),
                  label: 'Email Address',
                ),
                AppTextField(
                  controller: TextEditingController(),
                  label: 'Mobile Number',
                ),
                
                
               
              ],
            ),
            Gap(10.h),
            CustomText(
              text: 'Liscense Information',
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
            ),
            
            Column(
              spacing: 15.h,
              children: [
                Container(
                  padding: EdgeInsets.all(15.sp),
                  decoration: BoxDecoration(
                    color: AppColors.kWhite,
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(
                      color: AppColors.kAccentPink.withValues(alpha: .2),
                      
                    )
                  ),
                  child: Row(
                    spacing: 10.w,
                    children: [
                      Icon(Icons.info, color: AppColors.kAccentPink,),
                      Flexible(child: CustomText(text: 'Please ensure the name on your liscense matches the name entered above', fontSize: 12.sp, color: AppColors.kAccentPink.withValues(alpha: .6),))
                    ],
                  ),
                ),
                AppTextField(
                  controller: TextEditingController(),
                  label: 'Liscense Number',
                ),
                AppTextField(
                  controller: TextEditingController(),
                  label: 'Issuing Country / State',
                  readOnly: true,
                ),
                
                
               
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BookingLocationDetails extends StatelessWidget {
  const BookingLocationDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 24.h),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.w, horizontal: 10.w),
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(blurRadius: 10, color: Colors.white)],
          borderRadius: BorderRadius.circular(20.r),
          color: AppColors.kWhite,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            CustomText(
              text: 'Pick-up & Drop-off Dates',
              fontWeight: FontWeight.w600,
            ),
            Gap(10.h),
            CustomText(
              text:
                  'Select your pickup and drop-off dates using the range calendar below',
              fontSize: 12.sp,
              color: AppColors.kBlack.withValues(alpha: .5),
            ),
            Gap(20.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: AppColors.kWhite,
                borderRadius: BorderRadius.circular(10),
              ),
              width: double.infinity,
              child: Row(
                spacing: 10.w,
                children: [
                  Icon(Icons.calendar_month_outlined, color: AppColors.kGrey),
                  CustomText(
                    text: 'Jan 14, 02:09AM - Jan 24, 05:12AM',
                    fontSize: 13.sp,
                  ),
                ],
              ),
            ),
            Gap(20.h),
            BookingInfoSelector(
              firstText: 'Bring the car to me',
              secText: 'Select delivery address',
            ),
            Gap(20.h),
            BookingInfoSelector(
              firstText: 'Bring the car to me',
              secText: 'Select delivery address',
            ),
            Gap(20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: 'Return to the same location',
                  fontSize: 14.sp,
                ),
                Transform.scale(
                  alignment: Alignment.centerRight,
                  scale: 0.8,
                  child: Switch(
                    value: true,
                    activeColor: AppColors.kWhite,
                    activeTrackColor: AppColors.kLightPink,
                    onChanged: (value) {
                      // showSnackBar(context, 'Light mode is coming soon');
                      return;
                    },
                  ),
                ),
              ],
            ),
            Divider(color: AppColors.kGrey.withValues(alpha: .5)),
            Gap(10.h),
            Column(
              spacing: 10.h,
              children: [
                SummaryItem(
                  text: 'Rental price for 10 days',
                  value: '\$30,000',
                ),
                SummaryItem(text: '5% Discount', value: '-\$3000'),
                SummaryItem(
                  text: 'Rental price for 10 days',
                  value: '\$25,000',
                  valueSize: 15.sp,
                  valueColor: AppColors.kAccentPink,
                  fontWeight: FontWeight.w700,
                ),
                SummaryItem(text: '10 days × \$208', value: '=\$2,000'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SummaryItem extends StatelessWidget {
  const SummaryItem({
    super.key,
    required this.text,
    required this.value,
    this.textColor,
    this.valueColor,
    this.valueSize,
    this.fontWeight,
  });
  final String text;
  final String value;
  final Color? textColor;
  final Color? valueColor;
  final double? valueSize;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: text,
          fontSize: 12.sp,
          color: textColor ?? AppColors.kBlack.withValues(alpha: .5),
        ),
        CustomText(
          text: value,
          fontSize: valueSize ?? 12.sp,
          color: valueColor ?? AppColors.kBlack.withValues(alpha: .5),
          fontWeight: fontWeight ?? FontWeight.w400,
        ),
      ],
    );
  }
}

class BookingInfoSelector extends StatelessWidget {
  const BookingInfoSelector({
    super.key,
    required this.firstText,
    required this.secText,
  });

  final String firstText;
  final String secText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.kAccentPink),
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.kWhite,
      ),
      child: Row(
        spacing: 10.w,
        children: [
          Icon(
            FontAwesomeIcons.locationDot,
            color: AppColors.kAccentPink,
            size: 20.sp,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 2.h,
            children: [
              CustomText(
                text: firstText,
                color: AppColors.kAccentPink,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              CustomText(
                text: secText,
                color: AppColors.kAccentPink,
                fontSize: 12.sp,
                fontWeight: FontWeight.w300,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
