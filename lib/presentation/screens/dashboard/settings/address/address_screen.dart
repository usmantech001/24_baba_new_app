import 'package:baba_24/core/app_route.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:baba_24/utils/nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressSettingsScreen extends StatefulWidget {
  const AddressSettingsScreen({super.key});

  @override
  State<AddressSettingsScreen> createState() => _AddressSettingsScreenState();
}

class _AddressSettingsScreenState extends State<AddressSettingsScreen> {
  List<Map<String, String>> addresses = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: AppColors.kWhite.withValues(alpha: .95),
      appBar: CustomAppbar(title: "Address"),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             CustomText(
             text:  "Manage your saved addresses and select your default location",
             color: Colors.grey,
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                 text:  "Saved Addresses (${addresses.length})",
                  fontSize: 16.sp, fontWeight: FontWeight.bold,
                ),
                InkWell(
                  onTap: () => pushNamed(AppRoutes.addAddress),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color: AppColors.kAccentPink,
                      borderRadius: BorderRadius.circular(15.r)
                    ),
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add, color: AppColors.kWhite,),
                      CustomText(text: "Add Address", color: AppColors.kWhite,)
                    ],
                  ),),
                )
              ],
            ),
            const SizedBox(height: 20),

            Expanded(
              child: addresses.isEmpty
                  ? _emptyState()
                  : ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) => _addressCard(),
                    ),
            )
          ],
        ),
      ),
    );
  }

  Widget _emptyState() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.location_on_outlined, size: 60, color: Colors.grey),
          const SizedBox(height: 12),
           CustomText(
           text:  "No addresses saved yet",
            fontSize: 16.sp, fontWeight: FontWeight.bold
          ),
          const SizedBox(height: 8),
          const CustomText(
            text: "Add your first address to get started with managing your locations",
            textAlign: TextAlign.center,
            color: Colors.grey
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: (){
              pushNamed(AppRoutes.addAddress);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.kAccentPink,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            icon: const Icon(Icons.add, color: AppColors.kWhite,),
            label: const CustomText(text: "Add Your First Address", color: AppColors.kWhite,),
          )
        ],
      ),
    );
  }

  Widget _addressCard() {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
        color: AppColors.kWhite,
        borderRadius: BorderRadius.circular(15.sp)
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                CircleAvatar(
                  backgroundColor: Color(0xFFFCE4EC),
                  child: Icon(Icons.location_on, color: Color(0xFFE91E63)),
                ),
                SizedBox(width: 12),
                Text("Azizi Riviera 10",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 8),
            const Text("Azizi, 507\nDubai, United Kingdom"),
            const Divider(),
            Row(
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.edit, color: Color(0xFFE91E63)),
                  label: const Text("Edit", style: TextStyle(color: Color(0xFFE91E63))),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.delete, color: Colors.red),
                  label: const Text("Delete", style: TextStyle(color: Colors.red)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
