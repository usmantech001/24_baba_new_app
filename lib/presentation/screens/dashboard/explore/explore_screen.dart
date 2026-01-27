// import 'dart:convert';
// import 'package:baba_24/core/app_route.dart';
// import 'package:baba_24/presentation/screens/dashboard/home/widgets/car_home_tile.dart';
// import 'package:baba_24/presentation/screens/onboard/widgets/app_text_field.dart';
// import 'package:baba_24/presentation/widgets/custom_text.dart';
// import 'package:baba_24/utils/app_colors.dart';
// import 'package:baba_24/utils/nav.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gap/gap.dart';
// import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart';

// class ExploreScreen extends StatefulWidget {
//   const ExploreScreen({super.key});

//   @override
//   State<ExploreScreen> createState() => _ExploreScreenState();
// }

// class _ExploreScreenState extends State<ExploreScreen> {
//   final TextEditingController _searchController = TextEditingController();

//   List<dynamic> cars = [];
//   bool loading = false;

//   /// Filters coming from FilterScreen
//   Map<String, dynamic> filters = {};

//   /// Location + date
//   String? location; // optional now
//   DateTimeRange? dateRange;

//   int page = 1;
//   final int limit = 20;

//   @override
//   void initState() {
//     super.initState();
//     fetchCars();
//   }

//   /// ---------------- API CALL ----------------
//   Future<void> fetchCars() async {
//     setState(() => loading = true);

//     final query = <String, String>{
//       'page': page.toString(),
//       'limit': limit.toString(),
//       'available': 'true', // always send
//     };

//     // Add search query if present
//     if (_searchController.text.trim().isNotEmpty) {
//       query['q'] = _searchController.text.trim();
//     }

//     // Add location if selected
//     if (location != null && location!.isNotEmpty) {
//       query['location'] = location!;
//     }

//     // Add filters dynamically
//     // ---- SORT ----
//     if (filters['sortBy'] != null) {
//       query['sortBy'] = filters['sortBy']; // backend expects "sort"
//     }

//     // ---- PRICE RANGE ----
//     if (filters['minPrice'] != null) {
//       query['minPrice'] = filters['minPrice'].toString();
//     }
//     if (filters['maxPrice'] != null) {
//       query['maxPrice'] = filters['maxPrice'].toString();
//     }

//     // ---- TRANSMISSION ----
//     if (filters['transmission'] != null) {
//       query['transmission'] = filters['transmission'];
//     }

//     // ---- FUEL TYPES ----
//     if (filters['fuelTypes'] != null) {
//       query['fuel_policy'] = filters['fuelTypes'];
//     }
//     const endpoint = '/api/cars/search';
//     final baseURL = dotenv.env['DEV_BASE_URL'] ?? '';
//     final uri = Uri.http(baseURL, endpoint, query);
//     debugPrint('Fetching cars from: $uri');
//     try {
//       final response = await http.get(uri);
//       final decoded = jsonDecode(response.body);
//       if (decoded['success'] == true) {
//         final data = decoded['data'] ?? decoded['items'];
//         setState(() {
//           if (data == null) {
//             cars = [];
//           } else if (data is List) {
//             cars = data;
//           } else if (data is Map) {
//             cars = [data]; // wrap single car in list
//           }
//         });
//       } else {
//         setState(() => cars = []);
//       }
//     } catch (e) {
//       debugPrint('Cars fetch error: $e');
//       setState(() => cars = []);
//     }
//     setState(() => loading = false);
//   }

//   /// ---------------- DATE PICKER ----------------
//   Future<void> pickDate() async {
//     final now = DateTime.now();
//     final picked = await showDateRangePicker(
//       context: context,
//       firstDate: now,
//       lastDate: now.add(const Duration(days: 365)),
//     );
//     if (picked != null) {
//       setState(() => dateRange = picked);
//     }
//   }

//   /// ---------------- LOCATION PICKER ----------------
//   Future<void> pickLocation() async {
//     final selected = await showModalBottomSheet<String>(
//       context: context,
//       builder: (_) => Column(
//         mainAxisSize: MainAxisSize.min,
//         children: ['Dubai', 'Abu Dhabi', 'Sharjah']
//             .map(
//               (city) => ListTile(
//                 title: Text(city),
//                 onTap: () => Navigator.pop(context, city),
//               ),
//             )
//             .toList(),
//       ),
//     );

//     if (selected != null) {
//       setState(() => location = selected);
//       fetchCars(); // refetch when location changes
//     }
//   }

