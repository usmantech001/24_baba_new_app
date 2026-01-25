import 'package:baba_24/utils/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      required this.text,
      this.color = AppColors.kBlack,
      this.fontSize = 16,
      this.fontWeight = FontWeight.w400,
      this.maxLines,
      this.textAlign,
      this.textDecoration,
      this.textOverflow,
      this.fontStyle
      });
  final String text;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final int? maxLines;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextDecoration? textDecoration;
  final FontStyle? fontStyle;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: textOverflow,
      maxLines: maxLines,
      
      style: customTextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        textDecoration: textDecoration,
        fontStyle: fontStyle
      )
    );
  }
}

TextStyle customTextStyle(
{Color color = AppColors.kBlack,
double fontSize =16,
FontWeight fontWeight  = FontWeight.w400, TextDecoration? textDecoration, FontStyle? fontStyle}
){
  return TextStyle(
    fontStyle: fontStyle,
         fontFamily: 'Aeonik',
          // textBaseline: TextBaseline.ideographic,
          color: color,
          fontSize: fontSize.sp,
          fontWeight: fontWeight,
          
          
          
          decoration: textDecoration);
    
}

class CustomRichText extends StatelessWidget {
  const CustomRichText(
      {super.key,
      required this.firstText,
      required this.secText,
      required this.firstTextColor,
      required this.secTextColor,
      this.fontSize,
      this.firstTextFontWeight,
      this.secTextFontWeight,
      this.onTap});
  final String firstText;
  final String secText;
  final Color firstTextColor;
  final Color secTextColor;
  final VoidCallback? onTap;
  final double? fontSize;
  final FontWeight? firstTextFontWeight;
  final FontWeight? secTextFontWeight;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
          text: firstText,
          style: TextStyle(
              color: firstTextColor,
              fontFamily: 'Aeonik',
              fontFamilyFallback: const ['Roboto', 'sans-serif'],
              fontSize: fontSize?? 16.sp,
              fontWeight:firstTextFontWeight?? FontWeight.w500),
        ),
        TextSpan(
            text: secText,
            style: TextStyle(
              fontFamily: 'Aeonik',
              fontFamilyFallback: const ['Roboto', 'sans-serif'],
                color: secTextColor,
                fontSize: fontSize?? 16.sp,
                fontWeight: secTextFontWeight?? FontWeight.w500),
            recognizer: TapGestureRecognizer()..onTap = onTap),
      ]),
    );
  }
}
