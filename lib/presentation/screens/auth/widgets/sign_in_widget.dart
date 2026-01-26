import 'package:baba_24/core/app_route.dart';
import 'package:baba_24/data/controller/auth/auth_controller.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/app_button.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/app_text_field.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:baba_24/utils/nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SignInWidget extends StatefulWidget {
  const SignInWidget({super.key});

  @override
  State<SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  bool _isPasswordVisible = false; // State to toggle password visibility

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthController>(
      builder: (context, controller, child) {
        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 10.h,
            children: [
              AppTextField(
                label: 'Email',
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                isDarkMode: false,
              ),

              AppTextField(
                label: 'Password',
                controller: controller.passwordController,
                isPassword: true,
                obscureText: !_isPasswordVisible, // Toggle visibility
                onToggleVisibility: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
                isDarkMode: false,
                maxLines: 1,
              ),

              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () => pushNamed(AppRoutes.forgotPassword),
                  child: CustomText(
                    text: 'Forgot Password?',
                    color: AppColors.kAccentPink,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              AppButton(
                isLoading: controller.isLoading,
                onPressed: controller.isLoading
                    ? null
                    : () async {
                        await controller.login();
                        if (controller.status == AuthStatus.success) {
                          removeAllAndPushScreen(AppRoutes.bottomNav);
                        } else {
                          if (controller.errorMessage != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(controller.errorMessage!),
                                backgroundColor: AppColors.kAccentPink,
                              ),
                            );
                          }
                        }
                      },
                text: 'Sign In',
                isDarkMode: false,
              ),
            ],
          ),
        );
      },
    );
  }
}
