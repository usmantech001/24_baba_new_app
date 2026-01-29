import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController extends ChangeNotifier{

   int tabIndex = 0;

  final pageController = PageController();

  String currentAddress = '';

  bool bringTheCarToMe = true;
 
 
  void onSelectAddress(String address){
    currentAddress = address;
    notifyListeners();
  }

  final Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();

  void onTabChange(int index){
    tabIndex = index;
    pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    notifyListeners();
  }

  Future<void> getAddressFromLatLng(LatLng position, {Function? onSuuccess, Function(String)? onError}) async {
   try {
      List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    Placemark place = placemarks.first;

    
      currentAddress =
          "${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
          onSuuccess?.call();
    notifyListeners();
   } catch (e) {
    onError?.call(e.toString());
     print('...error getting address ${e.toString()}');
   }
  }


Future<Position?> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the 
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
     
      return Future.error('Location permissions are denied');
    }
  }
  
  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately. 
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.');
  } 

  return await Geolocator.getCurrentPosition();
}
}