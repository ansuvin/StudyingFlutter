/*
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

double posiLng;
double posiLat;
var position;

class CurrentPosition extends StatefulWidget {
  @override
  _CurrentPositionState createState() => _CurrentPositionState();
}

class _CurrentPositionState extends State<CurrentPosition> {
  @override
  void initState() {
    super.initState();
    position = GeoLocatorService().getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("현재 위치 얻어서 지도에 표시하기"),
        ),
        body: position != null
            ? GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: LatLng(posiLat, posiLng),
                  zoom: 18,
                ),
                markers: _markers.values.toSet(),
              )
            : Container(
                child: Text("없습니다."),
              ));
  }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    setState(() {
      final marker = Marker(
        markerId: MarkerId("우리 학교"),
        position: LatLng(posiLat, posiLng),
        infoWindow: InfoWindow(
          title: "우리 학교",
          snippet: "광주소프트웨어마이스터고",
        ),
      );
      _markers["우리 학교"] = marker;
    });
  }
}

class GeoLocatorService {
  Future<Position> getLocation() async {
    Position position =
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    posiLng = position.longitude;
    posiLat = position.latitude;
    return position;
  }
}

final Map<String, Marker> _markers = {};
*/