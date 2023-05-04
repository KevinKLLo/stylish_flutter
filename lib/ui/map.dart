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
  String? _cardContent;

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
      body: Stack(children: [
        GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: _center,
          onTap: _onTap,
          onLongPress: _onLongPress,
          markers: markersMap.values.toSet(),
        ),
        Visibility(
          visible: _cardContent != null,
          child: Positioned(
            left: 20,
            right: 20,
            bottom: 50,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(_cardContent ?? ''),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  // 點擊地圖
  void _onTap(LatLng latLng) {
    _removeMarkers();
    _removeCardConetnt();
  }

  // 長按地圖
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
        title: 'Title',
        snippet: 'MarkerId: ${markerId.value}',
      ),
      onTap: () {
        setState(() {
          _cardContent = markerId.value;
        });
      },
    );

    setState(() {
      markersMap[markerId] = marker;
    });
  }

  // 移除 Markers
  void _removeMarkers() {
    setState(() {
      markersMap.clear();
    });
  }

  // 移除 CardConetnt
  void _removeCardConetnt() {
    setState(() {
      _cardContent = null;
    });
  }
}
