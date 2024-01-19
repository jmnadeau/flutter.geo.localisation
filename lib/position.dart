import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geotest/location_service.dart';

class PositionPage extends StatefulWidget {
  const PositionPage({super.key});

  @override
  State<PositionPage> createState() => _PositionPageState();
}

class _PositionPageState extends State<PositionPage> {

  Position? currentPosition;

  void getPosition() async {
    currentPosition = await LocationService.getCurrentPosition();
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
            ElevatedButton(
                onPressed: () {
                  getPosition();
                },
                child: Text('Avoir la position courante')
            ),
            Text(
              'Position courante',
            ),
            if(currentPosition!=null)
              Text(
                'Latitude: ' + currentPosition!.latitude.toString(),
              ),
            if(currentPosition!=null)
              Text(
                'Longitude: ' + currentPosition!.longitude.toString(),
              ),
          ],
        ),
      ),
    );
  }
}
