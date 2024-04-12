import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  bool _isNotificationEnabled = true;
  bool _isSoundEnabled = false;
  bool _isDarkModeEnabled = false;
  double _fontSize = 16.0; // Fonst size in points

  void _toggleNotification(bool value) {
    setState(() {
      _isNotificationEnabled = value;
    });
    // Add logic to handle notification preferences
  }

  void _toggleSound(bool value) {
    setState(() {
      _isSoundEnabled = value;
    });
    // Add logic to handle sound preferences
  }

  void _toggleDarkMode(bool value) {
    setState(() {
      _isDarkModeEnabled = value;
    });
    // Add logic to handle dark mode preferences
  }

  void _changeFontSize() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choose Font Size'),
          content: Slider(
            value: _fontSize,
            min: 12.0,
            max: 24.0,
            divisions: 12,
            label: _fontSize.round().toString(),
            onChanged: (value) {
              setState(() {
                _fontSize = value;
              });
            },
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                // Add logic to save font size preference
              },
            ),
          ],
        );
      },
    );
  }

  void _changeLanguage() {
    // Add logic to navigate to language selection screen
  }

  void _resetSettings() {
    // Add logic to reset all settings to default
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Suara'),
            trailing: Switch(
              value: _isSoundEnabled,
              onChanged: _toggleSound,
            ),
          ),
          ListTile(
            title: Text('Mode Gelap'),
            trailing: Switch(
              value: _isDarkModeEnabled,
              onChanged: _toggleDarkMode,
            ),
          ),
          ListTile(
            title: Text('Ukuran Font'),
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: _changeFontSize,
            ),
          ),
          ListTile(
            title: Text('Bahasa'),
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: _changeLanguage,
            ),
          ),
          ListTile(
            title: Text('Reset Settings'),
            onTap: _resetSettings,
          ),
        ],
      ),
    );
  }
}
