import 'package:flutter/material.dart';

class TambahRuanganScreen extends StatefulWidget {
  const TambahRuanganScreen({Key? key}) : super(key: key);

  @override
  _TambahRuanganScreenState createState() => _TambahRuanganScreenState();
}

class _TambahRuanganScreenState extends State<TambahRuanganScreen> {
  TextEditingController _ruanganController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Ruangan'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  minimumSize:
                      Size(110.0, 30.0), // Sesuaikan dengan keinginan Anda
                ),
                child: Icon(
                  Icons.camera_alt,
                  size: 50.0,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: _ruanganController,
                decoration: InputDecoration(
                  labelText: 'Nama Ruangan',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String ruanganName = _ruanganController.text;
                  if (ruanganName.isNotEmpty) {
                    Navigator.pop(context, ruanganName);
                  }
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
