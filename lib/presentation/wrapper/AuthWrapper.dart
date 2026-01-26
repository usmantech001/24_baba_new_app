import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:baba_24/data/controller/auth/auth_controller.dart';
import 'package:baba_24/presentation/screens/dashboard/bottom_nav_screen.dart';
import 'package:baba_24/presentation/screens/onboard/onboarding_screen.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthController>();

    // ===== While checking/loading token =====
    // We also check if token has been loaded initially
    if (!auth.isTokenLoaded || auth.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    // ===== If token exists → navigate to Home =====
    if (auth.isLoggedIn) {
      return const BottomNavScreen();
    }

    // ===== Else → navigate to Onboarding/SignIn =====
    return const OnboardingScreen();
  }
}
