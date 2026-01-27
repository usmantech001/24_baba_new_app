import 'dart:async';

import 'package:baba_24/core/app_route.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/app_button.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/custom_icon.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:baba_24/utils/global.dart';
import 'package:baba_24/utils/nav.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarDetailsScreen extends StatefulWidget {
  const CarDetailsScreen({super.key});

  @override
  State<CarDetailsScreen> createState() => _CarDetailsScreenState();
}

class _CarDetailsScreenState extends State<CarDetailsScreen>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  bool isCollapsed = false;
  Timer? _scrollStopTimer;
  late TabController tabController;
  int activeImageIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);

    _scrollController.addListener(() {
      _scrollStopTimer?.cancel();
      _scrollStopTimer = Timer(const Duration(milliseconds: 300), () {});

      if (_scrollController.offset > 120 && !isCollapsed) {
        setState(() => isCollapsed = true);
      } else if (_scrollController.offset <= 120 && isCollapsed) {
        setState(() => isCollapsed = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final car =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final pricing = car['pricing'] ?? {};
    final images = car['images'] ?? {};
    final coverImage = images['cover_image']?['url'];
    final additionalImages = List<Map<String, dynamic>>.from(
      images['additional_images'] ?? [],
    );

    final imageList = [
      if (coverImage != null) coverImage,
      ...additionalImages.map((e) => e['url']),
    ];

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 25.h),
        child: AppButton(
          isLoading: false,
          onPressed: () => pushNamed(AppRoutes.promo, arguments: car),
          text: 'Book Now',
        ),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          /// ================== APP BAR ==================
          SliverAppBar(
            expandedHeight: 305.h,
            pinned: true,
            backgroundColor: isCollapsed
                ? AppColors.kAccentPink
                : Colors.transparent,
            automaticallyImplyLeading: false,
            leading: GestureDetector(
              onTap: popScreen,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: CircleAvatar(
                  backgroundColor: AppColors.kWhite,
                  child: const Icon(Icons.arrow_back),
                ),
              ),
            ),
            title: AnimatedOpacity(
              opacity: isCollapsed ? 1 : 0,
              duration: const Duration(milliseconds: 300),
              child: CustomText(
                text: '${car['brand']} ${car['model']} ${car['year']}',
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.kWhite,
                maxLines: 2,
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  CarouselSlider(
                    items: imageList
                        .map(
                          (url) => CachedNetworkImage(
                            imageUrl: url,
                            width: double.infinity,
                            fit: BoxFit.contain,
                          ),
                        )
                        .toList(),
                    options: CarouselOptions(
                      height: 305.h,
                      viewportFraction: 1,
                      onPageChanged: (index, _) {
                        setState(() => activeImageIndex = index);
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: AnimatedSmoothIndicator(
                        activeIndex: activeImageIndex,
                        count: imageList.length,
                        effect: WormEffect(
                          activeDotColor: AppColors.kAccentPink,
                          dotHeight: 8,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// ================== TITLE + PRICE ==================
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: CustomText(
                      text: '${car['brand']} ${car['model']} ${car['year']}',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text:
                          '${pricing['currency']} ${pricing['price_per_day']}',
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
          ),

          /// ================== SPECIFICATIONS ==================
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Specifications',
                    fontWeight: FontWeight.bold,
                  ),
                  Gap(10.h),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _specItem(car['class'], 'Class'),
                        _specItem(car['body_type'], 'Body'),
                        _specItem(car['transmission'], 'Transmission'),
                        _specItem('${car['seats']}', 'Seats'),
                        _specItem('${car['engine_capacity']}L', 'Engine'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// ================== DESCRIPTION ==================
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Car Description',
                    fontWeight: FontWeight.bold,
                  ),
                  Gap(8.h),
                  CustomText(
                    text: _stripMarkdown(car['detailsMarkdown'] ?? ''),
                    fontSize: 14.sp,
                  ),
                  Gap(20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(),
                          Gap(10.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: 'Hosted by',
                                color: AppColors.kGrey,
                              ),
                              CustomText(
                                text: car['uploaded_by'] ?? '',
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const CustomIcon(iconData: Icons.message),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _specItem(String value, String label) {
    return Container(
      margin: EdgeInsets.only(right: 10.w),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      decoration: BoxDecoration(
        color: AppColors.kGrey.withValues(alpha: .2),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        children: [
          CustomText(text: value, fontWeight: FontWeight.bold, fontSize: 12.sp),
          CustomText(text: label, fontSize: 10.sp),
        ],
      ),
    );
  }

  String _stripMarkdown(String text) {
    return text
        .replaceAll(RegExp(r'[#*_>`-]'), '')
        .replaceAll(RegExp(r'\[.*?\]\(.*?\)'), '')
        .trim();
  }
}
