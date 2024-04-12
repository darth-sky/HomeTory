import 'package:flutter/material.dart';

class TambahContainerScreen extends StatefulWidget {
  const TambahContainerScreen({Key? key}) : super(key: key);

  @override
  _TambahContainerScreenState createState() => _TambahContainerScreenState();
}

class _TambahContainerScreenState extends State<TambahContainerScreen> {
  TextEditingController _containerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Container'),
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
                    borderRadius:
                        BorderRadius.circular(18.0), 
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
                controller: _containerController,
                decoration: InputDecoration(
                  labelText: 'Nama Container',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Lakukan sesuatu dengan data yang disimpan
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
