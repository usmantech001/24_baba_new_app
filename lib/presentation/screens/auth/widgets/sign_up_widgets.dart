
import 'package:baba_24/data/controller/auth/auth_controller.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/app_button.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return // Form
        Consumer<AuthController>(
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
              ),
            Gap(20.h),
             AppButton(
              isLoading: false,
              onPressed: () {
                //controller.signUp();
              },
              text: 'Sign Up',
              isDarkMode: false,
            ),
              /*
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 24,
                                width: 24,
                                child: Checkbox(
                                  value: _consentChecked,
                                  onChanged: (val) {
                                    setState(() {
                                      _consentChecked = val ?? false;
                                    });
                                  },
                                  activeColor: kAccentPink,
                                  checkColor: _isDarkMode ? kWhite : null,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      color: kBlack,
                                      fontSize: 14,
                                      height: 1.4,
                                    ),
                                    children: [
                                      TextSpan(
                                          text: AppLocalizations.of(context)!
                                              .privacyConsent),
                                      TextSpan(
                                        text: AppLocalizations.of(context)!
                                            .personalDataAnd,
                                        style: const TextStyle(color: kAccentPink),
                                      ),
                                      TextSpan(
                                          text: AppLocalizations.of(context)!
                                              .andAccept),
                                      TextSpan(
                                        text: AppLocalizations.of(context)!
                                            .privacyPolicy,
                                        style: const TextStyle(color: kAccentPink),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                      
                          */
          
              
              // LoadingButton(
              //   isLoading: false,
              //   onPressed: () {
              //     controller.signUp();
              //   },
              //   text: AppLocalizations.of(context)!.signUp,
              //   isDarkMode: false,
              // ),
              /*
                          // Quick theme toggle for debugging
                          if (_isLoading == false)
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    _isDarkMode ? Icons.dark_mode : Icons.light_mode,
                                    color: _iconColor,
                                    size: 16,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    'Current: ${_isDarkMode ? 'Dark' : 'Light'}',
                                    style: TextStyle(
                                      color: _hintColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            */
         
              // Or continue with divider
              /*
                          Row(
                            children: [
                              Expanded(child: Divider(color: _dividerColor)),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  AppLocalizations.of(context)!.orContinueWith,
                                  style: TextStyle(color: _hintColor),
                                ),
                              ),
                              Expanded(child: Divider(color: _dividerColor)),
                            ],
                          ),
                          */
             
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
