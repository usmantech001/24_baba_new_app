import 'package:baba_24/core/app_route.dart';
import 'package:baba_24/data/controller/location_controller.dart';
import 'package:baba_24/presentation/screens/dashboard/home/widgets/car_home_tile.dart';
import 'package:baba_24/presentation/screens/dashboard/home/widgets/section_header.dart';
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
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int selectedCategoryIndex = 0;

  late VideoPlayerController _controller;
  bool isPlaying = false;
  bool isMute = true;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/intro-video.mp4')
      ..initialize().then((_) {
        if (_controller.value.isInitialized) {
          _controller.seekTo(Duration(seconds: 1));
          _controller.play();
          _controller.setVolume(0.0);
          isPlaying = true;
        }
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    final locationController = context.watch<LocationController>();
    List<String> categories = [
      "All",
      "Sedan",
      "SUV",
      "Hatchback",
      "Coupe",
      "Luxury",
    ];
    return Scaffold(
      body: Column(
        children: [
          HomeHeader(),
          Expanded(
            child: SingleChildScrollView(
              // padding: EdgeInsets.symmetric(vertical: 15.h),
              child: Column(
                children: [
                  SizedBox(
                    // //height: 400.h,
                    // width: double.infinity,
                    // // color: Colors.red,
                    // //height: deviceHeight(context) * 35,
                    child: Column(
                      children: [
                        _controller.value.isInitialized
                            ? AspectRatio(
                                aspectRatio: _controller.value.aspectRatio,
                                child: Stack(
                                  children: [
                                    VideoPlayer(_controller),
                                    Positioned(
                                      right: 10,
                                      top: 10,
                                      child: InkWell(
                                        onTap: () {
                                          if (isMute) {
                                            _controller.seekTo(
                                              Duration(seconds: 1),
                                            );
                                            _controller.setVolume(1);
                                            _controller.play();
                                            isMute = false;

                                            setState(() {});
                                          } else {
                                            _controller.setVolume(0.0);
                                            isMute = true;
                                            setState(() {});
                                          }
                                        },
                                        child: CustomIcon(
                                          iconData: isMute
                                              ? Icons.volume_off
                                              : Icons.volume_up,
                                          bgColor: AppColors.kWhite,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Container(),

                        Container(
                          // height: 200.h,
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 20.h,
                          ),
                          // margin: EdgeInsets.symmetric(horizontal: 30),
                          width: deviceWidth(context),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(3, 3),
                                color: Colors.grey.withValues(alpha: .2),
                              ),
                              BoxShadow(
                                offset: Offset(-3, -3),
                                color: Colors.grey.withValues(alpha: .2),
                              ),
                            ],
                          ),
                          child: Column(
                            spacing: 10,
                            children: [
                              HomeSelector(
                                icon: FontAwesomeIcons.locationDot,
                                title:
                                    locationController.currentAddress.isNotEmpty
                                    ? 'YOUR PICK UP LOCATION'
                                    : 'PICK UP YOUR LOCATION',
                                value:
                                    locationController.currentAddress.isNotEmpty
                                    ? locationController.currentAddress
                                    : 'Where are you going ?',
                                onTap: () {
                                  pushNamed(AppRoutes.location);
                                },
                              ),
                              Row(
                                spacing: 10.w,
                                children: [
                                  Expanded(
                                    child: HomeSelector(
                                      icon: Icons.calendar_month,
                                      title: 'START DATE',
                                      value: 'OCT 12, 10:00',
                                      valueColor: AppColors.kBlack,
                                      onTap: () {
                                        pushNamed(AppRoutes.dateTime);
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: HomeSelector(
                                      icon: Icons.calendar_month,
                                      title: 'END DATE',
                                      value: 'OCT 12, 10:00',
                                      valueColor: AppColors.kBlack,
                                      onTap: () {
                                        pushNamed(AppRoutes.dateTime);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(vertical: 10.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.r),
                                  color: AppColors.kAccentPink,
                                ),
                                child: Row(
                                  spacing: 10.w,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.search, color: AppColors.kWhite),
                                    CustomText(
                                      text: 'Search',
                                      color: AppColors.kWhite,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                              ),
                              // AppButton(
                              //   isLoading: false,
                              //   onPressed: () {},
                              //   text: 'Search ',

                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  /*
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Row(
                      spacing: 10.w,
                      children: [
                        Expanded(
                          child: AppTextField(
                            controller: TextEditingController(),
                            decoration: InputDecoration(
                              filled: true,
                              hintText: 'Search cars, brands....',
                              fillColor: AppColors.kGrey.withValues(alpha: .1),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                                // borderSide: BorderSide(color: Colors.red, width: 1),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.transparent),
                                // borderSide: BorderSide(color: Colors.red, width: 1),
                              ),
                            ),
                          ),
                        ),
            
                        Container(
                          height: 50.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                            color: AppColors.kAccentPink,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Icon(Icons.tune, color: AppColors.kWhite),
                        ),
                      ],
                    ),
                  ),
                  */
                  Gap(40.h),
                  // SectionHeader(text: 'All Brands', onTap: () => null),
                  // // SingleChildScrollView(
                  // //   padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                  // //   physics: const BouncingScrollPhysics(),
                  // //   scrollDirection: Axis.horizontal,
                  // //   child: Row(
                  // //     spacing: 10,
                  // //     children: List.generate(categories.length, (index) {
                  // //       return CategoryTile(
                  // //         text: categories[index],
                  // //         isSelected: selectedCategoryIndex == index,
                  // //       );
                  // //     }),
                  // //   ),
                  // // ),

                  // SectionHeader(text: 'All Brands', onTap: () => null),
                  /*
                  SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 10,
                      children: List.generate(10, (index) {
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                          //width: 50.w,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.kDarkerGrey.withValues(alpha: .1)
                            ),
                            borderRadius: BorderRadius.circular(10.r)
                          ),
                          child: Column(
                            spacing: 8,
                            children: [
                              CircleAvatar(
                                child: Image.asset('assets/images/bmw_logo.png'),
                              ),
                              CustomText(text: 'CHEVROLET', maxLines: 2, fontSize: 12.sp, fontWeight: FontWeight.w600,),
                              CustomText(text: '225', fontSize: 12.sp, color: AppColors.kDarkerGrey,)
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                  */
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Column(
                      spacing: 10.h,
                      children: [
                        MediaQuery.removePadding(
                          removeTop: true,
                          context: context,
                          child: GridView.builder(
                            shrinkWrap: true,
                            itemCount: 6,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 3,
                                  mainAxisSpacing: 10.h,
                                  crossAxisSpacing: 10.w,
                                  crossAxisCount: 2,
                                ),
                            itemBuilder: (context, index) {
                              return BrandTile(name: 'BMW', img: 'bmw_logo');
                            },
                          ),
                        ),

                        InkWell(
                          onTap: () => pushNamed(AppRoutes.allBrands),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.h,
                              horizontal: 10.w,
                            ),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              color: Colors.grey.withValues(alpha: .07),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(
                                  text: 'All Brands',
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.kAccentPink,
                                ),
                                Icon(
                                  Icons.navigate_next,
                                  color: AppColors.kAccentPink,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Row(
                    //   children: [
                    //     BrandTile(name: 'name', img: 'bmw_logo')
                    //   ],
                    // ),
                  ),
                  Gap(20.h),
                  SectionHeader(
                    text: 'Standard Cars',
                  //  shortDesc: 'Premium Cars at great prices',
                    onTap: () => null,
                  ),
                  SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 20.h,
                    ),
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 10,
                      children: List.generate(5, (index) {
                        return CarHomeTile();
                      }),
                    ),
                  ),

                  Gap(20.h),
                  SectionHeader(
                    text: 'Electric Cars',
                   // shortDesc: 'Eco-friendly and modern electric vehicles',
                    onTap: () => null,
                  ),
                  SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 20.h,
                    ),
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 10,
                      children: List.generate(5, (index) {
                        return CarHomeTile();
                      }),
                    ),
                  ),
                  Gap(20.h),
                  SectionHeader(
                    text: 'Business Class Cars',
                   // shortDesc: 'Professional vehicles for business and comfort',
                    onTap: () => null,
                  ),
                  SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 20.h,
                    ),
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 10,
                      children: List.generate(5, (index) {
                        return CarHomeTile();
                      }),
                    ),
                  ),

                  SectionHeader(
                    text: 'Promotion',
                    //shortDesc: 'Professional vehicles for business and comfort',
                    onTap: () => pushNamed(AppRoutes.promotion),
                    suffixText: 'View All',
                  ),
                  Gap(20),
                  CarouselSlider.builder(
                    itemCount: 3,

                    itemBuilder: (context, index, _) {
                      String imageUrl =
                          "https://oui4bvk5eo1qol4e.public.blob.vercel-storage.com/cars/draft-1763901772909-935-cqjm7e04n/1764062571004-01-image.webp.jpg";
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 15.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: imageUrl,
                          imageBuilder: (context, imageProvider) {
                            return Container(
                              width: deviceWidth(context),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                    options: CarouselOptions(
                      viewportFraction: 1,

                      height: 150,
                      autoPlay: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeSelector extends StatelessWidget {
  const HomeSelector({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    this.valueColor,
    required this.onTap,
  });
  final IconData icon;
  final String title;
  final String value;
  final Color? valueColor;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: AppColors.kGrey.withValues(alpha: .1),
          border: Border.all(color: AppColors.kGrey.withValues(alpha: .5)),
          borderRadius: BorderRadius.circular(10.r),
        ),

        child: Row(
          spacing: 10.w,
          children: [
            Icon(icon, color: AppColors.kAccentPink, size: 15.sp),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: title,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.kAccentPink,
                  ),
                  CustomText(
                    text: value,
                    color:
                        valueColor ??
                        AppColors.kLightPink.withValues(alpha: .5),
                    fontSize: 11.sp,
                    fontWeight: valueColor != null
                        ? FontWeight.w600
                        : FontWeight.w400,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  const CategoryTile({super.key, required this.text, this.isSelected = false});
  final String text;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.kAccentPink
            : AppColors.kGrey.withValues(alpha: .1),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: CustomText(
        text: text,
        color: isSelected ? AppColors.kWhite : AppColors.kBlack,
        fontSize: 13.sp,
      ),
    );
  }
}

class BrandTile extends StatelessWidget {
  const BrandTile({super.key, required this.name, required this.img});
  final String name;
  final String img;
  @override
  Widget build(BuildContext context) {
    return Container(
      //width: deviceWidth(context),
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: Colors.grey.withValues(alpha: .07),
      ),
      child: Row(
        spacing: 10.w,
        children: [
          Image.asset('assets/images/$img.png', height: 30.h, width: 30.w),
          CustomText(text: name, fontSize: 12.sp, fontWeight: FontWeight.w600),
        ],
      ),
    );
  }
}

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        //color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 10.w,
              children: [Image.asset('assets/images/logo.png', height: 50)],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              decoration: BoxDecoration(
                color: AppColors.kGrey.withValues(alpha: .2),
                borderRadius: BorderRadius.circular(15.sp),
                // boxShadow: [
                //   BoxShadow(
                //     offset: Offset(3, 3),
                //     color: Colors.grey.withValues(alpha: .2),
                //   ),
                //   BoxShadow(
                //     offset: Offset(-3, -3),
                //    // color: Colors.grey.withValues(alpha: .2),
                //   ),
                // ],
              ),
              child: Row(
                spacing: 10.w,
                children: [
                  CustomIcon(
                    iconData: Icons.language,
                    onTap: () => pushNamed(AppRoutes.notifications),
                    bgColor: AppColors.kWhite,
                  ),
                  CustomIcon(
                    iconData: Icons.bedtime_rounded,
                    onTap: () => pushNamed(AppRoutes.notifications),
                    bgColor: AppColors.kWhite,
                  ),
                  CustomIcon(
                    iconData: Icons.notifications_outlined,
                    onTap: () => pushNamed(AppRoutes.notifications),
                    bgColor: AppColors.kWhite,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
