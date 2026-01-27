// import 'dart:convert';

// import 'package:baba_24/presentation/screens/onboard/widgets/app_text_field.dart';
// import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
// import 'package:baba_24/presentation/screens/onboard/widgets/custom_icon.dart';
// import 'package:baba_24/presentation/widgets/custom_button.dart';
// import 'package:baba_24/presentation/widgets/custom_text.dart';
// import 'package:baba_24/utils/app_colors.dart';
// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gap/gap.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// class AccountScreen extends StatefulWidget {
//   const AccountScreen({super.key});

//   @override
//   State<AccountScreen> createState() => _AccountScreenState();
// }

// class _AccountScreenState extends State<AccountScreen> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();

//   String? email;
//   String? fullName;
//   String? phone;

//   bool isLoading = true;
//   bool isUpdating = false;

//   @override
//   void initState() {
//     super.initState();
//     _loadUserData();
//   }

//   Future<void> _loadUserData() async {
//     final prefs = await SharedPreferences.getInstance();
//     final userString = prefs.getString('current_user');

//     if (userString != null) {
//       final decoded = jsonDecode(userString);

//       email = decoded['email'];
//       fullName = decoded['fullName'];
//       phone = decoded['phone'];

//       _emailController.text = email ?? '';
//       _usernameController.text = fullName ?? '';
//       _phoneController.text = phone ?? '';
//     }

//     setState(() => isLoading = false);
//   }

//   Future<void> _updateUser() async {
//     if (isUpdating) return;

//     setState(() => isUpdating = true);

//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('auth_token');

//       if (token == null) {
//         _showMessage('Authentication token missing');
//         return;
//       }

//       final baseURL = dotenv.env['PROD_API_URL'] ?? '';
//       final updatedURL = '$baseURL/auth/update-user';

//       final response = await http.post(
//         Uri.parse(updatedURL),
//         headers: {
//           'Content-Type': 'application/json',
//           'Authorization': 'Bearer $token',
//         },
//         body: jsonEncode({
//           "data": {"phone": _phoneController.text.trim(), "countryCode": "BD"},
//         }),
//       );

//       final decoded = jsonDecode(response.body);
//       debugPrint('decoded profile update API ==> $decoded');

//       if (response.statusCode == 200 && decoded['success'] == true) {
//         final updatedUser = decoded['data']['user'];

//         final updatedLocalUser = {
//           "email": updatedUser['email'],
//           "fullName": updatedUser['user_metadata']['fullName'],
//           "phone": updatedUser['user_metadata']['phone'],
//         };

//         await prefs.setString('current_user', jsonEncode(updatedLocalUser));

//         if (!mounted) return;

//         setState(() {
//           fullName = updatedLocalUser['fullName'];
//           phone = updatedLocalUser['phone'];
//         });

//         _showMessage('Profile updated successfully');
//       } else {
//         _showMessage(decoded['message'] ?? 'Update failed');
//       }
//     } catch (e) {
//       _showMessage('Something went wrong');
//     } finally {
//       if (mounted) {
//         setState(() => isUpdating = false);
//       }
//     }
//   }

//   void _showMessage(String message) {
//     ScaffoldMessenger.of(
//       context,
//     ).showSnackBar(SnackBar(content: Text(message)));
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _usernameController.dispose();
//     _phoneController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (isLoading) {
//       return const Scaffold(body: Center(child: CircularProgressIndicator()));
//     }

//     return Scaffold(
//       appBar: const CustomAppbar(title: 'Account'),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
//         child: Column(
//           children: [
//             Center(
//               child: Column(
//                 children: [
//                   DottedBorder(
//                     options: CircularDottedBorderOptions(
//                       dashPattern: const [5, 5],
//                       color: AppColors.kAccentPink,
//                     ),
//                     child: Stack(
//                       children: [
//                         CircleAvatar(
//                           radius: 50,
//                           backgroundColor: AppColors.kGrey.withValues(
//                             alpha: .2,
//                           ),
//                         ),
//                         Positioned(
//                           bottom: 0,
//                           right: 0,
//                           child: CustomIcon(
//                             iconData: Icons.edit,
//                             bgColor: AppColors.kAccentPink,
//                             iconColor: AppColors.kWhite,
//                             radius: 15,
//                             iconSize: 15,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Gap(15.h),
//                   CustomText(
//                     text: fullName ?? '',
//                     fontSize: 18.sp,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ],
//               ),
//             ),
//             Gap(50.h),
//             Column(
//               children: [
//                 AppTextField(
//                   controller: _emailController,
//                   label: 'Email',
//                   readOnly: true,
//                 ),
//                 Gap(20.h),
//                 AppTextField(
//                   controller: _usernameController,
//                   label: 'Username',
//                 ),
//                 Gap(20.h),
//                 AppTextField(
//                   controller: _phoneController,
//                   label: 'Phone Number',
//                 ),
//                 Gap(30.h),
//                 CustomButton(
//                   onPressed: () {
//                     if (isUpdating) {
//                       _updateUser();
//                     }
//                   },
//                   text: isUpdating ? 'Saving...' : 'Save',
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';

