import 'package:baba_24/presentation/screens/dashboard/home/widgets/section_header.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
import 'package:baba_24/presentation/widgets/custom_button.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:table_calendar/table_calendar.dart';

class ModifyBookingScreen extends StatefulWidget {
  const ModifyBookingScreen({super.key});

  @override
  State<ModifyBookingScreen> createState() => _ModifyBookingScreenState();
}

class _ModifyBookingScreenState extends State<ModifyBookingScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOn;
  @override
  Widget build(BuildContext context) {
    String imageUrl =
        "https://oui4bvk5eo1qol4e.public.blob.vercel-storage.com/cars/draft-1763901772909-935-cqjm7e04n/1764062571004-01-image.webp.jpg";
    return Scaffold(
      backgroundColor: AppColors.kWhite.withValues(alpha: .95),
      appBar: CustomAppbar(title: 'Modify Booking'),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 15.w),
        child: SafeArea(child: CustomButton(onPressed: (){}, text: 'Confirm Changes')),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 50.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(text: 'Booking Summary'),
            Gap(10.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),

              decoration: BoxDecoration(
                color: AppColors.kWhite,
                borderRadius: BorderRadius.circular(10.sp),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    spacing: 6.h,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'CURRENT VEHICLE',
                        color: AppColors.kAccentPink,
                        fontSize: 12.sp,
                      ),
                      CustomText(
                        text: 'TOYOTA CAMRY 2024',
                        color: AppColors.kBlack,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      CustomText(
                        text: 'Booking ID:4B-104',
                        color: AppColors.kAccentPink,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w200,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 3.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.kAccentPink.withValues(alpha: .06),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.swap_horiz,
                              color: AppColors.kAccentPink,
                            ),
                            CustomText(
                              text: 'Swap Vehicle',
                              fontSize: 10.sp,
                              color: AppColors.kAccentPink,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  CachedNetworkImage(
                    imageUrl: imageUrl,
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        height: 100,
                        width: 100.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Gap(30.h),
            SectionHeader(
              text: 'SELECT DATES',
              onTap: () {},
              textSize: 14.sp,
              hasMargin: false,
            ),
            Gap(10.h),
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
              child: TableCalendar(
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: _focusedDay,

                rangeStartDay: _rangeStart,
                rangeEndDay: _rangeEnd,
                rangeSelectionMode: _rangeSelectionMode,

                headerStyle: const HeaderStyle(
                  titleCentered: true,
                  formatButtonVisible: false,
                  leftChevronIcon: Icon(Icons.chevron_left, color: Colors.pink),
                  rightChevronIcon: Icon(
                    Icons.chevron_right,
                    color: Colors.pink,
                  ),
                ),

                calendarStyle: CalendarStyle(
                  outsideDaysVisible: false,

                  rangeHighlightColor: Colors.pink.shade100,

                  withinRangeDecoration: BoxDecoration(
                    color: Colors.pink.shade100,
                    shape: BoxShape.rectangle,
                  ),

                  rangeStartDecoration: const BoxDecoration(
                    color: Colors.pink,
                    shape: BoxShape.circle,
                  ),

                  rangeEndDecoration: const BoxDecoration(
                    color: Colors.pink,
                    shape: BoxShape.circle,
                  ),

                  selectedDecoration: const BoxDecoration(
                    color: Colors.pink,
                    shape: BoxShape.circle,
                  ),

                  todayDecoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                ),

                onRangeSelected: (start, end, focusedDay) {
                  setState(() {
                    _rangeStart = start;
                    _rangeEnd = end;
                    _focusedDay = focusedDay;
                  });
                },

                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                },
              ),
            ),
            Gap(30.h),
            SectionHeader(
              text: 'SELECT TIMES',
              onTap: () {},
              textSize: 14.sp,
              hasMargin: false,
            ),
            Gap(10.h),
            Row(
              spacing: 20.w,
              children: [
                Expanded(
                  child: TimePicker(
                    text: 'PICK-UP',
                    time: '10:00 AM',
                    onTap: () {
                      showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              timePickerTheme: TimePickerThemeData(
                                backgroundColor: Colors.white,
                                hourMinuteTextColor: Colors.white,
                                dialHandColor: AppColors.kAccentPink,
                                //dialBackgroundColor: Colors.grey.shade900,
                                entryModeIconColor: AppColors.kAccentPink,
                              ),
                              colorScheme: ColorScheme.light(
                                primary:
                                    AppColors.kAccentPink, // main accent color
                                onPrimary: Colors.black,
                                surface: AppColors.kDarkerGrey.withValues(
                                  alpha: .7,
                                ),
                                onSurface: Colors.white,
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );
                    },
                  ),
                ),
                Expanded(
                  child: TimePicker(
                    text: 'DROP-OFF',
                    time: '10:00 AM',
                    onTap: () => null,
                  ),
                ),
              ],
            ),
            Gap(20.h),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),

              decoration: BoxDecoration(
                color: AppColors.kAccentPink.withValues(alpha: .05),
                borderRadius: BorderRadius.circular(15.sp)
              ),
              child: Row(
                spacing: 10.w,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.timelapse, color: AppColors.kAccentPink,),
                  CustomText(
                    text: 'Extend Rental',
                    fontWeight: FontWeight.bold,
                    color: AppColors.kAccentPink,
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

class TimePicker extends StatelessWidget {
  const TimePicker({
    super.key,
    required this.text,
    required this.time,
    required this.onTap,
  });
  final String text;
  final String time;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10.sp),
        decoration: BoxDecoration(
          color: AppColors.kWhite,
          borderRadius: BorderRadius.circular(15.sp),
        ),
        child: Column(
          spacing: 5.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(text: text, fontSize: 10.sp, color: AppColors.kGrey),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //spacing: 5.w,
              children: [
                CustomText(
                  text: time,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
                RotatedBox(
                  quarterTurns: -1,
                  child: Icon(Icons.navigate_before, color: AppColors.kAccentPink)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
