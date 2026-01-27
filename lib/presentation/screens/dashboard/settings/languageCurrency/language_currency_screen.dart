// import 'package:baba_24/data/model/currency_model.dart';
// import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
// import 'package:baba_24/utils/constants/world_currencies.dart';
// import 'package:flutter/material.dart';

// // Assume ALL_WORLD_CURRENCIES is already defined in your project

// class LanguageCurrencyScreen extends StatefulWidget {
//   const LanguageCurrencyScreen({super.key});

//   @override
//   State<LanguageCurrencyScreen> createState() => _LanguageCurrencyScreenState();
// }

// class _LanguageCurrencyScreenState extends State<LanguageCurrencyScreen> {
//   Currency selectedCurrency = ALL_WORLD_CURRENCIES.first;
//   String search = "";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppbar(title: "Language & Currency"),

//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             _currentCard(),
//             const SizedBox(height: 20),
//             _currencyTile(),
//             const Spacer(),
//             _saveButton()
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _currentCard() {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         gradient: const LinearGradient(
//           colors: [Color(0xFFE91E63), Color(0xFFFF5C8D)],
//         ),
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Row(
//         children: [
//           const Icon(Icons.language, color: Colors.white),
//           const SizedBox(width: 12),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text("Current Currency",
//                   style: TextStyle(color: Colors.white70)),
//               Text(
//                 "${selectedCurrency.flag} ${selectedCurrency.label} (${selectedCurrency.code})",
//                 style: const TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16),
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }

//   Widget _currencyTile() {
//     return ListTile(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
//       tileColor: Colors.grey.shade100,
//       leading: Text(selectedCurrency.flag, style: const TextStyle(fontSize: 22)),
//       title: Text(selectedCurrency.label),
//       subtitle: Text("${selectedCurrency.country} • ${selectedCurrency.code}"),
//       trailing: const Icon(Icons.keyboard_arrow_up),
//       onTap: _showCurrencyBottomSheet,
//     );
//   }

//   void _showCurrencyBottomSheet() {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
//       ),
//       builder: (_) {
//         return StatefulBuilder(
//           builder: (context, setModalState) {
//             final filtered = ALL_WORLD_CURRENCIES.where((c) {
//               return c.label.toLowerCase().contains(search.toLowerCase()) ||
//                   c.code.toLowerCase().contains(search.toLowerCase()) ||
//                   c.country.toLowerCase().contains(search.toLowerCase());
//             }).toList();

//             return DraggableScrollableSheet(
//               expand: false,
//               initialChildSize: 0.85,
//               minChildSize: 0.6,
//               maxChildSize: 0.95,
//               builder: (_, controller) {
//                 return Column(
//                   children: [
//                     const SizedBox(height: 12),
//                     Container(
//                       width: 40,
//                       height: 5,
//                       decoration: BoxDecoration(
//                         color: Colors.grey.shade300,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     const Text("Select Currency",
//                         style:
//                             TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                     Padding(
//                       padding: const EdgeInsets.all(16),
//                       child: TextField(
//                         onChanged: (v) {
//                           setModalState(() => search = v);
//                         },
//                         decoration: InputDecoration(
//                           hintText: "Search currency or country",
//                           prefixIcon: const Icon(Icons.search),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: ListView.builder(
//                         controller: controller,
//                         itemCount: filtered.length,
//                         itemBuilder: (_, i) {
//                           final c = filtered[i];
//                           final isSelected = c.code == selectedCurrency.code;

//                           return ListTile(
//                             leading:
//                                 Text(c.flag, style: const TextStyle(fontSize: 22)),
//                             title: Text("${c.label} (${c.code})"),
//                             subtitle: Text(c.country),
//                             trailing: Row(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 Text(c.symbol,
//                                     style: const TextStyle(
//                                         fontWeight: FontWeight.bold)),
//                                 if (isSelected)
//                                   const Padding(
//                                     padding: EdgeInsets.only(left: 8),
//                                     child: Icon(Icons.check_circle,
//                                         color: Color(0xFFE91E63)),
//                                   )
//                               ],
//                             ),
//                             onTap: () {
//                               setState(() => selectedCurrency = c);
//                               Navigator.pop(context);
//                             },
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             );
//           },
//         );
//       },
//     );
//   }

//   Widget _saveButton() {
//     return SizedBox(
//       width: double.infinity,
//       height: 52,
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: const Color(0xFFE91E63),
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
//         ),
//         onPressed: () {
//           // Save to SharedPreferences / API
//         },
//         child: const Text(
//           "Save Preferences",
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }

import 'package:baba_24/data/model/currency_model.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
import 'package:baba_24/presentation/widgets/custom_button.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:baba_24/utils/constants/world_currencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageCurrencyScreen extends StatefulWidget {
  const LanguageCurrencyScreen({super.key});

  @override
  State<LanguageCurrencyScreen> createState() => _LanguageCurrencyScreenState();
}

