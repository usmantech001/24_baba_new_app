import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:baba_24/core/app_route.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/custom_icon.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:baba_24/utils/nav.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:gap/gap.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Map<String, dynamic>? currentUser;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userString = prefs.getString('current_user');
    if (userString != null) {
      setState(() {
        currentUser = jsonDecode(userString);
        isLoading = false;
      });
    } else {
      setState(() {
        currentUser = null;
        isLoading = false;
      });
    }
  }

  Future<void> _handleLogout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');

    if (token == null) {
      removeAllAndPushScreen(AppRoutes.signInSIgnUp);
      return;
    }

    final baseURL = dotenv.env['DEV_API_URL'] ?? '';
    final updatedURL = '$baseURL/auth/logout';

    try {
      final response = await http.post(
        Uri.parse(updatedURL),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      final decoded = jsonDecode(response.body);

      if (response.statusCode == 200 && decoded['success'] == true) {
        await prefs.remove('auth_token');
        await prefs.remove('current_user');

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(decoded['message'] ?? 'Logged out successfully'),
            backgroundColor: AppColors.kAccentPink,
          ),
        );
        removeAllAndPushScreen(AppRoutes.signInSIgnUp);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(decoded['message'] ?? 'Logout failed'),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Network error. Please try again.'),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final fullName = currentUser?['fullName'] ?? 'Loading...';
    final email = currentUser?['email'] ?? 'Loading...';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kWhite,
        automaticallyImplyLeading: false,
        title: CustomText(text: 'Profile'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  DottedBorder(
                    options: CircularDottedBorderOptions(
                      dashPattern: [5, 5],
                      color: AppColors.kAccentPink,
                    ),
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: AppColors.kGrey.withOpacity(.2),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: CustomIcon(
                            iconData: Icons.edit,
                            bgColor: AppColors.kAccentPink,
                            iconColor: AppColors.kWhite,
                            radius: 15,
                            iconSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(15.h),
                  CustomText(
                    text: fullName,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  CustomText(
                    text: email,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.kBlack.withOpacity(.3),
                  ),
                ],
              ),
            ),
            Gap(30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                SettingsBox(text: 'Favorite', icon: Icons.favorite_outline),
                SettingsBox(text: 'Schedule', icon: Icons.calendar_month),
                SettingsBox(text: 'Booking', icon: Icons.book_online),
              ],
            ),
            Gap(30.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              decoration: BoxDecoration(
                color: AppColors.kGrey.withOpacity(.1),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8.h,
                children: [
                  SettingsTile(
                    title: 'Edit Profile',
                    icon: Icons.person,
                    iconColor: AppColors.kAccentPink,
                    onTap: () => pushNamed(AppRoutes.account),
                  ),
                  SettingsTile(
                    title: 'Payment Methods',
                    icon: Icons.card_giftcard,
                    iconColor: Colors.orange,
                  ),
                  SettingsTile(
                    title: 'Security',
                    icon: Icons.lock,
                    iconColor: AppColors.kAccentGreen,
                    onTap: () => pushNamed(AppRoutes.security),
                  ),
                  SettingsTile(
                    title: 'KYC',
                    icon: Icons.language,
                    iconColor: Colors.orange,
                    onTap: () => pushNamed(AppRoutes.documentApprovalStatus),
                  ),
                  SettingsTile(
                    title: 'Loyalty & Rewards',
                    icon: Icons.card_giftcard,
                    iconColor: Colors.orange,
                    onTap: () => pushNamed(AppRoutes.rewards),
                  ),
                  SettingsTile(
                    title: 'Push Notification',
                    icon: Icons.notifications,
                    iconColor: Colors.blueAccent,
                    suffix: Transform.scale(
                      alignment: Alignment.centerRight,
                      scale: 0.7,
                      child: Switch(
                        value: true,
                        activeColor: AppColors.kWhite,
                        activeTrackColor: AppColors.kLightPink,
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                  SettingsTile(
                    title: 'Language',
                    icon: Icons.language,
                    iconColor: Colors.orange,
                  ),
                  SettingsTile(
                    title: 'My Address',
                    icon: Icons.location_city,
                    iconColor: Colors.indigo,
                  ),
                ],
              ),
            ),
            Gap(15.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              decoration: BoxDecoration(
                color: AppColors.kGrey.withOpacity(.1),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 5.h,
                children: [
                  SettingsTile(
                    title: 'Trust and Safety',
                    icon: Icons.help,
                    iconColor: Colors.teal,
                    onTap: () => pushNamed(AppRoutes.trustSafety),
                  ),
                  SettingsTile(
                    title: 'Refunds Policy',
                    icon: Icons.lock,
                    iconColor: Colors.teal,
                    onTap: () => pushNamed(AppRoutes.refundPolicy),
                  ),
                  SettingsTile(
                    title: 'Driver Eligibility Rules',
                    icon: Icons.lock,
                    iconColor: Colors.teal,
                    onTap: () => pushNamed(AppRoutes.driverEligibility),
                  ),
                  SettingsTile(
                    title: 'Help and Support',
                    icon: Icons.help,
                    iconColor: Colors.teal,
                    onTap: () => pushNamed(AppRoutes.helpSupport),
                  ),
                  SettingsTile(
                    title: 'Log Out',
                    icon: Icons.logout,
                    iconColor: Colors.orange,
                    onTap: () async {
                      await _handleLogout(context);
                    },
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

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    super.key,
    required this.title,
    required this.icon,
    required this.iconColor,
    this.shortDesc,
    this.shortDescColor,
    this.suffix,
    this.onTap,
  });
  final String title;
  final String? shortDesc;
  final Color iconColor;
  final IconData icon;
  final Color? shortDescColor;
  final Widget? suffix;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 15.w,
            children: [
              Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(.1),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Icon(icon, color: iconColor, size: 20.sp),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: title,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  if (shortDesc != null)
                    CustomText(
                      text: shortDesc!,
                      color: shortDescColor ?? AppColors.kGrey.withOpacity(.8),
                      fontSize: 12.sp,
                    ),
                ],
              ),
            ],
          ),
          suffix ?? const Icon(Icons.navigate_next, color: AppColors.kGrey),
        ],
      ),
    );
  }
}

class SettingsBox extends StatelessWidget {
  const SettingsBox({super.key, required this.text, required this.icon});

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      decoration: BoxDecoration(
        color: AppColors.kAccentPink.withOpacity(.15),
        borderRadius: BorderRadius.circular(15.sp),
      ),
      child: Column(
        spacing: 8.h,
        children: [
          Icon(icon, color: AppColors.kAccentPink),
          CustomText(text: text, fontSize: 12.sp),
        ],
      ),
    );
  }
}
