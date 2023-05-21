import 'package:flutter/material.dart';
import 'package:flutter_tutorials/fleetp/main_page.dart';
import 'package:flutter_tutorials/pages/dashboard_page.dart';
import 'package:flutter_tutorials/pages/settings_page.dart';
import 'package:flutter_tutorials/pages/login_page.dart';
import 'package:flutter_tutorials/components/bottom_nav.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    MainPage(),
    DashboardPage(),
    SettingsPage(),
    LoginPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('My App'),
      // ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNav(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
