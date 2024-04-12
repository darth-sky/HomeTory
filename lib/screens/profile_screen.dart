import 'package:flutter/material.dart';
import 'package:my_app/screens/routes/second_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

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

// class ProfileScreen2 extends StatelessWidget {
//   const ProfileScreen2({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         appBar: AppBar(
//           bottom: const TabBar(
//             tabs: [
//               Tab(icon: Icon(Icons.directions_car)),
//               Tab(
//                 icon: Icon(Icons.directions_transit),
//               ),
//               Tab(
//                 icon: Icon(Icons.directions_bike),
//               )
//             ],
//           ),
//           title: const Text('Demo Tab Bar'),
//         ),
//         body: const TabBarView(children: [
//           Icon(Icons.directions_car),
//           Icon(Icons.directions_transit),
//           Icon(Icons.directions_bike),
//         ]),
//       ),
//     );
//   }
// }
