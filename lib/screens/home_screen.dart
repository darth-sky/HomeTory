import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/components/asset_image_rounded.dart';
import 'package:my_app/components/asset_image_widget.dart';
import 'package:my_app/components/inventorywidget.dart';
import 'package:my_app/components/text_container.dart';
import 'package:my_app/screens/routes/inside_routes/tambahRuangan_screen.dart';
import 'package:my_app/screens/routes/kamartdr_screen.dart';
import 'package:my_app/screens/routes/second_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => KamartdrScreen(),
                      ),
                    );
                  },
                  child: RoomInventoryWidget(
                    imageUrl: 'assets/images/bedroom.jpg',
                    roomName: 'Kamar Tidur',
                    containerCount: 1,
                    itemCount: 2,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => KamartdrScreen(),
                      ),
                    );
                  },
                  child: RoomInventoryWidget(
                    imageUrl: 'assets/images/gudang.jpg',
                    containerCount: 2,
                    roomName: 'Gudang',
                    itemCount: 4,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => KamartdrScreen(),
                      ),
                    );
                  },
                  child: RoomInventoryWidget(
                    imageUrl: 'assets/images/living_room.jpg',
                    containerCount: 2,
                    roomName: 'Ruang Tamu',
                    itemCount: 4,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TambahRuanganScreen(),
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blueGrey[300],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
