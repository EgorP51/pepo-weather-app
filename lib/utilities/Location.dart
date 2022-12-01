import 'package:geolocator/geolocator.dart';

class Location{

  late double latitude;
  late double longitude;

  Future<void> getCurrentLocation() async{

    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error(Exception('Location permissions are permanently denied.'));
      }

      if (permission == LocationPermission.denied) {
        return Future.error(Exception('Location permissions are denied.'));
      }
    }
    try{
      Position position = await Geolocator
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low)
          .timeout(Duration(seconds: 10));

      latitude = position.latitude;
      longitude = position.longitude;

    }catch(e){
      throw "Errror! :) ($e)";
    }
  }
}