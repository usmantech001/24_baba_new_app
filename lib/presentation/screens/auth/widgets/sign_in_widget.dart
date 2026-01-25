
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

class SignInWidget extends StatelessWidget {
  const SignInWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return // Form
        Consumer<AuthController>(
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
                obscureText: true,
                onToggleVisibility: () {},
                isDarkMode: false,
                maxLines: 1,
              ),
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () => pushNamed(AppRoutes.forgotPassword),
                  child: CustomText(text: 'Forgot Password?', color: AppColors.kAccentPink,))),
          
              
              const SizedBox(height: 20),
            AppButton(
              isLoading: false,
              onPressed: () {
                //controller.signUp();
                removeAllAndPushScreen(AppRoutes.bottomNav);
              },
              text: 'Sign In',
              isDarkMode: false,
            ),
              // Social icons
              /*
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SocialIcon(
                                FontAwesomeIcons.facebookF,
                                onTap: () async {
                                  await PreferencesService.setOnboardingComplete();
                                  await PreferencesService.setUserPhone(
                                      '+971401001881');
                                  if (!mounted) return;
                                  Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (_) => const HomeScreen()),
                                    (Route<dynamic> route) => false,
                                  );
                                },
                                isDarkMode: _isDarkMode,
                              ),
                              const SizedBox(width: 16),
                              SocialIcon(
                                FontAwesomeIcons.google,
                                isDarkMode: _isDarkMode,
                              ),
                              const SizedBox(width: 16),
                              SocialIcon(
                                FontAwesomeIcons.apple,
                                isDarkMode: _isDarkMode,
                              ),
                            ],
                          ),
                          */
            ],
          ),
        );
      },
    );
  }
}
