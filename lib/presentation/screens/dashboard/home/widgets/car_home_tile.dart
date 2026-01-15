
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
        width: 200.w,
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
                  imageBuilder: (context, imageProvider) => Container(
                    height: 150.h,
                    // width: double.infinity,
                    width: 200.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        topRight: Radius.circular(20.r),
                      ),
                      image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'Rent Chevrolet Trax',
                        fontWeight: FontWeight.w500,
                        maxLines: 1,
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
