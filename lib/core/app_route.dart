import 'package:baba_24/presentation/screens/auth/signin_signup_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/booking/booking_info_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/booking/confirmation_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/bottom_nav_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/cardetails/car_details_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/date/date_time_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/filter/filter_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/location/location_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/settings/security/security_screen.dart';
import 'package:baba_24/presentation/screens/onboard/onboarding_screen.dart';
import 'package:baba_24/presentation/screens/onboard/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String signInSIgnUp = '/signInSIgnUp';
  static const String bottomNav = '/bottomNav';
   static const String carDetails = '/carDetails';
  static const String filter = '/filter'; 
  static const String location = '/location'; 
  static const String dateTime = '/dateTime';
  static const String confirmation = '/confirmation';
  static const String bookingInfo = '/bookingInfo';
  static const String security = '/security';


  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
            builder: (_) => const SplashScrren(), settings: settings);
      case onboarding:
        return MaterialPageRoute(
            builder: (_) =>  OnboardingScreen(), settings: settings);
      case signInSIgnUp:
        return MaterialPageRoute(
            builder: (_) =>  SigninSignupScreen(), settings: settings); 
          case bottomNav:
        return MaterialPageRoute(
            builder: (_) =>  BottomNavScreen(), settings: settings);
           case carDetails:
        return MaterialPageRoute(
            builder: (_) =>  CarDetailsScreen(), settings: settings);  
            case filter:
        return MaterialPageRoute(
            builder: (_) =>  FilterScreen(), settings: settings);  
               case location:
        return MaterialPageRoute(
            builder: (_) =>  LocationScreen(), settings: settings);   
               case dateTime:
        return MaterialPageRoute(
            builder: (_) =>  DateTimeScreen(), settings: settings); 
             case confirmation:
        return MaterialPageRoute(
            builder: (_) =>  ConfirmationScreen(), settings: settings);
               case bookingInfo:
        return MaterialPageRoute(
            builder: (_) =>  BookingInfoScreen(), settings: settings);
            case security:
        return MaterialPageRoute(
            builder: (_) =>  SecurityScreen(), settings: settings);                              
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
