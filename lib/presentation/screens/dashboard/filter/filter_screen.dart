import 'package:baba_24/presentation/screens/dashboard/home/widgets/section_header.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/app_button.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:baba_24/utils/nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:baba_24/presentation/screens/dashboard/home/home_screen.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  // ---------------- STATE ----------------
  int sortBySelectedIndex = 0;
  RangeValues currentRange = const RangeValues(0, 100000);

  String? transmission; // Automatic | Manual
  final Set<String> fuelTypes = {};

  final List<Map<String, String>> sortBy = [
    {'label': 'Recommended', 'value': 'recommended'},
    {'label': 'Price: Low to High', 'value': 'price-low'},
    {'label': 'Popular', 'value': 'popular'},
  ];

  // ---------------- RESET ----------------
  void _resetFilters() {
    setState(() {
      sortBySelectedIndex = 0;
      currentRange = const RangeValues(0, 100000);
      transmission = null;
      fuelTypes.clear();
    });
  }

  // ---------------- APPLY ----------------
  void _applyFilters() {
    Navigator.pop(context, {
      'sortBy': sortBy[sortBySelectedIndex]['value'], // backend-safe
      'minPrice': currentRange.start.toInt(),
      'maxPrice': currentRange.end.toInt(),
      'transmission': transmission,
      'fuelTypes': fuelTypes.isNotEmpty ? fuelTypes.join(',') : null,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => popScreen(),
                  child: const Icon(Icons.close),
                ),
                CustomText(text: 'Filters', fontWeight: FontWeight.w600),
                InkWell(
                  onTap: _resetFilters,
                  child: CustomText(
                    text: 'Reset',
                    color: AppColors.kAccentPink,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      // ---------------- APPLY BUTTON ----------------
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          child: AppButton(
            isLoading: false,
            onPressed: _applyFilters,
            text: 'Apply Filters',
          ),
        ),
      ),

      // ---------------- BODY ----------------
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 24.h),
        child: Column(
          children: [
            // -------- SORT BY --------
            SectionHeader(text: 'Sort By', onTap: () {}),
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 10,
                children: List.generate(sortBy.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() => sortBySelectedIndex = index);
                    },
                    child: CategoryTile(
                      text: sortBy[index]['label']!,
                      isSelected: sortBySelectedIndex == index,
                    ),
                  );
                }),
              ),
            ),

            Gap(30.h),

            // -------- PRICE RANGE --------
            SectionHeader(text: 'Price Range', onTap: () {}),
            RangeSlider(
              min: 0,
              max: 10000000,
              activeColor: AppColors.kAccentPink,
              values: currentRange,
              onChanged: (value) {
                setState(() => currentRange = value);
              },
            ),

            Gap(20.h),

            // -------- TRANSMISSION --------
            SectionHeader(text: 'Transmission', onTap: () {}),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: Row(
                spacing: 20.w,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() => transmission = 'Automatic');
                      },
                      child: CategoryTile(
                        text: 'Automatic',
                        isSelected: transmission == 'Automatic',
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() => transmission = 'Manual');
                      },
                      child: CategoryTile(
                        text: 'Manual',
                        isSelected: transmission == 'Manual',
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Gap(30.h),

            // -------- FUEL TYPE --------
            SectionHeader(text: 'Fuel Type', onTap: () {}),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Wrap(
                spacing: 20,
                runSpacing: 10,
                children: ['Petrol', 'Electric', 'Diesel', 'Hybrid']
                    .map(
                      (fuel) => GestureDetector(
                        onTap: () {
                          setState(() {
                            fuelTypes.contains(fuel)
                                ? fuelTypes.remove(fuel)
                                : fuelTypes.add(fuel);
                          });
                        },
                        child: CategoryTile(
                          text: fuel,
                          isSelected: fuelTypes.contains(fuel),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
