import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/custom_icon.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarHomeTile extends StatelessWidget {
  final Map<String, dynamic>? car;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteTap;
  final bool isFavorite;

  const CarHomeTile({
    super.key,
    this.car,
    this.onTap,
    this.onFavoriteTap,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        car?['images']?['cover_image']?['url'] ??
        'https://oui4bvk5eo1qol4e.public.blob.vercel-storage.com/cars/draft-1763901772909-935-cqjm7e04n/1764062571004-01-image.webp.jpg';

    final title = car?['title'] ?? 'Car';
    final subtitle = '${car?['model'] ?? ''} • ${car?['body_type'] ?? ''}';
    final price = car?['pricing']?['price_per_day']?.toString() ?? '0';
    final currency = car?['pricing']?['currency'] ?? 'AED';

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20.r),
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
                  imageBuilder: (context, imageProvider) => Container(
                    height: 150.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        topRight: Radius.circular(20.r),
                      ),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (_, __) => SizedBox(
                    height: 150.h,
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                  errorWidget: (_, __, ___) => SizedBox(
                    height: 150.h,
                    child: const Icon(Icons.car_rental),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'Rent $title',
                        fontWeight: FontWeight.w500,
                        maxLines: 1,
                      ),
                      CustomText(
                        text: subtitle,
                        fontWeight: FontWeight.w500,
                        maxLines: 1,
                        color: AppColors.kDarkerGrey,
                        textOverflow: TextOverflow.ellipsis,
                        fontSize: 13.sp,
                      ),
                      RichText(
                        text: TextSpan(
                          text: '$currency $price',
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
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              right: 10,
              top: 10,
              child: InkWell(
                onTap: onFavoriteTap,
                child: CustomIcon(
                  iconData: isFavorite
                      ? Icons.favorite
                      : Icons.favorite_outline,
                  bgColor: AppColors.kWhite,
                  iconColor: isFavorite
                      ? AppColors.kAccentPink
                      : AppColors.kDarkerGrey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
