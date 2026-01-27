import 'dart:convert';

import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/custom_icon.dart';
import 'package:baba_24/presentation/widgets/custom_button.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:baba_24/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SavedCarsScreen extends StatefulWidget {
  const SavedCarsScreen({super.key});

  @override
  State<SavedCarsScreen> createState() => _SavedCarsScreenState();
}

class _SavedCarsScreenState extends State<SavedCarsScreen> {
  List<dynamic> wishlist = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchWishlist();
  }

  /// ---------------------------
  /// Fetch wishlist
  /// ---------------------------
  Future<void> fetchWishlist() async {
    setState(() => isLoading = true);

    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token') ?? '';

      final baseURL = dotenv.env['PROD_API_URL'] ?? '';
      final response = await http.get(
        Uri.parse('$baseURL/wishlist'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 && data['success'] == true) {
        setState(() {
          wishlist = data['wishlist'] ?? [];
        });
      } else {
        _showMessage(data['message'] ?? 'Failed to load favorites');
      }
    } catch (_) {
      _showMessage('Something went wrong while fetching favorites');
    } finally {
      setState(() => isLoading = false);
    }
  }

  /// ---------------------------
  /// Remove from wishlist
  /// ---------------------------
  Future<void> removeFromWishlist(String carId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token') ?? '';
      final baseURL = dotenv.env['PROD_API_URL'] ?? '';

      final response = await http.delete(
        Uri.parse('$baseURL/wishlist/$carId'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 && data['success'] == true) {
        setState(() {
          wishlist.removeWhere((item) => item['car_id'] == carId);
        });
      } else {
        _showMessage(data['message'] ?? 'Failed to remove');
      }
    } catch (e) {
      _showMessage('Something went wrong while removing');
    }
  }

  void _showMessage(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite.withValues(alpha: .95),
      appBar: const CustomAppbar(title: 'Favorites'),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : wishlist.isEmpty
          ? const Center(child: CustomText(text: 'No saved cars found'))
          : ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
              itemCount: wishlist.length,
              separatorBuilder: (_, __) => Gap(20.h),
              itemBuilder: (context, index) {
                final item = wishlist[index];
                final car = item['cars'] ?? {};

                final String carId = item['car_id'];
                final String title = car['title'] ?? 'Car';
                final String brand = car['brand'] ?? '';
                final String model = car['model'] ?? '';
                final int year = car['year'] ?? 0;
                final num? price = car['price'];

                final String imageUrl =
                    car['images']?['cover_image']?['url'] ??
                    'https://via.placeholder.com/600x400';

                return Container(
                  decoration: BoxDecoration(
                    color: AppColors.kWhite,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.r),
                              topRight: Radius.circular(20.r),
                            ),
                            child: SizedBox(
                              height: 200,
                              width: deviceWidth(context),
                              child: Image.network(imageUrl, fit: BoxFit.cover),
                            ),
                          ),
                          Positioned(
                            top: 10.h,
                            right: 10.w,
                            child: InkWell(
                              onTap: () => removeFromWishlist(carId),
                              child: const CustomIcon(
                                iconData: Icons.favorite,
                                iconColor: AppColors.kAccentPink,
                                bgColor: AppColors.kWhite,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: title,
                              fontWeight: FontWeight.bold,
                            ),
                            Gap(4.h),
                            CustomText(
                              text: '$brand $model ${year > 0 ? year : ''}',
                              color: AppColors.kDarkerGrey,
                              fontSize: 12.sp,
                            ),
                            Gap(8.h),
                            if (price != null)
                              CustomText(
                                text: '\$${price.toString()}/day',
                                fontWeight: FontWeight.w600,
                                color: AppColors.kAccentPink,
                              ),
                            Gap(10.h),
                            CustomButton(
                              topPadding: 10.h,
                              onPressed: () {},
                              text: 'Reserve',
                              height: 45,
                              borderColor: Colors.transparent,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
