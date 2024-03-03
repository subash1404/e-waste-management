import 'package:flutter/material.dart';

class InfoItem extends StatelessWidget {
  const InfoItem({Key? key, required this.image, required this.title})
      : super(key: key);

  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 100,
            width: 100,
            // fit: BoxFit.cover,
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
