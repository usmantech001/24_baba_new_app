

import 'package:baba_24/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ToggleSelectorWidget extends StatelessWidget {
  const ToggleSelectorWidget(
      {super.key,
      required this.tabIndex,
      required this.tabText,
      thisasMargin = true,
      this.bgColor,
      this.selectedColor,
      this.selectedTexColor,
      this.unSelectedTexColor,
      required this.onTap, required this.hasMargin,});
  final List<String> tabText;
  // final String secTabIndex;
  final int tabIndex;
  final Function(int) onTap;
  final bool hasMargin;
  final Color? bgColor;
  final Color? selectedColor;
  final Color? selectedTexColor;
  final Color? unSelectedTexColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: hasMargin? const EdgeInsets.symmetric(horizontal: 15) : EdgeInsets.zero,
      padding: const EdgeInsets.all(4),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: bgColor?? Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          AnimatedAlign(
            alignment: tabIndex == 0
                ? Alignment.centerLeft
                : Alignment.centerRight,
            duration: const Duration(milliseconds: 300),
            child: Container(
              height: 40,
              width: 160,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: selectedColor?? AppColors.kAccentPink,
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              2,
              (index) => InkWell(
              
                onTap: () => onTap(index),
                child: Center(
                  child: Container(
                    height: 40,
                    width: 160,
                    alignment: Alignment.center,
                    child: Text(
                         tabText[index],
                         style: TextStyle(
                      
                        color: tabIndex == index
                            ? (selectedTexColor??AppColors.kWhite)
                            :(unSelectedTexColor?? AppColors.kBlack),
                            fontWeight: FontWeight.bold
                         ),
                        ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
