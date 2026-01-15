import 'package:baba_24/core/app_route.dart';
import 'package:baba_24/data/model/onboarding_content_model.dart';
import 'package:baba_24/presentation/widgets/custom_button.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:baba_24/utils/nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
 const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<OnboardingContentModel> onboardingContents = [
    OnboardingContentModel(
      imagePath: 'assets/images/onboarding_1.png',
      title: 'Welcome to 24baba',
      description: 'Browse trusted cars for daily, family, or luxury rides - all in one app',
    ),
    OnboardingContentModel(
      imagePath: 'assets/images/onboarding_2.png',
      title: 'Book Your Car in Just Minutes!',
      description: 'Compare prices, choose your favorite vehicle, and confirm your booking instantly',
    ),
    OnboardingContentModel(
      imagePath: 'assets/images/onboarding_3.png',
      title: 'Get Exclusive Offers and Discounts!',
      description: 'Unlock pecial deals on car rentals and save bigon your next trip',
    ),
  ];
  final pageController = PageController();
 int currentIndex = 0;
 void onPageChanged(int index) {
  currentIndex = index;
  pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  setState(() {
    
  });
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: true,
        child: Padding(
          padding: EdgeInsets.only(bottom: 24.h),
          child: Column(
            children: [
              Expanded(
                //height: MediaQuery.sizeOf(context).height *  .7,
                child: PageView.builder(
                  controller: pageController,
                  onPageChanged: onPageChanged,
                  itemBuilder: (context, index) {
                    final content = onboardingContents[index];
                    return OnboardingPage(
                      image: content.imagePath,
                      title: content.title,
                      description: content.description,
                    );
                  },
                  itemCount: onboardingContents.length,
                ),
              ),
              Center(
                child: SmoothPageIndicator(
                 // controller: PageController(),
                  controller: pageController,
                  count: onboardingContents.length,
                  
                  effect: WormEffect(
                    activeDotColor: AppColors.kAccentPink,
                    dotHeight: 8,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: CustomButton(onPressed: (){
                  if(currentIndex==2){
                    removeAllAndPushScreen(AppRoutes.signInSIgnUp);
                  }else{
                    onPageChanged(currentIndex+1);
                  }
                  
                }, text: currentIndex==2?'Get Started': 'Next'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Image.asset(image, fit: BoxFit.cover),
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: AppColors.kBlack,
            ),
          ),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.kDarkerGrey,
              height: 1.5,
            ),
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