//   /// ---------------- FILTER SCREEN ----------------
//   Future<void> openFilters() async {
//     final result = await pushNamed(AppRoutes.filter, arguments: filters);
//     if (result != null && result is Map<String, dynamic>) {
//       setState(() {
//         filters = result;
//         page = 1;
//       });
//       fetchCars(); // refetch after filters applied
//     }
//   }
//   String get dateText {
//     if (dateRange == null) return 'Select dates';
//     final f = DateFormat('dd MMM');
//     return '${f.format(dateRange!.start)} - ${f.format(dateRange!.end)}';
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(150),
//         child: Container(
//           color: AppColors.kAccentPink,
//           padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
//           child: SafeArea(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 /// -------- DATE & LOCATION --------
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     InkWell(
//                       onTap: pickDate,
//                       child: _TopChip(
//                         icon: Icons.calendar_today,
//                         text: dateText,
//                       ),
//                     ),
//                     InkWell(
//                       onTap: pickLocation,
//                       child: _TopChip(
//                         icon: Icons.location_on,
//                         text: location ?? 'Select location',
//                       ),
//                     ),
//                   ],
//                 ),
//                 Gap(20.h),

//                 /// -------- SEARCH --------
//                 Row(
//                   children: [
//                     Expanded(
//                       child: AppTextField(
//                         controller: _searchController,
//                         onSubmitted: (_) => fetchCars(),
//                         decoration: InputDecoration(
//                           hintText: 'Search cars',
//                           prefixIcon: const Icon(Icons.search),
//                           filled: true,
//                           fillColor: AppColors.kWhite,
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12),
//                             borderSide: BorderSide.none,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Gap(10.w),
//                     InkWell(
//                       onTap: openFilters,
//                       child: Icon(Icons.tune, color: AppColors.kWhite),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       /// -------- BODY --------
//       body: loading
//           ? const Center(child: CircularProgressIndicator())
//           : cars.isEmpty
//           ? const Center(child: Text('No cars found'))
//           : GridView.builder(
//               padding: EdgeInsets.all(10.w),
//               itemCount: cars.length,
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 10.w,
//                 mainAxisSpacing: 10.h,
//                 childAspectRatio: 0.57,
//               ),
//               itemBuilder: (_, i) => CarHomeTile(
//                 car: cars[i],
//                 onTap: () {
//                   pushNamed(AppRoutes.carDetails, arguments: cars[i]);
//                 },
//               ),
//             ),
//     );
//   }
// }

