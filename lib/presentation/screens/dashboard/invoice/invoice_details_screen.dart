import 'package:baba_24/presentation/screens/onboard/widgets/custom_appbar.dart';
import 'package:baba_24/presentation/widgets/custom_button.dart';
import 'package:baba_24/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InvoiceDetailsPage extends StatelessWidget {
  const InvoiceDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      bottomNavigationBar: Container(
           padding: EdgeInsets.symmetric(horizontal: 15.w),
           child: SafeArea(
             child: CustomButton(
              topPadding: 10,
              onPressed: (){}, text: 'Download Invoice PDF'),
           ),
         ),
      appBar: CustomAppbar(title: 'Invoice Details', suffix: Icon(Icons.share, color: Colors.black),),
   
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _paidBadge(),
                  const SizedBox(height: 12),
                  const Text(
                    '\$150.00',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink,
                    ),
                  ),
                  const SizedBox(height: 6),
                   CustomText( text: 
                    'Invoice #INV-2023-001 • Oct 24, 2023',
                    color: Colors.grey
                  ),
                  const SizedBox(height: 24),
                  _billedTo(),
                  const SizedBox(height: 24),
                  _itemTile(
                    title: 'Design Consultation',
                    subtitle: 'Booking • Oct 23',
                    price: '\$100.00',
                  ),
                  _itemTile(
                    title: 'Asset Export',
                    subtitle: 'Service • Oct 24',
                    price: '\$40.00',
                  ),
                  const SizedBox(height: 20),
                  _priceRow('Subtotal', '\$140.00'),
                  _priceRow('Tax (10%)', '\$10.00'),
                  const Divider(),
                  _priceRow('Total Amount', '\$150.00', isTotal: true),
                  const SizedBox(height: 16),
                  _paymentMethod(),
                ],
              ),
            ),
          ),
         
        ],
      ),
    );
  }

  Widget _paidBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.green.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children:  [
          Icon(Icons.check_circle, color: Colors.green, size: 16),
          SizedBox(width: 6),
          CustomText( text: 'PAID', color: Colors.green, fontSize: 14.sp,),
        ],
      ),
    );
  }

  Widget _billedTo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        CustomText(text: 'BILLED TO', color: Colors.grey),
        SizedBox(height: 8),
        ListTile(
          leading: CircleAvatar(child: Icon(Icons.person)),
          title: CustomText(text: 'Alex Morgan', fontSize: 12.sp,),
          subtitle: CustomText(text: 'alex.morgan@design.co', fontSize: 12.sp,),
        )
      ],
    );
  }

  Widget _itemTile({
    required String title,
    required String subtitle,
    required String price,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: const LinearGradient(
              colors: [Colors.pink, Colors.blue],
            ),
          ),
        ),
        title: CustomText(text: title, fontWeight: FontWeight.w600, fontSize: 14.sp,),
        subtitle: CustomText(text:  subtitle, fontSize: 12.sp,),
        trailing: CustomText(text:  price, fontWeight: FontWeight.bold, fontSize: 12.sp,),
      ),
    );
  }

  Widget _priceRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(text:  label,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
                fontSize: isTotal ? 16 : 14,),
          CustomText(text:  value,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
                fontSize: isTotal ? 16 : 14,
                color: isTotal ? Colors.pink : Colors.black,),
        ],
      ),
    );
  }

  Widget _paymentMethod() {
    return ListTile(
      leading: const Icon(Icons.credit_card),
      title: const Text('Paid with Mastercard ending •••• 8842'),
    );
  }

  // Widget _downloadButton() {
  //   return Container(
  //     width: double.infinity,
  //     padding: const EdgeInsets.all(16),
  //     child: ElevatedButton.icon(
  //       onPressed: () {},
  //       icon: const Icon(Icons.download),
  //       label: const Text('Download Invoice PDF'),
  //       style: ElevatedButton.styleFrom(
  //         backgroundColor: Colors.pink,
  //         padding: const EdgeInsets.symmetric(vertical: 14),
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(12),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
