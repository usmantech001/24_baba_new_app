
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.text,
    this.shortDesc,
    required this.onTap,
    this.suffixText,
    this.textSize,
    this.suffixTextSize,
    this.hasMargin = true
  });
  final String text;
  final String? shortDesc;
  final VoidCallback onTap;
  final String? suffixText;
  final double? textSize;
  final double? suffixTextSize;
  final bool hasMargin;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: hasMargin? EdgeInsets.symmetric(horizontal: 15.w) : EdgeInsets.zero,
      child: Row(
        spacing: 10.w,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: text,
                  fontWeight: FontWeight.w600,
                  fontSize: textSize?? 18.sp,
                ),
                if (shortDesc != null)
                  CustomText(text: shortDesc!, fontSize: 12.sp),
              ],
            ),
          ),
         if(suffixText!=null) InkWell(
            onTap: onTap,
            child: CustomText(
              text: suffixText!,
              fontWeight: FontWeight.w600,
              color: AppColors.kAccentPink,
              fontSize: suffixTextSize??16,
            ),
          ),
        ],
      ),
    );
  }
}
