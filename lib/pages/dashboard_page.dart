import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late GoogleMapController _mapController;
  Timer? _timer;
  List<double> new_location = [53.468640, -2.221863];
  Set<Marker> _markers = {};
  int _selectedIndex = 0;

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    _updateMarker();
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 10), (Timer t) => _updateMarker());
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _updateMarker() {
    // Fetch new coordinates from the API and update the new_location variable.
    // For now, we'll just use the same coordinates for demonstration purposes.
    new_location = [53.569740, -2.221863];

    setState(() {
      _markers.clear();
      _markers.add(
        Marker(
          markerId: MarkerId('marker_1'),
          position: LatLng(new_location[0], new_location[1]),
        ),
      );
    });

    _mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(new_location[0], new_location[1]),
          zoom: 17.0,
          tilt: 0
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard', style: GoogleFonts.roboto()),
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            markers: _markers,
            initialCameraPosition: CameraPosition(
              target: LatLng(new_location[0], new_location[1]),
              zoom: 16.0,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: FloatingActionButton(
                onPressed: () {
                  // Implement SOS button functionality
                },
                child: Icon(Icons.warning_amber_outlined, size: 36),
                backgroundColor: Colors.red,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Location',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
