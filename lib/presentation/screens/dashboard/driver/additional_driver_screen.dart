import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
import 'package:baba_24/presentation/widgets/custom_button.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:baba_24/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class AdditionalDriversScreen extends StatelessWidget {
  const AdditionalDriversScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite.withValues(alpha: .97),
      appBar: CustomAppbar(title: "Additional Drivers"),
      body: SingleChildScrollView(
        padding:  EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             CustomText(
             text:  "Who’s driving?",
             fontSize: 22.sp,
             fontWeight: FontWeight.bold

            ),
             SizedBox(height: 6),
             CustomText(
             text:  "Add up to 3 additional drivers. Ensure each driver has a valid license and ID for verification.",
              color: Colors.grey,
              fontSize: 12.sp,
            ),
             SizedBox(height: 16),

            CustomButton(
              topPadding: 0,
              onPressed: (){}, text: "Add Additional Driver"),

            Gap(20.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                CustomText(
                  
                  text: "Verified Drivers",
                   fontSize: 14.sp, fontWeight: FontWeight.bold),
                CustomText(text: "2 / 4 slots", color: Colors.grey),
              ],
            ),

             SizedBox(height: 12),

            _driverCard(
              name: "Alex Johnson",
              status: "Documents Verified",
              isPrimary: true,
              statusColor: Colors.green,
              icon: Icons.check_circle,
            ),

            _pendingCard(),

            _driverCard(
              name: "Marcus Thorne",
              status: "Document Re-upload Required",
              statusColor: Colors.red,
              icon: Icons.error,
            ),

       

            CustomButton(onPressed: (){}, text: 'Confirm Drivers', bgColor: AppColors.kBlack, borderColor: Colors.transparent,)
          ],
        ),
      ),
    );
  }

  Widget _driverCard({
    required String name,
    required String status,
    required Color statusColor,
    required IconData icon,
    bool isPrimary = false,
  }) {
    return Container(
      margin:  EdgeInsets.only(bottom: 12),
      padding:  EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        // boxShadow:  [
        //   BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2))
        // ],
      ),
      child: Row(
        children: [
           CircleAvatar(radius: 22),
           SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(name,
                        style:  TextStyle(fontWeight: FontWeight.bold)),
                    if (isPrimary)
                      Container(
                        margin:  EdgeInsets.only(left: 6),
                        padding:  EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.pink.shade50,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child:  CustomText( text: "PRIMARY",
                           fontSize: 10, color: AppColors.kAccentPink),
                      ),
                  ],
                ),
                 SizedBox(height: 4),
                Row(
                  children: [
                    Icon(icon, size: 14, color: statusColor),
                     SizedBox(width: 4),
                    CustomText( text: status,
                      fontSize: 10.sp, color: statusColor),
                  ],
                )
              ],
            ),
          ),
           Icon(Icons.delete_outline, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _pendingCard() {
    return Container(
      margin:  EdgeInsets.only(bottom: 12),
      padding:  EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        // boxShadow:  [
        //   BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2))
        // ],
      ),
      child: Column(
        children: [
          Row(
            children:  [
              CircleAvatar(radius: 22),
              SizedBox(width: 12),
              Expanded(
                child: CustomText(text:  "Sarah Williams",
                fontSize: 14.sp,
                   fontWeight: FontWeight.bold),
              ),
              Icon(Icons.delete_outline, color: Colors.grey),
            ],
          ),
           SizedBox(height: 6),
          Row(
            children:  [
              Icon(Icons.hourglass_bottom, size: 14, color: Colors.orange),
              SizedBox(width: 4),
              CustomText(text: "License Verification Pending",
                  fontSize: 10.sp, color: Colors.orange),
            ],
          ),
           SizedBox(height: 10),
          Container(
            padding:  EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children:  [
                Icon(Icons.insert_drive_file, size: 16),
                SizedBox(width: 6),
                Expanded(child: Text("License_Front.jpg")),
                Icon(Icons.edit, color: Colors.pink),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
