import 'package:baba_24/core/app_route.dart';
import 'package:baba_24/presentation/screens/dashboard/home/widgets/car_home_tile.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/app_text_field.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:baba_24/utils/nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

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
                CustomText(
                  text: 'Explore',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
                Gap(20.h),
                Row(
                  children: [
                    Expanded(
                      child: AppTextField(
                        controller: TextEditingController(),
                        decoration: InputDecoration(
                          filled: true,
                          hintText: 'Search cars',
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
                    ),
                    InkWell(
                      onTap: () => pushNamed(AppRoutes.filter),
                      child: Container(
                      height: 50.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                       // color: AppColors.kAccentPink,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Icon(Icons.tune, color: AppColors.kBlack),
                                        ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MediaQuery.removePadding(
              context: context,
              removeTop: true,
              removeBottom: true,
              child: GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                  childAspectRatio: 0.57,
                ),
                itemBuilder: (context, index) {
                  return CarHomeTile();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
