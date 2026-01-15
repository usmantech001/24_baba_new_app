import 'package:baba_24/data/controller/auth/auth_controller.dart';
import 'package:baba_24/presentation/screens/auth/widgets/sign_in_widget.dart';
import 'package:baba_24/presentation/screens/auth/widgets/sign_up_widgets.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/toggle_selector.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class SigninSignupScreen extends StatelessWidget {
  const SigninSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.kWhite),
      body: Consumer<AuthController>(
        builder: (context, controller, child) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  children: [
                    Center(child: Image.asset('assets/images/logo.png')),
                Gap(30),
                CustomText(
                  text: "Let's Get Started!",
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                ),
                Gap(20),
                ToggleSelectorWidget(
                  tabIndex: controller.currentTabIndex,
                  tabText: controller.tabs,
                  onTap: controller.changeTabIndex,
                  hasMargin: true,
                ),
                Gap(20.h),
                  ],
                ),
              ),
              Flexible(
                child: PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: controller.pageController,
                  children: [
                    SignInWidget(),
                    SignUpWidget()
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
