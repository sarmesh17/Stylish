import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationRepo {
  Future<bool> _handlePermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return false;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    return permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;
  }

  Future<Position?> getCurrentPosition() async {

    if (!await _handlePermission()) return null;

     return await Geolocator.getCurrentPosition(
       desiredAccuracy: LocationAccuracy.high,
     );
  }

  Future<String?> getAddress(Position position) async {

    try{
      final placemark=await  placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if(placemark.isEmpty) return null;

      final place = placemark[0];

      return ' ${place.street},${place.locality}, ${place.administrativeArea},${place.country}';
    }catch(e){

      return null;
    }
  }
}
