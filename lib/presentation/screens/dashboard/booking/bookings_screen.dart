import 'dart:convert';
import 'package:baba_24/core/app_route.dart';
import 'package:baba_24/presentation/screens/auth/widgets/booking_service.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/app_text_field.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/custom_icon.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:baba_24/utils/global.dart';
import 'package:baba_24/utils/nav.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookingsScreen extends StatefulWidget {
  const BookingsScreen({super.key});

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  List<String> status = ['Upcoming', 'Completed', 'Cancelled'];
  int selectedIndex = 0;

  List<dynamic> bookings = [];
  bool isLoading = false;
  String searchQuery = '';
  Map<String, dynamic>? currentUser;
  String? authToken;

  final bookingsService = BookingsService();
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initUserAndLoadBookings();
  }

  Future<void> _initUserAndLoadBookings() async {
    setState(() => isLoading = true);
    final prefs = await SharedPreferences.getInstance();

    // Load current user
    final userString = prefs.getString('current_user');

    if (userString != null) {
      currentUser = jsonDecode(userString);

      // debugPrint('current user profile => $currentUser');
    }

    // Load auth token
    authToken = prefs.getString('auth_token');

    await _loadBookings();
  }

  void onTabChanged(int index) async {
    selectedIndex = index;
    await _loadBookings();
  }

  Future<void> _loadBookings() async {
    if (authToken == null) {
      setState(() {
        bookings = [];
        isLoading = false;
      });
      return;
    }

    setState(() => isLoading = true);

    try {
      final data = await bookingsService.fetchBookings(
        token: authToken!,
        status: status[selectedIndex],
        q: searchQuery,
      );

      setState(() => bookings = data);
    } catch (e) {
      debugPrint('Error fetching bookings: $e');
      setState(() => bookings = []);
    } finally {
      setState(() => isLoading = false);
    }
  }

  void onSearch(String query) {
    searchQuery = query;
    _loadBookings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(deviceHeight(context) * .25),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 15.h),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if(Navigator.canPop(context)) InkWell(
                        onTap: () => popScreen(),
                        child: Icon(Icons.navigate_before)),
                      CustomText(
                        text: 'My Bookings',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      CustomIcon(iconData: Icons.notifications_outlined),
                    ],
                  ),
                ),
                Gap(20.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    spacing: 10.w,
                    children: List.generate(3, (index) {
                      return BookingStatusTile(
                        text: status[index],
                        isSelected: selectedIndex == index,
                        onTap: () => onTabChanged(index),
                      );
                    }),
                  ),
                ),
                Gap(20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: AppTextField(
                    controller: searchController,
                    onSubmitted: onSearch, // FIX
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'Search bookings',
                      prefixIcon: Icon(Icons.search),
                      fillColor: AppColors.kGrey.withValues(alpha: .1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : bookings.isEmpty
          ? Center(child: CustomText(text: 'No bookings found'))
          : ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              itemCount: bookings.length,
              separatorBuilder: (_, __) => Gap(20.h),
              itemBuilder: (context, index) {
                final booking = bookings[index];
                return InkWell(
                  onTap: () => pushNamed(
                    AppRoutes.modifyBooking,
                    arguments: booking['id'],
                  ),
                  child: BookingTile(booking: booking),
                );
              },
            ),
    );
  }
}

class BookingStatusTile extends StatelessWidget {
  const BookingStatusTile({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  final bool isSelected;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 5.h),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.kAccentPink
              : AppColors.kGrey.withValues(alpha: .3),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          spacing: 10.w,
          children: [
            CustomText(
              text: text,
              color: isSelected ? AppColors.kWhite : AppColors.kBlack,
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
            ),
          ],
        ),
      ),
    );
  }
}

class BookingTile extends StatelessWidget {
  final Map<String, dynamic> booking;

  const BookingTile({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        booking['car_image'] ??
        "https://oui4bvk5eo1qol4e.public.blob.vercel-storage.com/cars/draft-1763901772909-935-cqjm7e04n/1764062571004-01-image.webp.jpg";

    String statusText = booking['status'] ?? 'Confirmed';
    Color statusColor;
    switch (statusText.toLowerCase()) {
      case 'confirmed':
      case 'pending':
      case 'paid_20_percent':
      case 'pending_payment':
        statusColor = Colors.green;
        break;
      case 'completed':
        statusColor = Colors.blue;
        break;
      case 'cancelled':
        statusColor = Colors.red;
        break;
      default:
        statusColor = Colors.grey;
    }

    return Container(
      decoration: BoxDecoration(
        color: AppColors.kGrey.withValues(alpha: .07),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              CachedNetworkImage(
                imageUrl: imageUrl,
                height: 80.h,
                width: 100.w,
                fit: BoxFit.cover,
              ),
              CustomText(
                text: booking['booking_number'] ?? '#BK-XXXXX',
                color: AppColors.kGrey,
                fontSize: 14.sp,
              ),
            ],
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: booking['car_name'] ?? 'Car Name',
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  CustomText(
                    text: booking['pickup']['date'] ?? 'Pickup Date',
                    fontSize: 13.sp,
                    color: AppColors.kDarkerGrey,
                  ),
                  Gap(10.h),
                  RichText(
                    text: TextSpan(
                      text: 'AED ${booking['total_amount'] ?? '0'}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: ' (Total)',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.kGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(5.h),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 3.h,
                    ),
                    decoration: BoxDecoration(
                      color: statusColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: CustomText(
                      text: statusText.toUpperCase(),
                      fontSize: 10.sp,
                      color: statusColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Icon(Icons.navigate_next),
        ],
      ),
    );
  }
}