import 'package:baba_24/presentation/screens/onboard/widgets/app_text_field.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/custom_icon.dart';
import 'package:baba_24/presentation/widgets/custom_button.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  String? email;
  String? fullName;
  String? phone;

  bool isLoading = true;
  bool isUpdating = false;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userString = prefs.getString('current_user');

    if (userString != null) {
      final decoded = jsonDecode(userString);

      email = decoded['email'];
      fullName = decoded['fullName'];
      phone = decoded['phone'];

      _emailController.text = email ?? '';
      _usernameController.text = fullName ?? '';
      _phoneController.text = phone ?? '';
    }

    setState(() => isLoading = false);
  }

  Future<void> _updateUser() async {
    if (isUpdating) return;

    setState(() => isUpdating = true);

    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');

      if (token == null) {
        _showMessage('Authentication token missing');
        setState(() => isUpdating = false);
        return;
      }

      final baseURL = dotenv.env['PROD_API_URL'] ?? '';
      final updatedURL = '$baseURL/auth/update-user';

      // Build request body dynamically
      final Map<String, dynamic> requestBody = {
        "data": {"phone": _phoneController.text.trim(), "countryCode": "BD"},
      };

      if (_usernameController.text.trim() != fullName) {
        requestBody['data']['fullName'] = _usernameController.text.trim();
      }

      if (_emailController.text.trim() != email) {
        requestBody['email'] = _emailController.text.trim();
      }

      final response = await http.post(
        Uri.parse(updatedURL),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(requestBody),
      );

      final decoded = jsonDecode(response.body);

      if (response.statusCode == 200 && decoded['success'] == true) {
        final updatedUser = decoded['data']['user'];

        final updatedLocalUser = {
          "email": updatedUser['email'],
          "fullName": updatedUser['user_metadata']['fullName'],
          "phone": updatedUser['user_metadata']['phone'],
        };

        await prefs.setString('current_user', jsonEncode(updatedLocalUser));

        if (!mounted) return;

        setState(() {
          email = updatedLocalUser['email'];
          fullName = updatedLocalUser['fullName'];
          phone = updatedLocalUser['phone'];

          _emailController.text = email ?? '';
          _usernameController.text = fullName ?? '';
          _phoneController.text = phone ?? '';
        });

        _showMessage('Profile updated successfully');
      } else {
        _showMessage(decoded['message'] ?? 'Update failed');
      }
    } catch (e) {
      _showMessage('Something went wrong: $e');
    } finally {
      if (mounted) {
        setState(() => isUpdating = false);
      }
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: const CustomAppbar(title: 'Account'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  DottedBorder(
                    options: CircularDottedBorderOptions(
                      dashPattern: const [5, 5],
                      color: AppColors.kAccentPink,
                    ),
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: AppColors.kGrey.withValues(
                            alpha: .2,
                          ),
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
                    text: fullName ?? '',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
            Gap(50.h),
            Column(
              children: [
                AppTextField(
                  controller: _emailController,
                  label: 'Email',
                  readOnly: true,
                ),
                Gap(20.h),
                AppTextField(
                  controller: _usernameController,
                  label: 'Username',
                ),
                Gap(20.h),
                AppTextField(
                  controller: _phoneController,
                  label: 'Phone Number',
                ),
                Gap(30.h),
                CustomButton(
                  onPressed: _updateUser, //  Always call the function
                  text: isUpdating ? 'Saving...' : 'Save',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
