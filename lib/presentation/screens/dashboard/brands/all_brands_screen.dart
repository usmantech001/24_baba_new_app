import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:baba_24/presentation/screens/dashboard/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AllBrandsScreen extends StatefulWidget {
  const AllBrandsScreen({super.key});

  @override
  State<AllBrandsScreen> createState() => _AllBrandsScreenState();
}

class _AllBrandsScreenState extends State<AllBrandsScreen> {
  List<Map<String, dynamic>> brands = [];
  bool isLoading = true;
  bool isLoadingMore = false;
  bool hasMore = true;
  String errorMessage = '';

  // Pagination variables
  int currentPage = 1;
  int totalPages = 1;
  int totalItems = 0;
  int pageSize = 24;

  // Scroll controller for infinite scroll
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _fetchBrands();

    // Add scroll listener for infinite scrolling
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  // Scroll listener for infinite scrolling
  void _scrollListener() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 100) {
      if (!isLoadingMore && hasMore) {
        _loadMoreBrands();
      }
    }
  }

  // Initial fetch
  Future<void> _fetchBrands() async {
    setState(() {
      isLoading = true;
      errorMessage = '';
      currentPage = 1; // Reset to first page
    });

    try {
      final baseURL = dotenv.env['DEV_BASE_URL'] ?? '';
      final url = Uri.parse('$baseURL/brands?page=1&limit=$pageSize');

      final response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        if (decoded['success'] == true) {
          setState(() {
            brands = List<Map<String, dynamic>>.from(decoded['data']);

            // Update pagination info from meta
            final meta = decoded['meta'];
            if (meta != null) {
              totalItems = meta['total'] ?? 0;
              currentPage = meta['page'] ?? 1;
              pageSize = meta['pageSize'] ?? 24;
              totalPages = meta['totalPages'] ?? 1;
              hasMore = currentPage < totalPages;
            }
          });
        } else {
          setState(() {
            errorMessage = 'Failed to load brands';
          });
        }
      } else {
        setState(() {
          errorMessage = 'Server error: ${response.statusCode}';
        });
      }
    } catch (e) {
      debugPrint('Error fetching brands: $e');
      setState(() {
        errorMessage = 'Network error: $e';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  // Load more brands for infinite scroll
  Future<void> _loadMoreBrands() async {
    if (isLoadingMore || !hasMore) return;

    setState(() {
      isLoadingMore = true;
    });

    try {
      final nextPage = currentPage + 1;
      final baseURL = dotenv.env['DEV_BASE_URL'] ?? '';
      final url = Uri.parse('$baseURL/brands?page=$nextPage&limit=$pageSize');

      final response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        if (decoded['success'] == true) {
          final newBrands = List<Map<String, dynamic>>.from(decoded['data']);

          // Update meta info
          final meta = decoded['meta'];
          if (meta != null) {
            setState(() {
              brands.addAll(newBrands);
              currentPage = meta['page'] ?? nextPage;
              totalPages = meta['totalPages'] ?? totalPages;
              hasMore = currentPage < totalPages;
            });
          }
        }
      }
    } catch (e) {
      debugPrint('Error loading more brands: $e');
      // Don't show error for pagination failures, just stop loading
    } finally {
      setState(() {
        isLoadingMore = false;
      });
    }
  }

  // Refresh function (pull to refresh)
  Future<void> _refreshBrands() async {
    await _fetchBrands();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'All Brands'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : errorMessage.isNotEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: errorMessage,
                      color: AppColors.kAccentPink,
                    ),
                    SizedBox(height: 20.h),
                    ElevatedButton(
                      onPressed: _fetchBrands,
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              )
            : brands.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("No brands available"),
                    SizedBox(height: 20.h),
                    ElevatedButton(
                      onPressed: _fetchBrands,
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              )
            : RefreshIndicator(
                onRefresh: _refreshBrands,
                child: ListView(
                  controller: _scrollController,
                  children: [
                    // Brands Grid
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: brands.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.h,
                        crossAxisSpacing: 10.w,
                        childAspectRatio: 3,
                      ),
                      itemBuilder: (context, index) {
                        final brand = brands[index];
                        final logoUrl = brand['logo']?['url'] ?? '';
                        final name = brand['name'] ?? '';
                        return BrandTile(
                          name: name,
                          img: logoUrl,
                          isNetwork: true,
                        );
                      },
                    ),

                    // Loading indicator for pagination
                    if (isLoadingMore)
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        child: const Center(child: CircularProgressIndicator()),
                      ),

                    // No more items indicator
                    if (!hasMore && brands.isNotEmpty)
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        child: Center(
                          child: CustomText(
                            text: 'No more brands to load',
                            color: AppColors.kGrey,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),

                    // Show total count
                    if (brands.isNotEmpty)
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: Center(
                          child: CustomText(
                            text:
                                'Showing ${brands.length} of $totalItems brands',
                            color: AppColors.kGrey,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
      ),
    );
  }
}
