
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,
    required this.iconData,
    this.bgColor,
    this.iconColor,
    this.radius,
    this.iconSize,
    this.onTap,
    this.text
  });
  final IconData iconData;
  final Color? bgColor, iconColor;
  final double? radius;
  final double? iconSize;
  final VoidCallback? onTap;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        spacing: text!=null? 4.h : 0,
        children: [
          CircleAvatar(
            backgroundColor: bgColor ?? AppColors.kGrey.withValues(alpha: .2),
            radius: radius,
            child: Icon(iconData, color: iconColor ?? AppColors.kBlack, size: iconSize,),
          ),
         if(text!=null) CustomText(text: text!, fontSize: 12.sp,)
        ],
      ),
    );
  }
}
