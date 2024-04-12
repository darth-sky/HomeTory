import 'package:flutter/material.dart';
class EditKipas extends StatefulWidget {
  const EditKipas({ Key? key }) : super(key: key);

  @override
  _EditKipasState createState() => _EditKipasState();
}

class _EditKipasState extends State<EditKipas> {
  TextEditingController _itemController =
      TextEditingController(text: 'Kipas Angin');
  TextEditingController _itemQtyController = TextEditingController(text: '1');
  TextEditingController _descQtyController = TextEditingController(text: '-');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Kipas Angin'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.zero,
                child: Image.asset(
                  'assets/images/kipas_angin.jpg',
                  width: 150,
                  fit: BoxFit.contain,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  minimumSize: Size(110.0, 30.0),
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
                  String itemName = _itemController.text;
                  if (itemName.isNotEmpty) {
                    Navigator.pop(context, itemName);
                  }
                },
                child: Text('Edit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}