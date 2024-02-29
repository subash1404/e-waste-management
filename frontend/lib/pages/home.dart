import 'package:e_waste/models/request.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0F0DE),

      // backgroundColor: Color.fromARGB(255, 226, 241, 222),
      appBar: AppBar(
        title: const Text("Recents"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: const SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 8,
          ),
          Request(
              orderId: 12, status: "closed", title: "Product 1", weight: 12),
          Request(
              orderId: 12, status: "closed", title: "Product 1", weight: 12),
          Request(
              orderId: 12,
              status: "closed",
              title: "Prodsdfdfuct 1",
              weight: 12),
          Request(orderId: 12, status: "open", title: "Product 1", weight: 12),
          Request(
              orderId: 12, status: "closed", title: "Product 1", weight: 12),
          Request(
              orderId: 12, status: "closed", title: "Product 1", weight: 12),
          Request(
              orderId: 12, status: "closed", title: "Product 1", weight: 12),
          Request(
              orderId: 12,
              status: "closed",
              title: "Prodsdfdfuct 1",
              weight: 12),
          Request(orderId: 12, status: "open", title: "Product 1", weight: 12),
          Request(
              orderId: 12, status: "closed", title: "Product 1", weight: 12),
        ]),
      ),
    );
  }
}
