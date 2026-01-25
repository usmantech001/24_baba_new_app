import 'package:baba_24/presentation/screens/dashboard/home/home_screen.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class SupportFaqScreen extends StatelessWidget {
  const SupportFaqScreen({super.key});
  final int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<String> filters = ['All', 'Booking', 'Payments'];
    return Scaffold(
      backgroundColor: AppColors.kWhite.withValues(alpha: .95),
      appBar: CustomAppbar(title: 'Support & FAQ'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 15.w,),
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
            child: ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
              itemBuilder: (context, index) {
                return Column(
                  spacing: 10.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   if(index==0) Row(
                    spacing: 5.w,
                     children: [
                      Icon(FontAwesomeIcons.calendar, color: AppColors.kAccentPink, size: 15.sp,),
                       CustomText(text: 'Booking', fontSize: 14.sp, fontWeight: FontWeight.w600,),
                     ],
                   ),
                    FAQsWidget(
                      question: 'How to modify a reservation',
                      answer: 'You can modify your reservation',
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => Gap(10.h),
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}

class FAQsWidget extends StatefulWidget {
  const FAQsWidget({super.key, required this.question, required this.answer});
  final String question;
  final String answer;

  @override
  State<FAQsWidget> createState() => _FAQsWidgetState();
}

class _FAQsWidgetState extends State<FAQsWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.kWhite,
        border: Border.all(color: Colors.transparent),
      ),
      child: ExpansionTile(
        enableFeedback: false,
        onExpansionChanged: (value) {
          setState(() {
            isExpanded = value;
          });
        },
        shape: Border.all(color: Colors.transparent),
        expandedAlignment: Alignment.centerLeft,
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        collapsedIconColor: AppColors.kGrey,
        iconColor: AppColors.kGrey,
        childrenPadding: EdgeInsets.only(left: 15.w, right: 10.w, bottom: 20.h),
        trailing: RotatedBox(
          quarterTurns: isExpanded ?  1 : -1,
          child: Icon(Icons.navigate_before)),
        title: CustomText(
          text: widget.question,
          fontSize: 14.sp,
          color: AppColors.kBlack,
        ),
        children: [
          CustomText(
            text: widget.answer,
            color: AppColors.kDarkerGrey,
            fontSize: 12,
          ),
        ],
      ),
    );
  }
}
