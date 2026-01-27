import 'package:baba_24/presentation/screens/auth/account_verification_screen.dart';
import 'package:baba_24/presentation/screens/auth/forgot_password_screen.dart';
import 'package:baba_24/presentation/screens/auth/signin_signup_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/RateExperince/post_trip_report_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/RateExperince/rate_experience_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/booking/booking_appreciation_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/booking/booking_info_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/booking/booking_status_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/booking/bookings_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/booking/confirmation_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/booking/feedback_appreciation_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/booking/insurance_details_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/booking/modify_booking_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/booking/social_confirmation_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/bottom_nav_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/brands/all_brands_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/cars/car_details_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/cars/compare_car_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/cars/price_details_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/cars/saved_cars_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/date/date_time_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/driver/additional_driver_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/driver/driver_eligibility_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/filter/filter_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/kyc/document_approval_status_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/kyc/document_rejection_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/kyc/document_verification_status_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/kyc/identity_verification_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/location/location_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/notification/notification_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/payment/payment_history_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/payment/payment_methods_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/payment/payment_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/payment/payment_status_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/payment/refund_status_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/promocode/promo_code_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/promotion/promotion_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/rewards/all_rewards_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/rewards/loyalty_rewards_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/settings/account_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/settings/address/add_address_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/settings/address/address_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/settings/fee/fee_transparency_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/settings/fee/security_deposit_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/settings/help/contact_support_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/settings/help/emergency_support_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/settings/help/help_support_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/settings/help/legacy_trust_privacy_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/settings/help/refund_policy_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/settings/help/road_assistance_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/settings/help/support_center_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/settings/help/support_faq_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/settings/help/support_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/settings/help/trust_safety_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/settings/languageCurrency/language_currency_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/settings/security/security_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/trip/extra_trip_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/wallet/wallet_screen.dart';
import 'package:baba_24/presentation/screens/onboard/onboarding_screen.dart';
import 'package:baba_24/presentation/screens/onboard/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String signInSIgnUp = '/signInSIgnUp';
  static const String forgotPassword = '/forgotPassword';
  static const String bottomNav = '/bottomNav';
   static const String carDetails = '/carDetails';
  static const String filter = '/filter'; 
  static const String location = '/location'; 
  static const String dateTime = '/dateTime';
  static const String confirmation = '/confirmation';
  static const String socialConfirmation = '/socialConfirmation';
  static const String bookingInfo = '/bookingInfo';
  static const String security = '/security';
  static const String notifications = '/notifications';
  static const String account = '/account';
  static const String allBrands = '/allBrands';
  static const String rewards = '/rewards';
  static const String promo = '/promo';
  static const String helpSupport = '/helpSupport';
  static const String modifyBooking = '/modifyBooking';
  static const String bookingAppreciation = '/bookingAppreciation';
  static const String rateExperience = '/rateExperience';
  static const String postTripReport = '/postTripReport';
  static const String supportCenter = '/supportCenter';
   static const String paymentHistory = '/paymentHistory';
  static const String trustSafety = '/trustSafety';
  static const String emergencySupport = '/emergencySupport';
  static const String legacyTrustPrivacy = '/legacyTrustPrivacy'; 
  static const String feedbackAppreciation = '/feedbackAppreciation';   
  static const String feeTransparency = '/feeTransparency'; 
  static const String securityDeposit = '/securityDeposit';
  static const String promotion = '/promotion'; 
  static const String savedCars = '/savedCars';  
  static const String paymentMethods = '/paymentMethods';
  static const String contactSupport = '/contactSupport';
  static const String support = '/support';
  static const String faq = '/faq';
  static const String priceDetails = '/priceDetails';
  static const String extraTrip = '/extraTrip';
  static const String payment = '/payment';
  static const String accountVerification = '/accountVerification';
  static const String allRewards = '/allRewards';
  static const String roadAssistance = '/roadAssistance';
  static const String insuranceDetails = '/insuranceDetails';
  static const String refundStatus = '/refundStatus';
  static const String paymentStatus = '/paymentStatus';
  static const String wallet = '/wallet';
  static const String driverEligibility = '/driverEligibility';
  static const String documentApprovalStatus = '/documentApprovalStatus';
  static const String refundPolicy = '/refundPolicy';
  static const String bookingStatus = '/bookingStatus';
  static const String identity = '/identity';
  static const String documentRejection = '/documentRejection';
  static const String compareCars = '/compareCars';
  static const String documentVerificationProgress = '/documentVerificationProgress';
  static const String additionalDriver = '/additionalDriver';
  static const String bookings = '/bookings';
  static const String languageCurrency = '/languageCurrency';
  static const String addresses = '/addresses';
  static const String addAddress = '/addAddress';

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
           case socialConfirmation:
        return MaterialPageRoute(
            builder: (_) =>  SocialConfirmationScreen(), settings: settings);    
               case bookingInfo:
        return MaterialPageRoute(
            builder: (_) =>  BookingInfoScreen(), settings: settings);
            case security:
        return MaterialPageRoute(
            builder: (_) =>  SecurityScreen(), settings: settings); 
        case notifications:
        return MaterialPageRoute(
            builder: (_) =>  NotificationScreen(), settings: settings);       
      case account:
        return MaterialPageRoute(
            builder: (_) =>  AccountScreen(), settings: settings);  
        case allBrands:
        return MaterialPageRoute(
            builder: (_) =>  AllBrandsScreen(), settings: settings); 
       case rewards:
        return MaterialPageRoute(
            builder: (_) =>  LoyaltyRewardsScreen(), settings: settings); 
            case promo:
        return MaterialPageRoute(
            builder: (_) =>  PromoCodeScreen(), settings: settings);     
              case helpSupport:
        return MaterialPageRoute(
            builder: (_) =>  HelpSupportScreen(), settings: settings); 
           case modifyBooking:
        return MaterialPageRoute(
            builder: (_) =>  ModifyBookingScreen(), settings: settings);    
           case bookingAppreciation:
        return MaterialPageRoute(
            builder: (_) =>  BookingAppreciationScreen(), settings: settings);   
        case rateExperience:
        return MaterialPageRoute(
            builder: (_) =>  RateExperienceScreen(), settings: settings);   
       case postTripReport:
        return MaterialPageRoute(
            builder: (_) =>  PostTripReportScreen(), settings: settings);
       case supportCenter:
        return MaterialPageRoute(
            builder: (_) =>  SupportCenterScreen(), settings: settings); 
      case paymentHistory:
        return MaterialPageRoute(
            builder: (_) =>  PaymentHistoryScreen(), settings: settings); 
      case trustSafety:
        return MaterialPageRoute(
            builder: (_) =>  TrustSafetyScreen(), settings: settings); 
        case emergencySupport:
        return MaterialPageRoute(
            builder: (_) =>  EmergencySupportScreen(), settings: settings);   
      case legacyTrustPrivacy:
        return MaterialPageRoute(
            builder: (_) =>  LegacyTrustPrivacyScreen(), settings: settings); 
      case feedbackAppreciation:
        return MaterialPageRoute(
            builder: (_) =>  FeedbackAppreciationScreen(), settings: settings);
      case feeTransparency:
        return MaterialPageRoute(
            builder: (_) =>  FeeTransparencyScreen(), settings: settings);
      case securityDeposit:
        return MaterialPageRoute(
            builder: (_) =>  SecurityDepositScreen(), settings: settings); 
        case promotion:
        return MaterialPageRoute(
            builder: (_) =>  PromotionScreen(), settings: settings);   
     case savedCars:
        return MaterialPageRoute(
            builder: (_) =>  SavedCarsScreen(), settings: settings);
     case paymentMethods:
        return MaterialPageRoute(
            builder: (_) =>  PaymentMethodsScreen(), settings: settings);
      case contactSupport:
        return MaterialPageRoute(
            builder: (_) =>  ContactSupportScreen(), settings: settings); 
      case support:
        return MaterialPageRoute(
            builder: (_) =>  SupportScreen(), settings: settings);
      case faq:
        return MaterialPageRoute(
            builder: (_) =>  SupportFaqScreen(), settings: settings);   
       case priceDetails:
        return MaterialPageRoute(
            builder: (_) =>  PriceDetailsScreen(), settings: settings);
      case extraTrip:
        return MaterialPageRoute(
            builder: (_) =>  ExtraTripScreen(), settings: settings);  
      case payment:
        return MaterialPageRoute(
            builder: (_) =>  PaymentScreen(), settings: settings); 
      case forgotPassword:
        return MaterialPageRoute(
            builder: (_) =>  ForgotPasswordScreen(), settings: settings); 
      case accountVerification:
        return MaterialPageRoute(
            builder: (_) =>  AccountVerificationScreen(), settings: settings); 
      case allRewards:
        return MaterialPageRoute(
            builder: (_) =>  AllRewardsScreen(), settings: settings); 
      case roadAssistance:
        return MaterialPageRoute(
            builder: (_) =>  RoadAssistanceScreen(), settings: settings); 
    case insuranceDetails:
        return MaterialPageRoute(
            builder: (_) =>  InsuranceDetailsScreen(), settings: settings);  
    case refundStatus:
        return MaterialPageRoute(
            builder: (_) =>  RefundStatusScreen(), settings: settings);
    case paymentStatus:
        return MaterialPageRoute(
            builder: (_) =>  PaymentStatusScreen(), settings: settings);
   case driverEligibility:
        return MaterialPageRoute(
            builder: (_) =>  DriverEligibilityScreen(), settings: settings);  
   case documentApprovalStatus:
        return MaterialPageRoute(
            builder: (_) =>  DocumentApprovalStatusScreen(), settings: settings); 
  case refundPolicy:
        return MaterialPageRoute(
            builder: (_) =>  RefundPolicyScreen(), settings: settings);  
  case bookingStatus:
        return MaterialPageRoute(
            builder: (_) =>  BookingStatusScreen(), settings: settings);  
    case identity:
        return MaterialPageRoute(
            builder: (_) =>  IdentityVerificationScreen(), settings: settings);
    case documentRejection:
        return MaterialPageRoute(
            builder: (_) =>  DocumentRejectionScreen(), settings: settings); 
    case wallet:
        return MaterialPageRoute(
            builder: (_) =>  WalletScreen(), settings: settings);  
    case compareCars:
        return MaterialPageRoute(
            builder: (_) =>  CompareClassScreen(), settings: settings);
    case documentVerificationProgress:
        return MaterialPageRoute(
            builder: (_) =>  VerificationProgressScreen(), settings: settings); 
    case additionalDriver:
        return MaterialPageRoute(
            builder: (_) =>  AdditionalDriversScreen(), settings: settings);   
    case bookings:
        return MaterialPageRoute(
            builder: (_) =>  BookingsScreen(), settings: settings);     
    case languageCurrency:
        return MaterialPageRoute(
            builder: (_) =>  LanguageCurrencyScreen(), settings: settings);  
   case addresses:
        return MaterialPageRoute(
            builder: (_) =>  AddressSettingsScreen(), settings: settings);    
            case addAddress:
        return MaterialPageRoute(
            builder: (_) =>  AddAddressScreen(), settings: settings);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
