import 'package:geolocator/geolocator.dart';

class Location {
  // ignore: non_constant_identifier_names
  static bool is_Open;
  double latitude;
  double longitude;
  DateTime timestamp;

  Future<void> getCurrentLocation() async {
    try {
      Position pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
      await Geolocator.isLocationServiceEnabled();
      latitude = pos.latitude;
      longitude = pos.longitude;
      timestamp = pos.timestamp;
    } catch (e) {
      print(e);
    }
    return;
  }

  Future<bool> locationEnabled() async {
    try {
      return await Geolocator.isLocationServiceEnabled();
    } catch (e) {
      throw Exception('ERROR TO GET LOCATION');
    }
  }
}
