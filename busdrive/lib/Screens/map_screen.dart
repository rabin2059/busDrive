import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  final LatLng initialPosition;

  const MapScreen({
    super.key,
    required this.initialPosition,
  });

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: widget.initialPosition,
          zoom: 10,
        ),
        markers: {
          Marker(
            markerId: const MarkerId('location'),
            position: widget.initialPosition,
          ),
        },
      ),
    );
  }
}
