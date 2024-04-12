import 'package:flutter/material.dart';

class TambahItemScreen extends StatefulWidget {
  const TambahItemScreen({Key? key}) : super(key: key);

  @override
  _TambahItemScreenState createState() => _TambahItemScreenState();
}

class _TambahItemScreenState extends State<TambahItemScreen> {
  TextEditingController _itemController = TextEditingController();
  TextEditingController _itemQtyController = TextEditingController();
  TextEditingController _descQtyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Item'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(40.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
                child: Icon(
                  Icons.camera_alt,
                  size: 110.0,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: _itemController,
                decoration: InputDecoration(
                  labelText: 'Nama Item',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _itemQtyController,
                decoration: InputDecoration(
                    labelText: 'Quantity', border: OutlineInputBorder()),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _descQtyController,
                decoration: InputDecoration(
                    labelText: 'Deskripsi', border: OutlineInputBorder()),
              ),
              ElevatedButton(
                onPressed: () {
                },
                child: Text('Tambah'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
