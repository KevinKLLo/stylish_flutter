import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map extends StatefulWidget {
  const Map({super.key});

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  late GoogleMapController mapController;

  final CameraPosition _center = const CameraPosition(
    target: LatLng(45.521563, -122.677433),
    zoom: 11.0,
  );

  void _onMapCreated(GoogleMapController controller) {
    // 在 GoogleMap onMapCreated 的時候，初始化 GoogleMapController
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maps Sample App'),
        elevation: 2,
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: _center,
      ),
    );
  }
}
