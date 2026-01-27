import 'dart:convert';

import 'package:baba_24/core/app_route.dart';
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
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedCategoryIndex = 0;

  Map<String, dynamic>? currentUser;
  bool isLoadingUser = true;
  bool _hasFetchedUser = false;

  // 🔹 Brands
  List<Map<String, dynamic>> brands = [];
  bool isLoadingBrands = true;

  @override
  void initState() {
    super.initState();
    _loadUserOnce();
    _fetchBrands();
  }

  // ================= LOAD USER ONLY ONCE =================
  Future<void> _loadUserOnce() async {
    if (_hasFetchedUser) return;

    final prefs = await SharedPreferences.getInstance();

    final cachedUser = prefs.getString('current_user');
    if (cachedUser != null) {
      currentUser = jsonDecode(cachedUser);
      isLoadingUser = false;
      _hasFetchedUser = true;
      if (mounted) setState(() {});
      return;
    }

    await _fetchCurrentUser();
  }

  Future<void> _fetchCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');

    if (token == null) {
      isLoadingUser = false;
      _hasFetchedUser = true;
      if (mounted) setState(() {});
      return;
    }

    try {
      final baseURL = dotenv.env['PROD_API_URL'] ?? '';
      final updatedURL = '$baseURL/auth/current-user';

      final response = await http.get(
        Uri.parse(updatedURL),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        if (decoded['success'] == true) {
          currentUser = decoded['data'];
          await prefs.setString('current_user', jsonEncode(currentUser));
        }
      }
    } catch (_) {
      currentUser = null;
    } finally {
      isLoadingUser = false;
      _hasFetchedUser = true;
      if (mounted) setState(() {});
    }
  }

  // ================= FETCH BRANDS =================
  Future<void> _fetchBrands() async {
    setState(() {
      isLoadingBrands = true;
    });

    try {
      final baseURL = dotenv.env['PROD_API_URL'] ?? '';
      final response = await http.get(Uri.parse('$baseURL/brands'));

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        if (decoded['success'] == true) {
          brands = List<Map<String, dynamic>>.from(decoded['data']);
        }
      }
    } catch (e) {
      debugPrint('Error fetching brands: $e');
    } finally {
      if (mounted) {
        setState(() {
          isLoadingBrands = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
          HomeHeader(currentUser: currentUser, isLoadingUser: isLoadingUser),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/home-image.jpeg',
                          width: double.infinity,
                          fit: BoxFit.fill,
                          height: 300,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 20.h,
                          ),
                          width: deviceWidth(context),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(3, 3),
                                color: Colors.grey.withOpacity(.2),
                              ),
                              BoxShadow(
                                offset: Offset(-3, -3),
                                color: Colors.grey.withOpacity(.2),
                              ),
                            ],
                          ),
                          child: Column(
                            spacing: 10,
                            children: [
                              HomeSelector(
                                icon: FontAwesomeIcons.locationDot,
                                title: 'PICK UP YOUR LOCATION',
                                value: 'Where are you going ?',
                                onTap: () => pushNamed(AppRoutes.location),
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
                                      onTap: () =>
                                          pushNamed(AppRoutes.dateTime),
                                    ),
                                  ),
                                  Expanded(
                                    child: HomeSelector(
                                      icon: Icons.calendar_month,
                                      title: 'END DATE',
                                      value: 'OCT 12, 10:00',
                                      valueColor: AppColors.kBlack,
                                      onTap: () =>
                                          pushNamed(AppRoutes.dateTime),
                                    ),
                                  ),
                                ],
                              ),
                              AppButton(
                                isLoading: false,
                                onPressed: () {},
                                text: 'Search your perfect ride',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(40.h),

                  SectionHeader(text: 'Categories', onTap: () => null),
                  SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 20.h,
                    ),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 10,
                      children: List.generate(categories.length, (index) {
                        return CategoryTile(
                          text: categories[index],
                          isSelected: selectedCategoryIndex == index,
                        );
                      }),
                    ),
                  ),

                  // ================= BRANDS SECTION =================
                  SectionHeader(
                    text: 'Brands',
                    onTap: () {
                      debugPrint(
                        'Navigating to AllBrandsScreen with ${brands.length} brands',
                      );
                      pushNamed(AppRoutes.allBrands, arguments: brands);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: isLoadingBrands
                        ? const Center(child: CircularProgressIndicator())
                        : GridView.builder(
                            shrinkWrap: true,
                            itemCount: brands.length > 6 ? 6 : brands.length,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 3,
                                  mainAxisSpacing: 10.h,
                                  crossAxisSpacing: 10.w,
                                  crossAxisCount: 2,
                                ),
                            itemBuilder: (context, index) {
                              final brand = brands[index];
                              final logoUrl = brand['logo']?['url'] ?? '';
                              final name = brand['name'] ?? '';
                              return BrandTile(
                                name: name,
                                img: logoUrl,
                                isNetwork: true,
                              );
                            },
                          ),
                  ),
                  InkWell(
                    onTap: () => pushNamed(AppRoutes.allBrands),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: 'All Brands',
                          fontWeight: FontWeight.w600,
                          color: AppColors.kAccentPink,
                        ),
                        Icon(Icons.navigate_next, color: AppColors.kAccentPink),
                      ],
                    ),
                  ),
                  Gap(20.h),

                  // ================= REMAINING SECTIONS UNCHANGED =================
                  SectionHeader(
                    text: 'Smart Picks',
                    shortDesc: 'Premium Cars at great prices',
                    onTap: () => null,
                  ),
                  SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 20.h,
                    ),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 10,
                      children: List.generate(5, (_) => CarHomeTile()),
                    ),
                  ),
                  Gap(20.h),

                  SectionHeader(
                    text: 'Electric Cars',
                    shortDesc: 'Eco-friendly and modern electric vehicles',
                    onTap: () => null,
                  ),
                  SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 20.h,
                    ),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 10,
                      children: List.generate(5, (_) => CarHomeTile()),
                    ),
                  ),
                  Gap(20.h),

                  SectionHeader(
                    text: 'Business Class Cars',
                    shortDesc: 'Professional vehicles for business and comfort',
                    onTap: () => null,
                  ),
                  SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 20.h,
                    ),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 10,
                      children: List.generate(5, (_) => CarHomeTile()),
                    ),
                  ),

                  SectionHeader(
                    text: 'Promotion',
                    shortDesc: 'Professional vehicles for business and comfort',
                    onTap: () => pushNamed(AppRoutes.promotion),
                    suffixText: 'View All',
                  ),
                  Gap(20),

                  CarouselSlider.builder(
                    itemCount: 3,
                    itemBuilder: (context, index, _) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 15.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://oui4bvk5eo1qol4e.public.blob.vercel-storage.com/cars/draft-1763901772909-935-cqjm7e04n/1764062571004-01-image.webp.jpg',
                          imageBuilder: (context, imageProvider) {
                            return Container(
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

class BrandTile extends StatelessWidget {
  const BrandTile({
    super.key,
    required this.name,
    required this.img,
    this.isNetwork = false,
  });
  final String name;
  final String img;
  final bool isNetwork;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        // color: Colors.grey.withOpacity(.07),r
      ),
      child: Row(
        spacing: 10.w,
        children: [
          isNetwork
              ?
                // CachedNetworkImage(
                //     imageUrl: img,
                //     width: 30.w,
                //     height: 30.h,
                //     placeholder: (context, url) =>
                //         const CircularProgressIndicator(strokeWidth: 2),
                //     errorWidget: (context, url, error) => const Icon(Icons.error),
                //   )
                ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                    Colors.transparent,
                    BlendMode.dst, // preserves alpha exactly
                  ),
                  child: CachedNetworkImage(
                    imageUrl: img,
                    width: 30.w,
                    height: 30.h,
                    fit: BoxFit.cover,
                  ),
                )
              : Image.asset(
                  'assets/images/$img.png',
                  width: 30.w,
                  height: 30.h,
                  fit: BoxFit.cover,
                ),
          CustomText(text: name, fontSize: 12.sp, fontWeight: FontWeight.w600),
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
          color: AppColors.kGrey.withOpacity(.1),
          border: Border.all(color: AppColors.kGrey.withOpacity(.5)),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          spacing: 10.w,
          children: [
            Icon(icon, color: AppColors.kAccentPink, size: 15.sp),
            Column(
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
                  color: valueColor ?? AppColors.kLightPink.withOpacity(.5),
                  fontSize: 11.sp,
                  fontWeight: valueColor != null
                      ? FontWeight.w600
                      : FontWeight.w400,
                ),
              ],
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
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.kAccentPink
            : AppColors.kGrey.withOpacity(.1),
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

class HomeHeader extends StatelessWidget {
  final Map<String, dynamic>? currentUser;
  final bool isLoadingUser;
  const HomeHeader({super.key, this.currentUser, this.isLoadingUser = true});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Logo + Loading Indicator
            Row(
              spacing: 10.w,
              children: [
                Image.asset('assets/images/logo.png', height: 50),
                if (isLoadingUser)
                  SizedBox(
                    width: 20.w,
                    height: 20.h,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
              ],
            ),
            // Right side icons
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              decoration: BoxDecoration(
                color: AppColors.kGrey.withOpacity(.2),
                borderRadius: BorderRadius.circular(15.sp),
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
