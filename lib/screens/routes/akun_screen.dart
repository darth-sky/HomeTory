import 'package:flutter/material.dart';

class AkunScreen extends StatefulWidget {
  const AkunScreen({Key? key}) : super(key: key);

  @override
  _AkunScreenState createState() => _AkunScreenState();
}

class _AkunScreenState extends State<AkunScreen> {
  TextEditingController _nameController = TextEditingController(text: 'admin');
  TextEditingController _emailController =
      TextEditingController(text: 'admin@gmail.com');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Account"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(
                    125),
                child: Image.asset(
                  'assets/images/profil.jpeg',
                  width: 250,
                  height: 250,
                  fit: BoxFit.cover, 
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Lakukan sesuatu dengan data nama dan email yang disimpan
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
