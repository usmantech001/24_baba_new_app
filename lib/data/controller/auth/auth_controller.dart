import 'package:flutter/material.dart';

class AuthController extends ChangeNotifier{


  List<String> tabs = ['Sign In', 'Sign Up'];

  int currentTabIndex = 0;

  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final nameController = TextEditingController();

  final pageController = PageController();

  void changeTabIndex(int index){
    currentTabIndex = index;
    pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    notifyListeners();
  }
}