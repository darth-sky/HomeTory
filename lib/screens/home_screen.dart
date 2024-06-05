import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/components/asset_image_rounded.dart';
import 'package:my_app/components/asset_image_widget.dart';
import 'package:my_app/components/inventorywidget.dart';
import 'package:my_app/components/text_container.dart';
import 'package:my_app/dto/ruangan.dart';
import 'package:my_app/endpoints/endpoint.dart';
import 'package:my_app/screens/routes/inside_routes/tambahRuangan_screen.dart';
import 'package:my_app/screens/routes/kamartdr_screen.dart';
import 'package:my_app/screens/routes/second_screen.dart';
import 'package:my_app/services/data_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<Ruangan>>? _ruangan;

  @override
  void initState() {
    super.initState();
    _ruangan = DataService.fetchRuangan();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                FutureBuilder<List<Ruangan>>(
                  future: _ruangan,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final data = snapshot.data!;
                      return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          final item = data[index];
                          return Text(item.nama_ruangan);
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Center(child: Text('${snapshot.error}'));
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TambahRuanganScreen(),
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blueGrey[300],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
