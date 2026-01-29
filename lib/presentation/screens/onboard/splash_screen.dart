
import 'package:baba_24/core/app_route.dart';
import 'package:baba_24/utils/nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScrren extends StatefulWidget {
  const SplashScrren({super.key});

  @override
  State<SplashScrren> createState() => _SplashScrrenState();
}

class _SplashScrrenState extends State<SplashScrren>
    with SingleTickerProviderStateMixin {
  final scale = Tween<double>(
    begin: 0.0,
    end: 1.0,
  ).chain(CurveTween(curve: Curves.easeInOut));
  late AnimationController controller;

  void nextScreen() async {
    Future.delayed(const Duration(seconds: 2)).then((_) {
      removeAllAndPushScreen(AppRoutes.onboarding);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    controller.forward();
    nextScreen();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: scale.animate(controller),
          child: Image.asset('assets/images/logo.png', width: 200.w,),
          
        ),
      ),
    );
  }
}
