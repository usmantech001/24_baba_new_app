import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/toggle_selector.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class InsuranceDetailsScreen extends StatelessWidget {
  const InsuranceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Insurance Details'),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 15.w, right: 15.w),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'DAILY RATE',
                    color: AppColors.kDarkerGrey,
                    fontSize: 13.sp,
                  ),
                  RichText(
                    text: TextSpan(
                      text: '\$18.99',
                      style: customTextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: ' /day',
                          style: customTextStyle(
                            fontSize: 10.sp,
                            color: AppColors.kDarkerGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: AppColors.kAccentPink,
                  borderRadius: BorderRadius.circular(15.sp),
                ),
                child: Row(
                  spacing: 5.w,
                  children: [
                    CustomText(
                      text: 'Select Full Coverage',
                      color: AppColors.kWhite,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    Icon(Icons.arrow_forward, color: AppColors.kWhite,)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.w),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: 'Drive with total \npeace of mind',
              fontWeight: FontWeight.w600,
              fontSize: 25,
            ),
            Gap(10.h),
            CustomText(
              text:
                  'Choose the level of protection that fits your journey with 24baba',
              color: AppColors.kDarkerGrey,
              fontSize: 14.sp,
            ),

            ToggleSelectorWidget(
              tabIndex: 0,
              tabText: ['Basic Plan', 'Full Protection'],
              onTap: (index) {},
              hasMargin: false,
              bgColor: AppColors.kGrey.withValues(alpha: .2),
              selectedColor: AppColors.kWhite,
              selectedTexColor: AppColors.kAccentPink,
              unSelectedTexColor: AppColors.kBlack.withValues(alpha: .5),
            ),
            Gap(20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: 'Coverage Comparison',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 1.h),
                  decoration: BoxDecoration(
                    color: AppColors.kAccentPink.withValues(alpha: .3),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: CustomText(
                    text: 'RECOMMENDED',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.kAccentPink,
                  ),
                ),
              ],
            ),
            Gap(20.h),
            CoverageTable(),
          ],
        ),
      ),
    );
  }
}

class CoverageTable extends StatelessWidget {
  const CoverageTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Stack(
        children: [
          // FULL column background
          Positioned.fill(
            right: 0,
            child: FractionallySizedBox(
              widthFactor: 1 / 3, // one column out of three
              alignment: Alignment.centerRight,
              child: Container(
                margin: EdgeInsets.only(left: 15),
                decoration: BoxDecoration(
                  color: Colors.pink.withOpacity(0.06),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
              ),
            ),
          ),

          // Table content
          Column(
            children: [
              _headerRow(),
              _row(
                "Collision Damage (CDW)",
                "Protects against body damage",
                const Icon(Icons.check_circle, color: Colors.pink),
                const Icon(Icons.check_circle, color: Colors.pink),
              ),
              _row(
                "Theft Protection",
                "Vehicle theft coverage",
                const Icon(Icons.check_circle, color: Colors.pink),
                const Icon(Icons.check_circle, color: Colors.pink),
              ),
              _row(
                "Damage Deductible",
                "Your maximum liability",
                const Text(
                  "\$1,200",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text(
                  "\$0",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.pink,
                  ),
                ),
              ),
              _row(
                "24/7 Roadside Assist",
                "Flat tires, lockout, fuel",
                const Icon(Icons.remove_circle, color: Colors.grey),
                const Icon(Icons.check_circle, color: Colors.pink),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _headerRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: const [
          Expanded(
            flex: 2,
            child: Center(
              child: Text("FEATURE", style: TextStyle(color: Colors.grey)),
            ),
          ),

          Expanded(
            child: Center(
              child: Text("BASIC", style: TextStyle(color: Colors.grey)),
            ),
          ),
          Gap(15),
          Expanded(
            child: Center(
              child: Text(
                "FULL",
                style: TextStyle(
                  color: Colors.pink,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _row(String title, String subtitle, Widget basic, Widget full) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),

          Expanded(child: Center(child: basic)),
          Gap(15.w),
          Expanded(child: Center(child: full)),
        ],
      ),
    );
  }
}
