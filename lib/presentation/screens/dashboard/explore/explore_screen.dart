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
  final ScrollController _scrollController = ScrollController();

  List<dynamic> cars = [];
  bool loading = false;
  bool loadingMore = false; // For pagination loading
  bool hasMore = true; // Whether more pages are available

  Map<String, dynamic> filters = {};
  String? location;
  DateTimeRange? dateRange;

  int page = 1;
  final int limit = 20;

  @override
  void initState() {
    super.initState();
    fetchCars();

    // ------------------ SCROLL LISTENER ------------------
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 200 &&
          !loadingMore &&
          hasMore &&
          !loading) {
        page++;
        fetchCars(append: true);
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  /// ---------------- FETCH CARS ----------------
  Future<void> fetchCars({bool append = false}) async {
    if (!append) setState(() => loading = true);
    if (append) setState(() => loadingMore = true);

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
    if (filters['minPrice'] != null) {
      query['minPrice'] = filters['minPrice'].toString();
    }
    if (filters['maxPrice'] != null) {
      query['maxPrice'] = filters['maxPrice'].toString();
    }
    if (filters['transmission'] != null) {
      query['transmission'] = filters['transmission'];
    }
    if (filters['fuelTypes'] != null) {
      query['fuel_policy'] = filters['fuelTypes'];
    }

    final baseURL = dotenv.env['PROD_BASE_URL'].toString();
    final uri = Uri.https(baseURL, '/api/cars/search', query);
    debugPrint('Fetching cars: $uri');

    try {
      final response = await http.get(uri);
      final decoded = jsonDecode(response.body);

      if (decoded['success'] == true) {
        final data = decoded['data'] ?? decoded['items'];
        setState(() {
          if (data == null || (data is List && data.isEmpty)) {
            if (!append) cars = [];
            hasMore = false;
          } else if (data is List) {
            if (append) {
              cars.addAll(data);
            } else {
              cars = data;
            }
            hasMore = data.length == limit; // If less than limit, no more pages
          } else if (data is Map) {
            if (append) {
              cars.add(data);
            } else {
              cars = [data];
            }
            hasMore = false;
          }
        });
      } else {
        setState(() {
          if (!append) cars = [];
          hasMore = false;
        });
      }
    } catch (e) {
      debugPrint('Cars fetch error: $e');
      setState(() {
        if (!append) cars = [];
        hasMore = false;
      });
    }

    if (!append) setState(() => loading = false);
    if (append) setState(() => loadingMore = false);
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
      hasMore = true;
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
      hasMore = true;
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
        hasMore = true;
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
                        onSubmitted: (_) {
                          page = 1;
                          hasMore = true;
                          fetchCars();
                        },
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
      body: loading && cars.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : cars.isEmpty
          ? const Center(child: Text('No cars found'))
          : RefreshIndicator(
              onRefresh: () async {
                page = 1;
                hasMore = true;
                await fetchCars();
              },
              child: GridView.builder(
                controller: _scrollController,
                padding: EdgeInsets.all(10.w),
                itemCount: cars.length + (loadingMore ? 1 : 0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                  childAspectRatio: 0.57,
                ),
                itemBuilder: (_, i) {
                  if (i < cars.length) {
                    return CarHomeTile(
                      car: cars[i],
                      onTap: () =>
                          pushNamed(AppRoutes.carDetails, arguments: cars[i]),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
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
