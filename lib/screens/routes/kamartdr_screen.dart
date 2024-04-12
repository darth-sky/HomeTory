import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/components/ContainerWidget.dart';
import 'package:my_app/components/asset_image_widget.dart';
import 'package:my_app/components/barangwidget.dart';
import 'package:my_app/components/custom_search_delegate.dart';
import 'package:my_app/screens/routes/inside_routes/kipas_screen.dart';
import 'package:my_app/screens/routes/inside_routes/lemari_screen.dart';
import 'package:my_app/screens/routes/inside_routes/tambahContainer_screen.dart';
import 'package:my_app/screens/routes/inside_routes/tambahItem_screen.dart';
import 'package:my_app/screens/routes/second_screen.dart';

class KamartdrScreen extends StatefulWidget {
  const KamartdrScreen({Key? key}) : super(key: key);

  @override
  _KamartdrScreenState createState() => _KamartdrScreenState();
}

class _KamartdrScreenState extends State<KamartdrScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kamar Tidur'),
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: CustomSearchDelegate(),);
              },
              icon: Icon(Icons.search)),
              IconButton(
              onPressed: () {
              },
              icon: Icon(Icons.edit)),
        ],
      ),
      body: Column(
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
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  TabBar(tabs: [
                    Tab(
                      icon: Icon(Icons.storage),
                      child: Text('Container'),
                    ),
                    Tab(
                      icon: Icon(Icons.category),
                      child: Text('Barang'),
                    ),
                  ]),
                  Expanded(
                    child: TabBarView(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LemariScreen(),
                                    ),
                                  );
                                },
                                child: ContainerWidget(
                                    imageUrl: 'assets/images/lemari.jpg',
                                    containerName: 'Lemari',
                                    itemCount: 1),
                              ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => KipasScreen(),
                                    ),
                                  );
                                },
                              child: BarangWidget(
                                  imageUrl: 'assets/images/kipas_angin.jpg',
                                  containerName: 'Kipas Angin'),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blueGrey,
        child: PopupMenuButton(
          itemBuilder: (context) => [
            PopupMenuItem(
              child: Text("Tambah Container"),
              value: "tambah_container",
            ),
            PopupMenuItem(
              child: Text("Tambah Item"),
              value: "tambah_item",
            ),
            PopupMenuItem(
              child: Text("Hapus Ruangan"),
              value: "hapus_ruangan",
            ),
          ],
          onSelected: (value) {
            switch (value) {
              case "tambah_container":
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TambahContainerScreen()),
                );
                break;
              case "tambah_item":
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TambahItemScreen()),
                );
                break;
            }
          },
        ),
      ),
    );
  }
}
