import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:baba_24/core/app_route.dart';
import 'package:baba_24/data/controller/auth/auth_controller.dart';
import 'package:baba_24/data/controller/booking/booking_controller.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:baba_24/utils/nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:baba_24/presentation/wrapper/AuthWrapper.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  print(dotenv.env['DEV_BASE_URL']);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthController()),
        ChangeNotifierProvider(create: (_) => BookingController()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        ensureScreenSize: true,
        minTextAdapt: true,
        useInheritedMediaQuery: true,
        child: MaterialApp(
          title: '24_BABA',
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          theme: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            primaryColor: AppColors.kAccentPink,
            textTheme: Theme.of(
              context,
            ).textTheme.apply(fontFamilyFallback: ['Roboto', 'sans-serif']),
            scaffoldBackgroundColor: AppColors.kWhite,
            appBarTheme: const AppBarTheme(scrolledUnderElevation: 0),
          ),

          // ← use the AuthWrapper as the home
          home: const AuthWrapper(),

          // Keep route generation for deep links
          onGenerateRoute: AppRoutes.generateRoute,
        ),
      ),
    );
  }
}
