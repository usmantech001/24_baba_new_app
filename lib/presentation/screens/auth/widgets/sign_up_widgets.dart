import 'dart:convert';
import 'package:baba_24/data/controller/auth/auth_controller.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/app_button.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/app_text_field.dart';
import 'package:baba_24/utils/nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:baba_24/core/app_route.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({super.key});

  // ==================== SIGNUP FUNCTION ====================
  Future<void> _handleSignUp(
    BuildContext context,
    AuthController controller,
  ) async {
    final fullName = controller.nameController.text.trim();
    final email = controller.emailController.text.trim();
    final phone = controller.phoneController.text.trim();
    final password = controller.passwordController.text.trim();

    if (fullName.isEmpty ||
        email.isEmpty ||
        phone.isEmpty ||
        password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all fields'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    try {
      // Show loading
      controller.status = AuthStatus.loading;
      controller.notifyListeners();

      final baseURL = dotenv.env['PROD_API_URL'] ?? '';
      final updatedURL = '$baseURL/auth/signup';

      final url = Uri.parse(updatedURL);

      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "fullName": fullName,
          "email": email,
          "phone": phone,
          "password": password,
          "role": "user",
          "countryCode": "AE",
        }),
      );

      // Hide loading
      controller.status = AuthStatus.idle;
      controller.notifyListeners();

      final decoded = jsonDecode(response.body);

      if ((response.statusCode == 201 || response.statusCode == 200) &&
          decoded['success'] == true) {
        // Signup successful, store the token
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('auth_token', decoded['data']['accessToken']);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(decoded['message'] ?? 'Signup successful'),
            backgroundColor: Colors.green,
          ),
        );

        // Navigate to BottomNav screen
        removeAllAndPushScreen(AppRoutes.bottomNav);
      } else {
        // Signup failed
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(decoded['message'] ?? 'Signup failed'),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    } catch (e) {
      controller.status = AuthStatus.idle;
      controller.notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Network error. Please try again.'),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthController>(
      builder: (context, controller, child) {
        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppTextField(
                label: 'Name',
                controller: controller.nameController,
                keyboardType: TextInputType.name,
                isDarkMode: false,
              ),
              const SizedBox(height: 10),
              AppTextField(
                label: 'Email',
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                isDarkMode: false,
              ),
              const SizedBox(height: 10),
              AppTextField(
                label: 'Phone Number',
                controller: controller.phoneController,
                keyboardType: TextInputType.phone,
                isDarkMode: false,
              ),
              const SizedBox(height: 10),
              AppTextField(
                label: 'Password',
                controller: controller.passwordController,
                isPassword: true,
                obscureText: true,
                onToggleVisibility: () {},
                isDarkMode: false,
                maxLines: 1,
              ),
              Gap(20.h),
              AppButton(
                isLoading: controller.isLoading,
                onPressed: controller.isLoading
                    ? null
                    : () => _handleSignUp(context, controller),
                text: 'Sign Up',
                isDarkMode: false,
              ),
            ],
          ),
        );
      },
    );
  }
}
