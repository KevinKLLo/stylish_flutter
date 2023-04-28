import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  late GoogleMapController _mapController;
  Map<MarkerId, Marker> markersMap = {};

  final CameraPosition _center = const CameraPosition(
    target: LatLng(45.521563, -122.677433),
    zoom: 11.0,
  );

  void _onMapCreated(GoogleMapController controller) {
    // 在 GoogleMap onMapCreated 的時候，把 GoogleMapController 存起來
    _mapController = controller;
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
        onLongPress: _onLongPress,
        markers: markersMap.values.toSet(),
      ),
    );
  }

  // 長按地圖的動作
  void _onLongPress(LatLng latLng) {
    _addMarker(latLng);
  }

  // 建立 Marker
  void _addMarker(LatLng latLng) {
    MarkerId markerId = MarkerId('myMarker${markersMap.length}');
    Marker marker = Marker(
      markerId: markerId,
      position: latLng,
      infoWindow: InfoWindow(
        title: 'title',
        snippet: 'snippet: \nmarkerId: ${markerId.value}',
      ),
      onTap: () {
        print(markerId);
      },
    );

    setState(() {
      markersMap.clear();
      markersMap[markerId] = marker;
    });
  }
}
