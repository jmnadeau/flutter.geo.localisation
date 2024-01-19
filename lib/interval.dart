import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geotest/location_service.dart';

class IntervalPage extends StatefulWidget {
  const IntervalPage({super.key});

  @override
  State<IntervalPage> createState() => _IntervalPageState();
}

class _IntervalPageState extends State<IntervalPage> {

  StreamSubscription<Position>? subscription;
  List<Position?> positions = [];

  startListening() {
    subscription = LocationService.getPositionStream().listen((Position? position) {
      positions.add(position);
      setState(() { });
    });
  }

  stoplListening() {
    subscription!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Position à intervalle'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                    onPressed: () {
                      startListening();
                    },
                    child: Text('Démarrer')
                ),
                ElevatedButton(
                    onPressed: () {
                      stoplListening();
                    },
                    child: Text('Arrêter')
                ),
              ]
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(8),
                children: <Widget>[
                  for(int i=0; i<positions.length;  i++)
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 50,
                          color: Colors.amber[100*(i%10)],
                          child: Center(child: Text('Latidude: ' + positions[i]!.latitude.toString())),
                        ),
                        Container(
                          height: 50,
                          color: Colors.amber[100*(i%10)],
                          child: Center(child: Text('Longitude: ' + positions[i]!.longitude.toString())),
                        ),
                      ],
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
