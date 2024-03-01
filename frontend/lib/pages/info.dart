import 'package:e_waste/models/info_item.dart';
import 'package:flutter/material.dart';

class InfoItemList extends StatelessWidget {
  const InfoItemList({Key? key, required this.items}) : super(key: key);

  final List<Map<String, String>> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade800,
        title: Text("Recyclable Items"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        padding: EdgeInsets.all(16),
        children: items.map((item) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3), // Shadow color
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: InfoItem(
              image: item['image'] ?? '',
              title: item['title'] ?? '',
            ),
          );
        }).toList(),
      ),
    );
  }
}
