import 'package:baba_24/presentation/screens/onboard/widgets/app_text_field.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
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

  void onTabChanged(int index){
    selectedIndex = index;
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: Container(
          //color: Colors.red,
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Center(
                  child: CustomText(
                    text: 'My Bookings',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Gap(20.h),
                AppTextField(
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
              ],
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
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
          ],
        ),
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
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.kAccentPink
              : AppColors.kGrey.withValues(alpha: .3),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          spacing: 10,
          children: [
            if (isSelected) Icon(Icons.done, color: AppColors.kWhite),
            CustomText(
              text: text,
              color: isSelected ? AppColors.kWhite : AppColors.kBlack,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
      ),
    );
  }
}
