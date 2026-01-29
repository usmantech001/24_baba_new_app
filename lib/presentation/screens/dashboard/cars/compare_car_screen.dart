import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
import 'package:baba_24/presentation/widgets/custom_button.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompareClassScreen extends StatelessWidget {
  const CompareClassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Compare Cars"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: const [
                Expanded(
                  child: CarCard(
                    image: "assets/images/ferarri.png",
                    type: "ELECTRIC",
                    name: "Tesla Model 3",
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: CarCard(
                    image: "assets/images/ferarri.png",
                    type: "HYBRID",
                    name: "BMW 3 Series",
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            const SectionTitle("ENGINE & PERFORMANCE"),
            const CompareRow("Fuel Type", "Electric", "Hybrid PHEV"),
            const CompareRow("Transmission", "Single Speed", "8-Speed Auto"),

            const SizedBox(height: 20),
            const SectionTitle("UTILITY & SPACE"),
            const CompareRow("Seats", "5 Seater", "5 Seater"),
            const CompareRow("Luggage", "2 Large Bags", "1 Large Bag"),

            const SizedBox(height: 20),
            const SectionTitle("RENTAL RATE"),
            const CompareRow(
              "Daily Price",
              "\$95/day",
              "\$110/day",
              isPrice: true,
            ),

            Row(
              children: [
                Expanded(
                  child: CustomButton(onPressed: () {}, text: 'Select Tesla'),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: CustomButton(onPressed: () {}, text: 'Select BMW'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CarCard extends StatelessWidget {
  final String image;
  final String type;
  final String name;

  const CarCard({
    super.key,
    required this.image,
    required this.type,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(image, height: 120, fit: BoxFit.cover),
        ),
        const SizedBox(height: 8),
        Text(type, style: const TextStyle(color: Colors.red, fontSize: 12)),
        Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: CustomText(
        text: title,
        color: AppColors.kGrey,
        fontSize: 12.sp,
        fontWeight: FontWeight.bold,
      ),
      
    );
  }
}

class CompareRow extends StatelessWidget {
  final String label;
  final String left;
  final String right;
  final bool isPrice;

  const CompareRow(
    this.label,
    this.left,
    this.right, {
    super.key,
    this.isPrice = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: label, fontSize: 12.sp,),
                CustomText(
                 text:  left,
                  color: isPrice ? Colors.red : Colors.black,
                  fontWeight: FontWeight.w600,
                 
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               CustomText(text: label, fontSize: 12.sp,),
                CustomText(
                 text:  left,
                  color: isPrice ? Colors.red : Colors.black,
                  fontWeight: FontWeight.w600,
                 
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
