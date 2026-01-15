import 'package:baba_24/presentation/screens/dashboard/home/home_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/home/widgets/section_header.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/app_button.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:baba_24/utils/nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final int sortBySelectedIndex = 0;
  RangeValues currentRange = RangeValues(50000, 100000);

  @override
  Widget build(BuildContext context) {
    List<String> sortBy = ['Recommended', 'Peice: Low to High', 'Popular'];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => popScreen(),
                  child: Icon(Icons.close)),
                CustomText(text: 'Filters', fontWeight: FontWeight.w600),
                CustomText(
                  text: 'Reset',
                  color: AppColors.kAccentPink,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          child: AppButton(isLoading: false, onPressed: (){}, text: 'Apply Filters'),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 24.h),
        child: Column(
          children: [
            SectionHeader(
              text: 'Sort By',
              onTap: () => null,
              
            ),
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 10,
                children: List.generate(sortBy.length, (index) {
                  return CategoryTile(
                    text: sortBy[index],
                    isSelected: sortBySelectedIndex == index,
                  );
                }),
              ),
            ),
            Gap(30),
            SectionHeader(
              text: 'Price Range',
              onTap: () => null,
            ),
            RangeSlider(
              min: 5000,
              max: 10000000,
              activeColor: AppColors.kAccentPink,
              values: currentRange,
              onChanged: (value) {
                setState(() {
                  currentRange = value;
                });
              },
            ),
            Gap(20.h),
             SectionHeader(
              text: 'Transmission',
              onTap: () => null,
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: Row(
                spacing: 20.w,
                children: [
                  Expanded(child: CategoryTile(text: 'Automatic')),
                  Expanded(child: CategoryTile(text: 'Manual'))
                ],
              ),
            ),
            Gap(30.h),
             SectionHeader(
              text: 'Fuel Type',
              onTap: () => null,
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 10.h),
              child: Wrap(
               alignment: WrapAlignment.start,
               // direction: Axis.horizontal,
                spacing: 20,
                runSpacing: 10,
                children: [
              
                  
                  CategoryTile(text: 'Petrol', isSelected: true,),
                  CategoryTile(text: 'Electric'),
                  CategoryTile(text: 'Diesel'),
                  CategoryTile(text: 'Hybrid'),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
