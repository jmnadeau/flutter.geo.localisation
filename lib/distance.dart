import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geotest/location_service.dart';

class DistancePage extends StatefulWidget {
  const DistancePage({super.key});

  @override
  State<DistancePage> createState() => _DistancePageState();
}

class _DistancePageState extends State<DistancePage> {

  double distance = 0;

  // TODO Position approximative du local
  final startlatitude = TextEditingController(text: '45.53665313486474');
  final startlongitude = TextEditingController(text: '-73.49497434095912');
  // TODO Position approximative du Tim
  final endlatitude = TextEditingController(text:'45.53602445249459');
  final endlongitude = TextEditingController(text:'-73.49692583084106');

  void calculte() async {
    distance = LocationService.getDistanceBetween(
      double.parse(startlatitude.text),
      double.parse(startlongitude.text),
      double.parse(endlatitude.text),
      double.parse(endlongitude.text),
    );
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Position Courante'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Début (Proche du D0605)',
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Latitude',
              ),
              controller: startlatitude,
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Longitude',
              ),
              controller: startlongitude,
            ),
            Text(
              'Fin (Tim Horton)',
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Latitude',
              ),
              controller: endlatitude,
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Longitude',
              ),
              controller: endlongitude,
            ),
            ElevatedButton(
                onPressed: () {
                  calculte();
                },
                child: Text('Calculer la distance')
            ),
            Text(
              'Distance: ${distance.toStringAsFixed(2)}m',
            ),

          ],
        ),
      ),
    );
  }
}
