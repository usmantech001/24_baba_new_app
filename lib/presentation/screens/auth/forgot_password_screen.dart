import 'dart:convert';
import 'package:baba_24/presentation/screens/onboard/widgets/app_text_field.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
import 'package:baba_24/presentation/widgets/custom_button.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;

  Future<void> _sendResetLink() async {
    final email = _emailController.text.trim();

    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your email address'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final baseURL = dotenv.env['PROD_API_URL'] ?? '';
      final updatedURL = '$baseURL/auth/reset-password';

      final url = Uri.parse(updatedURL);
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email}),
      );

      final result = jsonDecode(response.body);

      if (result['success'] == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(result['message'] ?? 'Reset link sent!'),
            backgroundColor: AppColors.kAccentPink,
          ),
        );

        // Wait 2 seconds, then go back automatically
        Future.delayed(const Duration(seconds: 2), () {
          if (mounted) {
            Navigator.pop(context);
          }
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(result['message'] ?? 'Something went wrong'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to send reset link'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: ''),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50.r,
                backgroundColor: AppColors.kAccentPink.withOpacity(0.1),
              ),
            ),
            Gap(40.h),
            const CustomText(
              text: 'Forgot Password?',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            Gap(10.h),
            const CustomText(
              text:
                  'Enter the email address associated with your account and we will send you a link to reset your password and get back on the road',
              color: AppColors.kDarkerGrey,
              fontSize: 14,
            ),
            Gap(30.h),
            AppTextField(
              controller: _emailController,
              label: 'Email Address',
              prefixIcon: const Icon(Icons.mail, color: AppColors.kAccentPink),
              hintText: 'e.g ali@gmail.com',
            ),
            Gap(20.h),
            CustomButton(
              onPressed: () {
                if (!_isLoading) _sendResetLink(); // Always Non-null
              },
              text: _isLoading ? 'Sending...' : 'Send Reset Link',
            ),
          ],
        ),
      ),
    );
  }
}
