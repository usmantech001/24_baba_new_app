import 'package:baba_24/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class CustomPinput extends StatelessWidget {
  const CustomPinput({
    super.key,
    required this.lenght,
    this.controller,
    required this.onChanged,
    this.onCompleted,
    this.mainAxisAlignment,
  });
  final int lenght;
  final TextEditingController? controller;
  final Function(String) onChanged;
  final Function(String)? onCompleted;
  final MainAxisAlignment? mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 45.w,
      child: Pinput(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.spaceBetween,
        length: lenght,
        controller: controller,
        onChanged: onChanged,
        onCompleted: onCompleted,
        pinContentAlignment: Alignment.center,
        preFilledWidget: Text(
          '0',
          style: TextStyle(
            fontFamily: 'Bricolage Grotesque',
            fontWeight: FontWeight.w700,
            fontSize: 28.sp,
            color: AppColors.kGrey,
          ),
        ),
        separatorBuilder: (index) => index == (lenght ~/ 3)
            ? Container(width: 20.w, height: 8.h, color: AppColors.kGrey)
            : SizedBox(),
        followingPinTheme: PinTheme(
          width: 45.w,
          height: 45.w,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.kGrey),
            borderRadius: BorderRadius.circular(10.sp),
          ),
        ),
        defaultPinTheme: PinTheme(
          width: 45.w,
          height: 45.w,
          textStyle: TextStyle(
            color: AppColors.kAccentPink,
            fontSize: 28.sp,
            fontFamily: 'Bricolage Grotesque',
          ),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.kAccentPink),
            borderRadius: BorderRadius.circular(10.sp),
          ),
        ),
        // disabledPinTheme: PinTheme(
        //   width: 45.w,
        //   height: 45.w,
        //   decoration: BoxDecoration(
        //       border: Border.all(
        //         color: AppColors.kGreyD0,
        //       ),
        //       borderRadius: BorderRadius.circular(10.sp)),
        //   textStyle: TextStyle(
        //       color: AppColors.kPrimaryColor,
        //       fontFamily: 'Bricolage Grotesque'),
        // ),

        // focusedPinTheme: PinTheme(
        //     width: 53.w,
        //     height: 50.w,
        //     decoration: BoxDecoration(
        //         border: Border.all(color: AppColors.kSecondary),
        //         borderRadius: BorderRadius.circular(10.sp))),
      ),
    );
  }
}
