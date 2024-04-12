import 'package:flutter/material.dart';
import 'package:my_app/components/barangwidget.dart';
import 'package:my_app/screens/routes/inside_routes/kipas_screen.dart';
import 'package:my_app/screens/routes/inside_routes/polo_screen.dart';
import 'package:my_app/screens/routes/second_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Material(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => KipasScreen()));
                  },
                  child: BarangWidget(
                      imageUrl: 'assets/images/kipas_angin.jpg',
                      containerName: 'Kipas Angin'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PoloScreen()));
                  },
                  child: BarangWidget(
                      imageUrl: 'assets/images/baju_polo.jpg',
                      containerName: 'Baju Polo FTK'),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}