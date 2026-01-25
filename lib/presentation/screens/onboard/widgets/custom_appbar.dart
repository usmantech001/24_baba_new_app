import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:baba_24/utils/nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    required this.title,
    this.canPop = true,
    this.icon,
    this.suffix
  });

  final String title;
  final bool canPop;
  final IconData? icon;
  final Widget? suffix;

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               canPop? InkWell(
                  onTap: () => popScreen(),
                  child: SizedBox(
                    width: 30.w,
                    child: Icon(icon?? Icons.navigate_before, size: 30,))): SizedBox(),
                CustomText(text: title, fontWeight: FontWeight.w600),
               suffix!=null? suffix!: SizedBox(width: 30.w,)
              //  CustomText(
              //     text: 'Reset',
              //     color: AppColors.kAccentPink,
              //     fontWeight: FontWeight.w600,
              //   ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
