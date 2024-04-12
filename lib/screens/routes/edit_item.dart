import 'package:flutter/material.dart';

class EditItem extends StatefulWidget {
  const EditItem({Key? key}) : super(key: key);

  @override
  _EditItemState createState() => _EditItemState();
}

class _EditItemState extends State<EditItem> {
  TextEditingController _itemController =
      TextEditingController(text: 'Baju Polo FTK');
  TextEditingController _itemQtyController = TextEditingController(text: '1');
  TextEditingController _descQtyController = TextEditingController(text: '-');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Baju Polo FTK'),
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
                  'assets/images/baju_polo.jpg',
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
