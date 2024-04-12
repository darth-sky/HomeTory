import 'package:flutter/material.dart';
import 'package:my_app/screens/routes/edit_kipas.dart';

class KipasScreen extends StatefulWidget {
  const KipasScreen({Key? key}) : super(key: key);

  @override
  _KipasScreenState createState() => _KipasScreenState();
}

class _KipasScreenState extends State<KipasScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kipas Angin'),
        backgroundColor: Colors.blueGrey,
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
                    borderRadius: BorderRadius.circular(
                        20), 
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
                    borderRadius: BorderRadius.circular(
                        20), 
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
                  borderRadius: BorderRadius.circular(
                      20), 
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
                  borderRadius: BorderRadius.circular(
                      20), 
                  child: Image.asset(
                    'assets/images/kipas_angin.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Quantity: 1',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Deskripsi: -',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
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
              child: Text("Edit Item"),
              value: "edit_item",
            ),
            PopupMenuItem(
              child: Text("Hapus Item"),
              value: "hapus_item",
            ),
          ],
          onSelected: (value) {
            if (value == "edit_item") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditKipas()),
              );
            } else if (value == "hapus_item") {

            }
          },
        ),
      ),
    );
  }
}
