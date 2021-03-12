import 'package:geolocator/geolocator.dart';

class MyLocation{

  double longitude;
  double latitude;

  Future<void> getMyCurrentLocation() async {
    try {
      Position position = await Geolocator.
      getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
      print(latitude);
      print(longitude);
    } catch(e) {
      print("인터넷 연결에 문제가 있습니다.");
    }
  }
}