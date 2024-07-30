import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  final LatLng initialPosition;
  final LatLng? destination;

  const MapScreen({
    super.key,
    required this.initialPosition,
    this.destination,
  });

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    LatLng center = widget.destination != null
        ? LatLng(
            (widget.initialPosition.latitude + widget.destination!.latitude) / 2,
            (widget.initialPosition.longitude + widget.destination!.longitude) / 2,
          )
        : widget.initialPosition;

    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: center,
          zoom: 13,
        ),
        markers: {
          Marker(
            markerId: const MarkerId('initialPosition'),
            position: widget.initialPosition,
          ),
          if (widget.destination != null)
            Marker(
              markerId: const MarkerId('destination'),
              position: widget.destination!,
            ),
        },
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          if (widget.destination != null) {
            _moveCameraToBounds();
          }
        },
      ),
    );
  }

  Future<void> _moveCameraToBounds() async {
    final GoogleMapController controller = await _controller.future;
    LatLngBounds bounds = LatLngBounds(
      southwest: LatLng(
        widget.initialPosition.latitude < widget.destination!.latitude
            ? widget.initialPosition.latitude
            : widget.destination!.latitude,
        widget.initialPosition.longitude < widget.destination!.longitude
            ? widget.initialPosition.longitude
            : widget.destination!.longitude,
      ),
      northeast: LatLng(
        widget.initialPosition.latitude > widget.destination!.latitude
            ? widget.initialPosition.latitude
            : widget.destination!.latitude,
        widget.initialPosition.longitude > widget.destination!.longitude
            ? widget.initialPosition.longitude
            : widget.destination!.longitude,
      ),
    );

    CameraUpdate cameraUpdate = CameraUpdate.newLatLngBounds(bounds, 50);
    controller.animateCamera(cameraUpdate);
  }
}