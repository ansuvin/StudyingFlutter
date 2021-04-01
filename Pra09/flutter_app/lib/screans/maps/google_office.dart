/*
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_app/src/locations.dart' as locations;

class PraGoogleMap extends StatefulWidget {
  @override
  _PraGoogleMapState createState() => _PraGoogleMapState();
}

class _PraGoogleMapState extends State<PraGoogleMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Google maps"),
        ),
        body: _googleMapBuild()
    );
  }

  Widget _googleMapBuild() {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
          target: const LatLng(35.1429673038245, 126.80016737003288),
          zoom: 10
      ),
      markers: _markers.values.toSet(),
    );
  }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    final googleOffices = await locations.getGoogleOffices();

    setState(() {
      _markers.clear();

      for(final office in googleOffices.offices) {
        final marker = Marker(markerId: MarkerId(office.name),
          position: LatLng(office.lat, office.lng),
          infoWindow: InfoWindow(
            title: office.name,
            snippet: office.address,
          ),
        );
        _markers[office.name] = marker;
      }
    });
  }
}


final Map<String, Marker> _markers = {};


*/