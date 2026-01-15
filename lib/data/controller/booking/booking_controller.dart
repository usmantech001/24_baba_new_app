import 'package:flutter/material.dart';

class BookingController extends ChangeNotifier {
  
  int bookingInfoIndex = 0;

  final pageController = PageController();

  void onBookingInfoPageChange(int index){
    bookingInfoIndex = index;
    pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    notifyListeners();
  }
}