// class _TopChip extends StatelessWidget {
//   final IconData icon;
//   final String text;
//   const _TopChip({required this.icon, required this.text});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
//       decoration: BoxDecoration(
//         color: AppColors.kWhite.withValues(alpha: .2),
//         borderRadius: BorderRadius.circular(10.r),
//       ),
//       child: Row(
//         children: [
//           Icon(icon, color: AppColors.kWhite, size: 18.sp),
//           Gap(5.w),
//           CustomText(text: text, color: AppColors.kWhite, fontSize: 12.sp),
//           Icon(Icons.expand_more, color: AppColors.kWhite),
//         ],
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'package:baba_24/core/app_route.dart';
import 'package:baba_24/presentation/screens/dashboard/home/widgets/car_home_tile.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/app_text_field.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:baba_24/utils/nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final TextEditingController _searchController = TextEditingController();

  List<dynamic> cars = [];
  bool loading = false;

  /// Filters coming from FilterScreen
  Map<String, dynamic> filters = {};

  /// Location + date
  String? location; // default null, will be picked
  DateTimeRange? dateRange;

  int page = 1;
  final int limit = 20;

  @override
  void initState() {
    super.initState();
    fetchCars();
  }

  /// ---------------- FETCH CARS ----------------
  Future<void> fetchCars() async {
    setState(() => loading = true);

    final query = <String, String>{
      'page': page.toString(),
      'limit': limit.toString(),
      'available': 'true',
    };

    // Search query
    if (_searchController.text.trim().isNotEmpty) {
      query['q'] = _searchController.text.trim();
    }

    // Location
    if (location != null && location!.isNotEmpty) {
      query['location'] = location!;
    }

    // Date range
    if (dateRange != null) {
      query['start_date'] = dateRange!.start.toIso8601String();
      query['end_date'] = dateRange!.end.toIso8601String();
    }

    // Filters from FilterScreen
    if (filters['sortBy'] != null) query['sortBy'] = filters['sortBy'];
    if (filters['minPrice'] != null)
      query['minPrice'] = filters['minPrice'].toString();
    if (filters['maxPrice'] != null)
      query['maxPrice'] = filters['maxPrice'].toString();
    if (filters['transmission'] != null)
      query['transmission'] = filters['transmission'];
    if (filters['fuelTypes'] != null)
      query['fuel_policy'] = filters['fuelTypes'];

    final baseURL = dotenv.env['DEV_BASE_URL'] ?? '';
    final uri = Uri.http(baseURL, '/api/cars/search', query);
    debugPrint('Fetching cars: $uri');

    try {
      final response = await http.get(uri);
      final decoded = jsonDecode(response.body);

      if (decoded['success'] == true) {
        final data = decoded['data'] ?? decoded['items'];
        setState(() {
          if (data == null) {
            cars = [];
          } else if (data is List) {
            cars = data;
          } else if (data is Map) {
            cars = [data];
          }
        });
      } else {
        setState(() => cars = []);
      }
    } catch (e) {
      debugPrint('Cars fetch error: $e');
      setState(() => cars = []);
    }

    setState(() => loading = false);
  }

  /// ---------------- DATE PICKER ----------------
  Future<void> pickDate() async {
    final now = DateTime.now();
    final picked = await showDateRangePicker(
      context: context,
      firstDate: now,
      lastDate: now.add(const Duration(days: 365)),
      initialDateRange: dateRange,
    );
    if (picked != null) {
      setState(() => dateRange = picked);
      page = 1;
      fetchCars();
    }
  }

  /// ---------------- LOCATION PICKER ----------------
  Future<void> pickLocation() async {
    final selected = await showModalBottomSheet<String>(
      context: context,
      builder: (_) => Column(
        mainAxisSize: MainAxisSize.min,
        children: ['Dubai', 'Sharjah', 'Abu Dhabi']
            .map(
              (city) => ListTile(
                title: Text(city),
                onTap: () => Navigator.pop(context, city),
              ),
            )
            .toList(),
      ),
    );

    if (selected != null) {
      setState(() => location = selected);
      page = 1;
      fetchCars();
    }
  }

  /// ---------------- FILTER SCREEN ----------------
  Future<void> openFilters() async {
    final result = await pushNamed(AppRoutes.filter, arguments: filters);
    if (result != null && result is Map<String, dynamic>) {
      setState(() {
        filters = result;
        page = 1;
      });
      fetchCars();
    }
  }

  /// ---------------- DATE TEXT DISPLAY ----------------
  String get dateText {
    if (dateRange == null) return 'Select dates';
    final f = DateFormat('dd MMM');
    return '${f.format(dateRange!.start)} - ${f.format(dateRange!.end)}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: Container(
          color: AppColors.kAccentPink,
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// -------- DATE & LOCATION --------
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: pickDate,
                      child: _TopChip(
                        icon: Icons.calendar_today,
                        text: dateText,
                      ),
                    ),
                    InkWell(
                      onTap: pickLocation,
                      child: _TopChip(
                        icon: Icons.location_on,
                        text: location ?? 'Select location',
                      ),
                    ),
                  ],
                ),
                Gap(20.h),

                /// -------- SEARCH & FILTER BUTTON --------
                Row(
                  children: [
                    Expanded(
                      child: AppTextField(
                        controller: _searchController,
                        onSubmitted: (_) => fetchCars(),
                        decoration: InputDecoration(
                          hintText: 'Search cars',
                          prefixIcon: const Icon(Icons.search),
                          filled: true,
                          fillColor: AppColors.kWhite,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    Gap(10.w),
                    InkWell(
                      onTap: openFilters,
                      child: Icon(Icons.tune, color: AppColors.kWhite),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : cars.isEmpty
          ? const Center(child: Text('No cars found'))
          : GridView.builder(
              padding: EdgeInsets.all(10.w),
              itemCount: cars.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 10.h,
                childAspectRatio: 0.57,
              ),
              itemBuilder: (_, i) => CarHomeTile(
                car: cars[i],
                onTap: () =>
                    pushNamed(AppRoutes.carDetails, arguments: cars[i]),
              ),
            ),
    );
  }
}

/// ---------------- TOP CHIP WIDGET ----------------
class _TopChip extends StatelessWidget {
  final IconData icon;
  final String text;

  const _TopChip({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColors.kWhite.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.kWhite, size: 18.sp),
          Gap(5.w),
          CustomText(text: text, color: AppColors.kWhite, fontSize: 12.sp),
          const Icon(Icons.expand_more, color: AppColors.kWhite),
        ],
      ),
    );
  }
}
