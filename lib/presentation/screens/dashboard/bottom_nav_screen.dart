
import 'package:baba_24/core/app_route.dart';
import 'package:baba_24/presentation/screens/dashboard/booking/bookings_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/cars/saved_cars_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/explore/explore_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/home/home_screen.dart';
import 'package:baba_24/presentation/screens/dashboard/settings/settings_screen.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/custom_icon.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:baba_24/utils/nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final List<Widget> screens =  [
    
    HomeScreen(),
    ExploreScreen(),
    BookingsScreen(),
    SavedCarsScreen(),
    SettingsScreen(),
  //    ServicesScreen(),
  //   HistoryScreen(),
  //  RewardsScreen(),
  //   SettingsTab()
  ];
  int currentIndex = 0;

  changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () => pushNamed(AppRoutes.liveChat),
        child: CircleAvatar(
          radius: 25.r,
          backgroundColor: AppColors.kAccentPink,
          child: Icon(Icons.message, color: AppColors.kWhite,),
        ),
      ),
      bottomNavigationBar: SizedBox(
        //height: 80.h,
        child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (value) => changeIndex(value),
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.kWhite,
            selectedItemColor: AppColors.kAccentPink,
            unselectedItemColor: AppColors.kGrey.withValues(alpha: .45),
            enableFeedback: false,
            elevation: 0.0,
            //selectedLabelStyle: get12TextStyle(),
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                // icon:   svgImage(
                //       imgPath: 'assets/icons/inactive-home-icon.svg',),
                //            activeIcon:   svgImage(
                //       imgPath: 'assets/icons/active-home-icon.svg',),
                  label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                  // icon:   svgImage(
                  //     imgPath: 'assets/icons/inactive-services-icon.svg',),
                  //          activeIcon:   svgImage(
                  //     imgPath: 'assets/icons/active-services-icon.svg',),
                  label: 'Explore'),
              BottomNavigationBarItem(
                icon: Icon(Icons.event),
                  // icon:   svgImage(
                  //     imgPath: 'assets/icons/inactive-history-icon.svg',),
                  //          activeIcon:   svgImage(
                  //     imgPath: 'assets/icons/active-history-icon.svg',),
                  label: 'Bookings'),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                  // icon:   svgImage(
                  //     imgPath: 'assets/icons/inactive-rewards-icon.svg',),
                  //          activeIcon:   svgImage(
                  //     imgPath: 'assets/icons/active-rewards-icon.svg',),
                  label: 'Favorite'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  // svgImage(
                  //     imgPath: AppImages.settingIcon,
                  //     color: currentIndex == 4
                  //         ? AppColors.kPrimaryColor
                  //         : AppColors.kGrey66),
                  label: 'Settings'),
            ]),
      ),
      body: screens[currentIndex],
    );
  }
}
