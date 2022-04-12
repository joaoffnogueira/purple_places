import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:purple_places/models/place.dart';

class MapScreen extends StatefulWidget {
  final PlaceLocation initialLocation;
  final bool isReadOnly;
  const MapScreen(
      {this.initialLocation =
          const PlaceLocation(latitude: -25.3960752, longitude: -51.4619636),
      this.isReadOnly = false,
      Key? key})
      : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng _pickedPosition = LatLng(0, 0);
  void _selectPosition(LatLng position) {
    setState(() {
      _pickedPosition = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecione a localização'),
        actions: [
          if (!widget.isReadOnly)
            IconButton(
              icon: Icon(Icons.check),
              onPressed: _pickedPosition.latitude != 0 &&
                      _pickedPosition.longitude != 0
                  ? () {
                      Navigator.of(context).pop(_pickedPosition);
                    }
                  : null,
            ),
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.initialLocation.latitude,
            widget.initialLocation.longitude,
          ),
          zoom: 13,
        ),
        onTap: widget.isReadOnly ? null : _selectPosition,
        markers: _pickedPosition == LatLng(0, 0)
            ? {}
            : {
                Marker(
                  markerId: MarkerId('m1'),
                  position: _pickedPosition,
                ),
              },
      ),
    );
  }
}
