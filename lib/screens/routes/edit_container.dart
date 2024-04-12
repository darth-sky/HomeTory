import 'package:flutter/material.dart';
class EditContainer extends StatefulWidget {
  const EditContainer({ Key? key }) : super(key: key);

  @override
  _EditContainerState createState() => _EditContainerState();
}

class _EditContainerState extends State<EditContainer> {
  TextEditingController _containerController = TextEditingController(text: 'Lemari');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Lemari'),
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
                    'assets/images/lemari.jpg',
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
              controller: _containerController,
              decoration: InputDecoration(
                labelText: 'Nama Container',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                String containerName = _containerController.text;
                if (containerName.isNotEmpty) {
                  Navigator.pop(context, containerName);
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