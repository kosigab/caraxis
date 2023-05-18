import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_tutorials/components/bottom_nav.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

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
    _timer =
        Timer.periodic(Duration(seconds: 10), (Timer t) => _updateMarker());
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _updateMarker() {
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
            tilt: 0),
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
        alignment: Alignment.bottomCenter,
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            markers: _markers,
            initialCameraPosition: CameraPosition(
              target: LatLng(new_location[0], new_location[1]),
              zoom: 16.0,
            ),
            zoomControlsEnabled: true,
            // Enable zoom controls
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 1/25 + 10), // Push controls up
          ),
          SlidingUpPanel(
            minHeight: MediaQuery.of(context).size.height * 1/25,
            maxHeight: MediaQuery.of(context).size.height * 2 / 3,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
            panel: Padding(
              padding: EdgeInsets.only(top: 50),
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 100,
                    color: index % 2 == 0 ? Colors.grey[100] : Colors.white10,
                  );
                },
              ),
            ),
            collapsed: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
              ),
              child: Center(
                child: Container(
                  width: 60,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNav(
        onItemTapped: _onItemTapped,
        selectedIndex: _selectedIndex,
      ),
    );
  }
}
