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
  bool isScrolling = false;
  Timer? _scrollStopTimer;
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    _scrollController.addListener(() {
      if (!isScrolling) {
        isScrolling = true;
        setState(() {});
      }
      _scrollStopTimer?.cancel();
      _scrollStopTimer = Timer(const Duration(milliseconds: 500), () {
        setState(() {
          isScrolling = false;
        });
      });
      if (_scrollController.offset > 120 && !isCollapsed) {
        setState(() => isCollapsed = true);
      } else if (_scrollController.offset <= 120 && isCollapsed) {
        setState(() => isCollapsed = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String imageUrl =
        "https://oui4bvk5eo1qol4e.public.blob.vercel-storage.com/cars/draft-1763901772909-935-cqjm7e04n/1764062571004-01-image.webp.jpg";
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 25.h),
        child: AppButton(
          isLoading: false,
          onPressed: () {
            pushNamed(AppRoutes.promo);
          },
          text: 'Book Now',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(bottom: 0.h),
        child: CustomScrollView(
          controller: _scrollController,

          slivers: [
            SliverAppBar(
              expandedHeight: 305.h,
              toolbarHeight: 80,
              pinned: true,
              backgroundColor: isCollapsed
                  ? AppColors.kAccentPink
                  : AppColors.kTransparent,
              automaticallyImplyLeading: false,
              leading: GestureDetector(
                onTap: () {
                  if (Navigator.canPop(context)) {
                    popScreen();
                  } else {}
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: CircleAvatar(
                    backgroundColor: AppColors.kWhite,
                    radius: 20,
                    child: Icon(Icons.arrow_back, color: AppColors.kBlack),
                  ),
                ),
              ),
              title: AnimatedOpacity(
                opacity: isCollapsed ? 1 : 0,
                duration: Duration(milliseconds: 300),
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
                  child: CustomText(
                    text: 'Rent Nissan Patrol in Dubai',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    maxLines: 2,
                    color: AppColors.kWhite,
                  ),
                ),
              ),

              actions: [
                Padding(
                  padding: EdgeInsetsGeometry.only(right: 20),
                  child: AnimatedOpacity(
                    opacity: isCollapsed ? 1 : 0,
                    duration: Duration(milliseconds: 300),
                    child: GestureDetector(
                      onTap: () async {
                        // No need for setState - the provider watch will handle the rebuild
                      },
                      child: CircleAvatar(
                        backgroundColor: AppColors.kWhite,
                        child: Icon(Icons.favorite_outline),
                      ),
                    ),
                  ),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => Dialog(
                            backgroundColor: Colors.grey,
                            insetPadding: EdgeInsets.all(10),
                            child: SizedBox(
                              //height: 500,
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: CachedNetworkImage(
                                      imageUrl: imageUrl,
                                      // height: 400,
                                      width: deviceWidth(context),
                                      fit: BoxFit.contain,
                                    ),
                                  ),

                                  Positioned(
                                    top: 16,
                                    right: 16,
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.close,
                                        color: Colors.white,
                                        size: 28,
                                      ),
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: isCollapsed ? 385.h : 345.h,
                        color: AppColors.kWhite.withValues(alpha: .1),
                        child: Stack(
                          children: [
                            CarouselSlider(
                              items: [
                                AspectRatio(
                                  aspectRatio: 16/9,
                                  child: CachedNetworkImage(
                                    imageUrl: imageUrl,
                                    height: isCollapsed ? 385.h : 345.h,
                                    width: double.infinity,
                                    fit: BoxFit.contain,
                                    imageBuilder: (context, imageProvider) {
                                      return FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Container(
                                        height: isCollapsed ? 385.h : 345.h,
                                        width: deviceWidth(context),
                                          decoration: BoxDecoration(
                                            image: DecorationImage(image: imageProvider, fit: BoxFit.scaleDown)
                                          ),
                                        )
                                      );
                                    },
                                  ),
                                ),
                                CachedNetworkImage(
                                  imageUrl: imageUrl,
                                  height: isCollapsed ? 385.h : 345.h,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ],
                              options: CarouselOptions(
                                viewportFraction: 1,
                                height: isCollapsed ? 385.h : 345.h,
                              ),
                            ),
                            Positioned(
                              bottom: 20,
                              right: deviceWidth(context)* 0.45,
                              child: Center(
                                child: SmoothPageIndicator(
                                  // controller: PageController(),
                                  controller: PageController(),
                                  count: 3,
                                
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
                  ],
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  children: [
                    Row(
                      spacing: 15.w,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: CustomText(
                            text: 'Rent Nissan Patrol in Dubai',
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
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
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 20.h, bottom: 30.h),
                child: Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: CustomText(
                        text: 'Specifications',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        spacing: 10,
                        children: List.generate(5, (index) {
                          return Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.h,
                              vertical: 20.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.kGrey.withValues(alpha: .2),
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            child: Column(
                              children: [
                                CustomText(
                                  text: 'SUV',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                                CustomText(text: 'Type', fontSize: 10),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Car Description',
                      fontWeight: FontWeight.bold,
                    ),
                    Gap(5.h),
                    CustomText(
                      text:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Curabitur pretium tincidunt lacus. Nulla gravida orci a odio. Nullam varius, turpis et commodo pharetra, est eros bibendum elit, nec luctus magna felis sollicitudin mauris. Integer in mauris eu nibh euismod gravida.',
                      fontSize: 14.sp,
                    ),
                    Gap(20.h),

                    CustomText(text: 'Features', fontWeight: FontWeight.bold),
                    Gap(10.h),
                    Wrap(
                      spacing: 10.w,
                      runSpacing: 10.h,
                      children: List.generate(5, (index) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 3.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.kGrey.withValues(alpha: .2),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: CustomText(text: 'Bluetooth', fontSize: 13.sp),
                        );
                      }),
                    ),

                    Gap(20.h),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.kWhite.withValues(alpha: .1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            spacing: 10,
                            children: [
                              CircleAvatar(),
                              Column(
                                children: [
                                  CustomText(
                                    text: 'Hosted by',
                                    color: AppColors.kGrey,
                                  ),
                                  CustomText(
                                    text: 'Ali Ahmad',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          CustomIcon(iconData: Icons.message),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /*
            SliverToBoxAdapter(
              
              child: Column(
                children: [
                  TabBar(
                    controller: tabController,
                    isScrollable: true,
                    tabAlignment: TabAlignment.center,
                    tabs: [
                      CustomText(text: 'Details'),
                      CustomText(text: 'Reviews'),
                      CustomText(text: 'Location'),
        
                      CustomText(text: 'Insurance'),
                    ],
                  ),
                  // Expanded(
                  //   child: TabBarView(
                  //     controller: tabController,
                  //     children: [
                  //     DetailsTabView(),
                  //     DetailsTabView(),
                  //     DetailsTabView(),
                  //     DetailsTabView(),
                      
                  //   ]),
                  // )
                ],
              ),
            ),
        
            SliverToBoxAdapter(
             // hasScrollBody: false,
              child:  SizedBox(
                height: 100,
                child: TabBarView(
                  controller: tabController,
                  children: [
                  DetailsTabView(),
                  DetailsTabView(),
                  DetailsTabView(),
                  DetailsTabView(),
                  
                ]),
              ),
            )
            */
          ],
        ),
      ),
    );
  }
}

class DetailsTabView extends StatelessWidget {
  const DetailsTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: 'Basic Info',
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}
