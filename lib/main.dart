import 'package:flutter/material.dart';
import 'pages/register_page.dart';
import 'pages/login_page.dart';
import 'pages/dashboard_page.dart';
import 'pages/settings_page.dart';
import 'pages/contacts_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'fleetp/flogin_page.dart';
import 'fleetp/main_page.dart';
import 'pages/main_screen.dart';

// Future<void> main() async {
//   await dotenv.load(fileName: ".env");
//   runApp(CaraxisApp());
// }
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
        primarySwatch: Colors.blueGrey,
      ),
      //home: LoginPage(),
      //home: RegisterPage(),
      //home: ContactsPage(),
      //home: SettingsPage(),
      //home: DashboardPage(),
      //home: FLoginPage(),
      //home: MainPage(),
      home: MainScreen(),
    );
  }
}
