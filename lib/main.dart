// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const TreasureHuntApp());
}

class TreasureHuntApp extends StatelessWidget {
  const TreasureHuntApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Treasure Hunt AR Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TreasureMapScreen(),
    );
  }
}

class TreasureMapScreen extends StatefulWidget {
  const TreasureMapScreen({super.key});

  @override
  _TreasureMapScreenState createState() => _TreasureMapScreenState();
}

class _TreasureMapScreenState extends State<TreasureMapScreen> {
  GoogleMapController? mapController;
  final Set<Marker> _markers = {};
  final LatLng _currentPosition = const LatLng(37.7749, -122.4194); // Default location (San Francisco)

  @override
  void initState() {
    super.initState();
    _addTreasureMarkers();
  }

  void _addTreasureMarkers() {
    // Add some sample treasure locations
    _markers.add(
      Marker(
        markerId: const MarkerId('treasure1'),
        position: const LatLng(37.7749, -122.4194), // Example coordinates
        infoWindow: const InfoWindow(title: 'Treasure 1'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow), // Use hueYellow instead of hueGold
      ),
    );

    _markers.add(
      Marker(
        markerId: const MarkerId('treasure2'),
        position: const LatLng(37.7750, -122.4183), // Another example coordinate
        infoWindow: const InfoWindow(title: 'Treasure 2'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow), // Use hueYellow instead of hueGold
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Treasure Hunt AR Game'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _currentPosition,
          zoom: 14.0,
        ),
        markers: _markers,
        myLocationEnabled: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to AR view
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ARViewScreen()),
          );
        },
        child: const Icon(Icons.camera),
      ),
    );
  }
}

class ARViewScreen extends StatelessWidget {
  const ARViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AR Treasure Hunt'),
      ),
      body: const Center(
        child: Text(
          'AR View coming soon!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
