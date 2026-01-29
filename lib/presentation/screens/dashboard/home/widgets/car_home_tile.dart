
import 'package:baba_24/core/app_route.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/custom_icon.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:baba_24/utils/nav.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CarHomeTile extends StatelessWidget {
  const CarHomeTile({super.key});

  @override
  Widget build(BuildContext context) {
    String imageUrl =
        "https://oui4bvk5eo1qol4e.public.blob.vercel-storage.com/cars/draft-1763901772909-935-cqjm7e04n/1764062571004-01-image.webp.jpg";
    return InkWell(
      onTap: () => pushNamed(AppRoutes.carDetails),
      child: Container(
        width: 170.w,
        decoration: BoxDecoration(
          color: AppColors.kGrey.withValues(alpha: .1),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl: imageUrl,
                  imageBuilder: (context, imageProvider) => FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Container(
                      height: 150.h,
                      
                      width: 200.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.r),
                          topRight: Radius.circular(20.r),
                        ),
                        image: DecorationImage(image: imageProvider, fit: BoxFit.cover, alignment: Alignment.center),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  child: Column(
                    spacing: 5,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'Rent Chevrolet Trax',
                        fontWeight: FontWeight.w500,
                        maxLines: 1,
                        fontSize: 14.sp,
                      ),
                      CustomText(
                        text: 'or similar • Sedan',
                        fontWeight: FontWeight.w500,
                        maxLines: 1,
                        color: AppColors.kDarkerGrey,
                        textOverflow: TextOverflow.ellipsis,
                        fontSize: 13.sp,
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow,),
                          RichText(text: TextSpan(
                            text: '5.0',
                            style: customTextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                text: '  (1000+)',
                                style: customTextStyle(fontWeight: FontWeight.w300, fontSize: 11.sp)
                              )
                            ]
                          ),
                          
                          )
                        ],
                      ),
                      RichText(
                        text: TextSpan(
                          text: '\$208',
                          style: customTextStyle(
                            color: AppColors.kAccentPink,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                              text: ' / day',
                              style: customTextStyle(
                                fontSize: 13.sp,
                                color: AppColors.kDarkerGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
          
                   /*
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            spacing: 10,
                            children: [
                              CustomIcon(
                                iconData: Icons.phone_outlined,
                                bgColor: AppColors.kWhite,
                              ),
                              CustomIcon(
                                iconData: FontAwesomeIcons.whatsapp,
                                iconColor: AppColors.kAccentGreen,
                                bgColor: AppColors.kWhite,
                              ),
                            ],
                          ),
                          CustomIcon(
                            iconData: Icons.message,
                            bgColor: AppColors.kWhite,
                          ),
                        ],
                      ),
                      */
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              right: 10,
              top: 10,
              child: CustomIcon(iconData: Icons.favorite_outline, bgColor: AppColors.kWhite,), )
          ],
        ),
      ),
    );
  }
}
