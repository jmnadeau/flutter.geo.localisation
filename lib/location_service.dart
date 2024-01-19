// TODO installer geolocator : flutter pub add geolocator
// TODO suivre la doc pour l'utilisation du package : https://pub.dev/packages/geolocator
import 'dart:async';

import 'package:geolocator/geolocator.dart';

class LocationService {

  static LocationPermission? permission;


  static requestPermission() async {
    if(permission==null) {
      permission = await Geolocator.requestPermission();
    }
  }

  static Future<Position> getCurrentPosition() async {
    await requestPermission();
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return position;
  }

  static Stream<Position> getPositionStream() {
    final LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      // TODO distance en mètre entre 2 emplacements
      // TODO ici ce sera à tous les 10 mètres
      distanceFilter: 10,
    );
    return Geolocator.getPositionStream(locationSettings: locationSettings);
  }

  static double getDistanceBetween(double startlatitude, double startlongitude, double endlatitude, double endlongitude) {
    double distanceInMeters = Geolocator.distanceBetween(startlatitude, startlongitude, endlatitude, endlongitude);
    return distanceInMeters;
  }

}