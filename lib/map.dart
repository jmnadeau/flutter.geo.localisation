import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => MapPageState();
}

class MapPageState extends State<MapPage> {

  static const CameraPosition cem = CameraPosition(
    target: LatLng(45.53665313486474, -73.49497434095912),
    zoom: 15,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Map du Cégep'),
      ),
      body: GoogleMap(
        mapType: MapType.terrain,
        initialCameraPosition: cem,
      ),
    );
  }
}