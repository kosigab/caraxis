import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            ListTile(
              title: Text('Theme'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to theme selection
              },
            ),
            ListTile(
              title: Text('Notifications'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to notifications settings
              },
            ),
            // Add more settings as necessary
          ],
        ).toList(),
      ),
    );
  }
}
