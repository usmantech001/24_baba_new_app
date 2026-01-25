import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:flutter/material.dart';

class BookingStatusScreen extends StatelessWidget {
  const BookingStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Booking Status'),
      body: SingleChildScrollView(
        child: Column(
          children: [
          BookingStepper(icon: Icons.check, title: 'CONFIRMED', color: AppColors.kAccentPink)
          ],
        ),
      ),
    );
  }
}

class BookingStepper extends StatelessWidget {
   final IconData icon;
  final String title;
  final bool isActive;
  final bool isLast;
  final Color color;

  const BookingStepper({
    super.key,
    required this.icon,
    required this.title,
    this.isActive = false,
    this.isLast = false,
    required this.color
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 14,
              backgroundColor: color,
              child: Icon(icon, size: 14, color: Colors.white),
            ),
            if (!isLast)
              Container(
                width: 40,
                height: 2,
                color: Colors.grey.shade300,
              ),
          ],
        ),
      ],
    );
  }
}