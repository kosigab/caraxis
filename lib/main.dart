import 'package:flutter/material.dart';
import 'pages/register_page.dart';
import 'pages/login_page.dart';
import 'pages/dashboard_page.dart';

void main() {
  runApp(CaraxisApp());
}

class CaraxisApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Caraxis',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: LoginPage(),
      //home: RegisterPage(),
      home: DashboardPage(),
    );
  }
}
