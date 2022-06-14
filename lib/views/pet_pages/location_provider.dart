import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationProvider with ChangeNotifier{
  //double latitude;
  //double longitude;
  bool permissionAllowed= false;
  Future<void>getCurrentPoosition()async{
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    if(position!=null){
      //this.latitude=position.latitude;
      //this.longitude=position.longitude;
      notifyListeners();
    }else{
      print('permission not allowed');
    }
  }

}