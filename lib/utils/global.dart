import 'package:flutter/material.dart';

double deviceHeight(BuildContext context) {
  return MediaQuery.sizeOf(context).height;
}

double deviceWidth(BuildContext context) {
  return MediaQuery.sizeOf(context).width;
}