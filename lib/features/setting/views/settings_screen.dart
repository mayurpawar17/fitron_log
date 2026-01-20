import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: const [
          ListTile(
            title: Text('Profile'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            title: Text('Notifications'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(title: Text('Dark Mode'), trailing: Icon(Icons.toggle_on)),
          ListTile(title: Text('Logout'), trailing: Icon(Icons.exit_to_app)),
        ],
      ),
    );
  }
}
