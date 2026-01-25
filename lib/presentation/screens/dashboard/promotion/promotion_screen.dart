import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/toggle_selector.dart';
import 'package:baba_24/presentation/widgets/custom_button.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:baba_24/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class PromotionScreen extends StatelessWidget {
  const PromotionScreen({super.key});

  @override
  Widget build(BuildContext context) {
     String imageUrl =
        "https://oui4bvk5eo1qol4e.public.blob.vercel-storage.com/cars/draft-1763901772909-935-cqjm7e04n/1764062571004-01-image.webp.jpg";
    return Scaffold(
      backgroundColor: AppColors.kWhite.withValues(alpha: .95),
      appBar: CustomAppbar(title: 'Promotion'),
      body: Column(
        children: [
          ToggleSelectorWidget(
            tabIndex: 0,
            tabText: ['Active', 'Used/Expired'],
            onTap: (value) {},
            hasMargin: true,
            bgColor: AppColors.kDarkerGrey.withValues(alpha: .05),
            selectedColor: AppColors.kWhite,
            selectedTexColor: AppColors.kAccentPink,
            unSelectedTexColor: AppColors.kDarkerGrey,
            
          ),

          Expanded(child: PageView(
            children: [
              ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                itemBuilder: (context, index){
                return Container(
                  decoration: BoxDecoration(
                    color: AppColors.kWhite,
                    borderRadius: BorderRadius.circular(20.r)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.r),
                            topRight: Radius.circular(20.r)
                          ),
                          child: SizedBox(
                            height: 200,
                            width: deviceWidth(context),
                            child: Image.network(imageUrl, height: 100.h, width: double.infinity, fit: BoxFit.cover,)),
                        )),

                        Padding(
                          padding: EdgeInsets.all(10.sp),
                          child: Column(
                            spacing: 5,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(text: 'Weekend Gateaway sale', fontWeight: FontWeight.bold,),
                              CustomText(text: '20% on all SUV rentals this Friday through Sunday. Perfect for your next adventure', color: AppColors.kDarkerGrey, fontSize: 12.sp,),
                              Gap(5),
                              Row(
                                spacing: 10.w,
                                children: [
                                  Icon(FontAwesomeIcons.clock, color: AppColors.kAccentPink, size: 15,),
                                  CustomText(text: 'EXPIRES IN 3 DAYS', fontSize: 10.sp, color: AppColors.kAccentPink,)
                                ],
                              ),
                              CustomButton(
                                topPadding: 15.h,
                                onPressed: (){}, text: 'Claim Offer')
                            ],
                          ),
                        )
                    ],
                  ),
                );
              }, separatorBuilder: (context, index)=> Gap(20.h), itemCount: 10),
              CustomText(text: 'Used'),
            ],
          ))
        ],
      ),
    );
  }
}
