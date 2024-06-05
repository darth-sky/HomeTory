import 'package:flutter/material.dart';

class RoomInventoryWidget extends StatelessWidget {
  final String imageUrl;
  final String roomName;
  final int containerCount;
  final int itemCount;

  const RoomInventoryWidget(
      {Key? key,
      required this.imageUrl,
      required this.roomName,
      required this.itemCount,
      required this.containerCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 356,
      height: 290,
      margin: EdgeInsets.all(18),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blueGrey[100],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 300,
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Text(
            roomName,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            height: 35,
            child: ListTile(
              leading: Icon(Icons.storage),
              title: Text(
                'Jumlah Container: $containerCount',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            child: ListTile(
              leading: Icon(Icons.category),
              title: Text(
                'Jumlah Barang: $itemCount',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PointItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const PointItem({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
    );
  }
}
