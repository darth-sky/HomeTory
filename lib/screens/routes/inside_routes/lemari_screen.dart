import 'package:flutter/material.dart';
import 'package:my_app/components/barangwidget.dart';
import 'package:my_app/components/custom_search_delegate.dart';
import 'package:my_app/screens/routes/edit_container.dart';
import 'package:my_app/screens/routes/inside_routes/polo_screen.dart';
import 'package:my_app/screens/routes/inside_routes/tambahContainer_screen.dart';
import 'package:my_app/screens/routes/inside_routes/tambahItem_screen.dart';

class LemariScreen extends StatefulWidget {
  const LemariScreen({Key? key}) : super(key: key);

  @override
  _LemariScreenState createState() => _LemariScreenState();
}

class _LemariScreenState extends State<LemariScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lemari'),
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(),
                );
              },
              icon: Icon(Icons.search)),
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditContainer(),
                  ),
                );
              },
              icon: Icon(Icons.edit)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'Lokasi: Kamar Tidur',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/bedroom.jpg',
                      fit: BoxFit.cover,
                      width: 100,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/lemari.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Barang:',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PoloScreen()),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BarangWidget(
                    imageUrl: 'assets/images/baju_polo.jpg',
                    containerName: 'Baju Polo FTK',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blueGrey,
        child: PopupMenuButton(
          itemBuilder: (context) => [
            PopupMenuItem(
              child: Text("Tambah Container"),
              value: "tambah_container",
            ),
            PopupMenuItem(
              child: Text("Tambah Item"),
              value: "tambah_item",
            ),
            PopupMenuItem(
              child: Text("Hapus Container"),
              value: "hapus_container",
            ),
          ],
          onSelected: (value) {
            switch (value) {
              case "tambah_container":
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TambahContainerScreen()),
                );
                break;
              case "tambah_item":
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TambahItemScreen()),
                );
                break;
            }
          },
        ),
      ),
    );
  }
}