class _LanguageCurrencyScreenState extends State<LanguageCurrencyScreen> {
  String selectedLanguage = 'English';
  Currency selectedCurrency = ALL_WORLD_CURRENCIES.firstWhere(
    (c) => c.code == 'USD',
  );
  String search = "";
  final languages = [
    {'name': 'Spanish', 'native': 'Español', 'flag': '🇪🇸'},
    {'name': 'Russian', 'native': 'Русский', 'flag': '🇷🇺'},
    {'name': 'Arabic', 'native': 'العربية', 'flag': '🇦🇪'},
    {'name': 'Turkish', 'native': 'Türkçe', 'flag': '🇹🇷'},
    {'name': 'Hindi', 'native': 'हिन्दी', 'flag': '🇮🇳'},
    {'name': 'Bengali', 'native': 'বাংলা', 'flag': '🇧🇩'},
    {'name': 'Hebrew', 'native': 'עברית', 'flag': '🇮🇱'},
    {'name': 'Chinese', 'native': '简体中文', 'flag': '🇨🇳'},
    {'name': 'Korean', 'native': '한국어', 'flag': '🇰🇷'},
    {'name': 'Japanese', 'native': '日本語', 'flag': '🇯🇵'},
  ];
  Widget _currentCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFE91E63), Color(0xFFFF5C8D)],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Icon(Icons.language, color: Colors.white),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Current Currency",
                style: TextStyle(color: Colors.white70),
              ),
              Text(
                "${selectedCurrency.flag} ${selectedCurrency.label} (${selectedCurrency.code})",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showCurrencyBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            final filtered = ALL_WORLD_CURRENCIES.where((c) {
              return c.label.toLowerCase().contains(search.toLowerCase()) ||
                  c.code.toLowerCase().contains(search.toLowerCase()) ||
                  c.country.toLowerCase().contains(search.toLowerCase());
            }).toList();

            return DraggableScrollableSheet(
              expand: false,
              initialChildSize: 0.85,
              minChildSize: 0.6,
              maxChildSize: 0.95,
              builder: (_, controller) {
                return Column(
                  children: [
                    const SizedBox(height: 12),
                    Container(
                      width: 40,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Select Currency",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextField(
                        onChanged: (v) {
                          setModalState(() => search = v);
                        },
                        decoration: InputDecoration(
                          hintText: "Search currency or country",
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        controller: controller,
                        itemCount: filtered.length,
                        itemBuilder: (_, i) {
                          final c = filtered[i];
                          final isSelected = c.code == selectedCurrency.code;

                          return ListTile(
                            leading: Text(
                              c.flag,
                              style: const TextStyle(fontSize: 22),
                            ),
                            title: Text("${c.label} (${c.code})"),
                            subtitle: Text(c.country),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  c.symbol,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                if (isSelected)
                                  const Padding(
                                    padding: EdgeInsets.only(left: 8),
                                    child: Icon(
                                      Icons.check_circle,
                                      color: Color(0xFFE91E63),
                                    ),
                                  ),
                              ],
                            ),
                            onTap: () {
                              setState(() => selectedCurrency = c);
                              Navigator.pop(context);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Language & Currency'),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Currency",
                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Select your preferred currency",
                  style: TextStyle(fontSize: 13.sp, color: Colors.grey),
                ),
              ),
              SizedBox(height: 10.h),
              GestureDetector(
                onTap: _showCurrencyBottomSheet,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: Row(
                    children: [
                      Text(
                        selectedCurrency.symbol,
                        style: TextStyle(
                          color: const Color(0xFFE91E63),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            selectedCurrency.code,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            selectedCurrency.label,
                            style: TextStyle(fontSize: 13.sp, color: Colors.grey),
                          ),
                        ],
                      ),
                      const Spacer(),
                      const Icon(Icons.keyboard_arrow_down),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              CustomButton(
                topPadding: 10,
                onPressed: () {},
                text: "Save Preferences",
              ),
            ],
          ),
        ),
      ),
      backgroundColor: AppColors.kWhite.withValues(alpha: .95),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            _currentCard(),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(vertical: 14.h),
                itemCount: languages.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.w,
                  mainAxisSpacing: 12.h,
                  childAspectRatio: 2.4,
                ),
                itemBuilder: (_, index) {
                  final lang = languages[index];
                  final isSelected = selectedLanguage == lang['name'];

                  return GestureDetector(
                    onTap: () =>
                        setState(() => selectedLanguage = lang['name']!),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14.r),
                        border: Border.all(
                          color: isSelected
                              ? const Color(0xFFE91E63)
                              : Colors.transparent,
                          width: 2,
                        ),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.black.withOpacity(0.05),
                        //     blurRadius: 8,
                        //   )
                        // ],
                      ),
                      child: Row(
                        children: [
                          Text(
                            lang['flag']!,
                            style: TextStyle(fontSize: 26.sp),
                          ),
                          SizedBox(width: 10.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                lang['name']!,
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                lang['native']!,
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          
          ],
        ),
      ),
    );
  }
}
