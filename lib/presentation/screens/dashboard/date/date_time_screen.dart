import 'package:baba_24/presentation/screens/dashboard/home/widgets/section_header.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:table_calendar/table_calendar.dart';

class DateTimeScreen extends StatefulWidget {
  const DateTimeScreen({super.key});

  @override
  State<DateTimeScreen> createState() => _DateTimeScreenState();
}

class _DateTimeScreenState extends State<DateTimeScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOn;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Select Dates',
        
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 15.w,
              children: [
                Expanded(child: SelectedDateTimeWidget()),
                Expanded(child: SelectedDateTimeWidget())
              ],
            ),
            Gap(30.h),
           SectionHeader(text: 'Date Selection', onTap: (){}, textSize: 14.sp, hasMargin: false,),
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
                  rightChevronIcon: Icon(Icons.chevron_right, color: Colors.pink),
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
           SectionHeader(text: 'Time Selection', onTap: (){}, textSize: 14.sp, hasMargin: false,),
           Gap(10.h),
            
          ],
        ),
      ),
    );


  }
}


class SelectedDateTimeWidget extends StatelessWidget {
  const SelectedDateTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.kAccentPink.withValues(alpha: .3)),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.05),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: 'PICKUP', fontSize: 10.sp, fontWeight: FontWeight.w600,),
                  Gap(7.h),
                  Row(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomText(text: 'OCT 5', fontSize: 14.sp, fontWeight: FontWeight.bold, color: AppColors.kAccentPink,),
                      CustomText(text: '10:00am', fontSize: 10.sp, fontWeight: FontWeight.w500,)
                    ],
                  )
                ],
              ),
            );
  }
}