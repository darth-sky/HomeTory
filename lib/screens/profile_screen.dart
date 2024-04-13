import 'package:flutter/material.dart';
import 'package:my_app/screens/routes/second_screen.dart';

class BarangScreen extends StatelessWidget {
  const BarangScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(
                icon: Icon(Icons.directions_transit),
              ),
              Tab(
                icon: Icon(Icons.directions_bike),
              )
            ],
          ),
          title: const Text('Demo Tab Bar'),
        ),
        body: TabBarView(children: [
          Icon(Icons.directions_car),
          Icon(Icons.directions_transit),
          Center(
            child: TextButton(
              onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondScreen()
              ),
            ), child: Text('Navigate to Second Screen'),),
          ),
        ]),
      ),
    );
  }
}

