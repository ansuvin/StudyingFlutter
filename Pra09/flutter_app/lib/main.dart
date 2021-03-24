import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'src/locations.dart' as locations;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pra 09",
      home: PraGoogleMap(),
    );
  }
}

class PraGoogleMap extends StatefulWidget {
  @override
  _PraGoogleMapState createState() => _PraGoogleMapState();
}

class _PraGoogleMapState extends State<PraGoogleMap> {
  @override
  void initState() {
    super.initState();
    print("시작전");
    getGoogleOffice();
    print("끝");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google maps"),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: const LatLng(0, 0),
          zoom: 2
        ),
        markers: _markers.values.toSet(),
      ),
    );
  }

  final Map<String, Marker> _markers = {};

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
        print(office.name);
      }
    });
  }

  Future<void> getGoogleOffice() async{
    final gOffice = await locations.getGoogleOffices();
    for (final office in gOffice.offices) {
      print(office.name);
    }
  }
}

