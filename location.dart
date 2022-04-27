import 'package:geolocator/geolocator.dart';

class Location{

  double? lat;
  double? long;

  Future<void> getCurrentLocation() async {

    try { //why try and catch? it happens errors

      await Geolocator.checkPermission();
      await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best); //best does not take time
      //print(position);
      lat = position.latitude;
      long = position.longitude;
    }
    catch(e){
      print(e);
    }

  }
}