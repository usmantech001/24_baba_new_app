import 'package:baba_24/presentation/screens/onboard/widgets/app_text_field.dart';
import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
import 'package:baba_24/presentation/widgets/custom_button.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppbar(title: "Add New Address"),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 50.h),
        child: Column(
          spacing: 20.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextField(label:  "Address Label *", hintText:  "e.g., Home, Work, Office", controller: TextEditingController(),),
            AppTextField( label: "Street Address *", hintText:  "123 Main Street", controller: TextEditingController(),),
            AppTextField(label: "Apt, Suite, Unit (Optional)", hintText:  "Apartment 4B", controller: TextEditingController(),),

            Row(
              spacing: 12.w,
              children: [
                Expanded(child: AppTextField(label: "City *", hintText:  "New York", controller: TextEditingController(),)),
             
                Expanded(child: AppTextField(label: "State / Province", hintText:  "NY", controller: TextEditingController(),)),
              ],
            ),

            Row(
              spacing: 12.w,
              children: [
                Expanded(child: AppTextField( label: "Postal Code", hintText: "10001", controller: TextEditingController(),)),
                
                Expanded(child: AppTextField( label: "Country *", hintText: 'Select Country', controller: TextEditingController(),)),
              ],
            ),

            const SizedBox(height: 16),

            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF1F5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Set as default address",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "This will be your primary address",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  Switch(
                    value: false,
                    activeColor: const Color(0xFFE91E63),
                    onChanged: (v) {},
                  )
                ],
              ),
            ),

            const SizedBox(height: 24),

            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    topPadding: 0,
                    onPressed: (){}, text: 'Cancel', bgColor: AppColors.kWhite, textColor: AppColors.kAccentPink,),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: CustomButton(
                    topPadding: 0,
                    onPressed: (){}, text: 'Add Address'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }


  Widget _dropdownField(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 6),
          DropdownButtonFormField<String>(
            items: const [],
            onChanged: (v) {},
            decoration: InputDecoration(
              hintText: "Select country",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
