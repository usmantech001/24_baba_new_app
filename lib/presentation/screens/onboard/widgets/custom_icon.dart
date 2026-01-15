
import 'package:baba_24/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,
    required this.iconData,
    this.bgColor,
    this.iconColor,
    this.radius,
    this.iconSize
  });
  final IconData iconData;
  final Color? bgColor, iconColor;
  final double? radius;
  final double? iconSize;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: bgColor ?? AppColors.kGrey.withValues(alpha: .2),
      radius: radius,
      child: Icon(iconData, color: iconColor ?? AppColors.kBlack, size: iconSize,),
    );
  }
}
