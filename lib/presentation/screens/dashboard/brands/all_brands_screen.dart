import 'package:baba_24/presentation/screens/dashboard/home/home_screen.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'All Brands'),
      body: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                    shrinkWrap: true,
                    itemCount: 100,
                   
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 3,
                      mainAxisSpacing: 10.h, 
                      crossAxisSpacing: 10.w,
                      crossAxisCount: 2), itemBuilder: (context, index){
                    return BrandTile(name: 'BMW', img: 'bmw_logo');
                  }),
    );
  }
}