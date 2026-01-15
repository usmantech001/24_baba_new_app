import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.bgColor,
    this.textColor,
    this.secondTextColor,
    this.borderColor,
    this.width,
    this.textFontSize,
    this.height,
    this.topPadding,
    this.secondText
  });
  final VoidCallback onPressed;
  final String text;
  final Color? bgColor;
  final Color? textColor, secondTextColor;
  final Color? borderColor;
  final double? width;
  final double? textFontSize;
  final double? height;
  final double? topPadding;
  final String? secondText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:topPadding?? 40.h),
      child: ElevatedButton(
        onPressed: onPressed,
        
        style: ElevatedButton.styleFrom(
        overlayColor: Colors.transparent,
        //
            backgroundColor: (bgColor ?? AppColors.kAccentPink),
            fixedSize:
                Size(width ?? MediaQuery.sizeOf(context).width, height ?? 50.h),
            elevation: 0,
            shape: RoundedRectangleBorder(
               side: BorderSide(color: borderColor ?? AppColors.kAccentPink),
              borderRadius: BorderRadius.circular(10.sp),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: text,
              color: textColor ?? AppColors.kWhite,
              fontWeight: FontWeight.w500,
              fontSize: textFontSize ?? 16.sp,
            ),
            // if(secondText!=null) CustomText(
            //   text: ' - $secondText',
            //   color: secondTextColor??  AppColors.kWhite.withOpacity(0.6),
            //   fontWeight: FontWeight.w500,
            //   fontSize: textFontSize ?? 16.sp,
            //   textOverflow: TextOverflow.ellipsis,
            // ),
          ],
        ),
      ),
    );
  }
}

// class SocialMedialCustomBtn extends StatelessWidget {
//   const SocialMedialCustomBtn(
//       {super.key, required this.text, required this.imgPath, this.bgColor, this.imgColor, this.onTap});
//   final String text;
//   final String imgPath;
//   final Color? bgColor;
//   final Color? imgColor;
//   final VoidCallback? onTap;
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         width: double.infinity,
//         height: 50.h,
        
//         decoration: BoxDecoration(
//           color: bgColor,
//             border: Border.all(color: AppColors.kGreyD0),
//             borderRadius: BorderRadius.circular(15.sp)),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SvgPicture.asset(
//               imgPath,
//               height: 24.h,
//               width: 24.w,
//               color: imgColor,
//             ),
//             SizedBox(
//               width: 10.w,
//             ),
//             CustomText(
//               text: text,
//               color: bgColor!=null? AppColors.kWhite: AppColors.kBlack34,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
