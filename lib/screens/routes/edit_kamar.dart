import 'package:flutter/material.dart';

class EditKamar extends StatefulWidget {
  const EditKamar({Key? key}) : super(key: key);

  @override
  _EditKamarState createState() => _EditKamarState();
}

class _EditKamarState extends State<EditKamar> {
  TextEditingController _ruanganController =
      TextEditingController(text: 'Kamar Tidur');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Kamar Tidur'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.zero,
                  child: Image.asset(
                    'assets/images/bedroom.jpg',
                    width: 350,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                minimumSize:
                    Size(110.0, 30.0), 
              ),
              child: Icon(
                Icons.camera_alt,
                size: 50.0,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _ruanganController,
              decoration: InputDecoration(
                labelText: 'Nama Ruangan',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                String ruanganName = _ruanganController.text;
                if (ruanganName.isNotEmpty) {
                  Navigator.pop(context, ruanganName);
                }
              },
              child: Text('Edit'),
            ),
          ],
        ),
      ),
    );
  }
}
