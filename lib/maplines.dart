import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapLinesPage extends StatefulWidget {
  const MapLinesPage({super.key});

  @override
  State<MapLinesPage> createState() => MapLinesPageState();
}

class MapLinesPageState extends State<MapLinesPage> {

  Set<Marker> markers = Set();
  Set<Polyline> polylines = Set();

  LatLng? lastPosition;

  static const CameraPosition cem = CameraPosition(
    target: LatLng(45.53665313486474, -73.49497434095912),
    zoom: 15,
  );

  addMarkerAndPolylines(LatLng position) {
    markers.add(Marker(position: position, markerId: MarkerId(markers.length.toString())));

    if(lastPosition!=null) {
      createPolyline(position);
    }

    setState(() { });
    lastPosition = position;
  }

  createPolyline(LatLng position) {
    List<LatLng> points = [];
    points.add(lastPosition!);
    points.add(position);

    polylines.add(Polyline(
      polylineId: PolylineId(polylines.length.toString()),
      visible: true,
      points: points,
      width: 2,
      color: Colors.blue,
    ));
  }

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
        markers: markers,
        // TODO Click sur la carte
        onTap: addMarkerAndPolylines,
        polylines: polylines,
      ),
    );
  }
}