import 'dart:convert';

import 'package:e_waste/models/product.dart';
import 'package:e_waste/utlis/shared_preferences_manager.dart';
import 'package:e_waste/widgets/request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  SharedPreferences? prefs = SharedPreferencesManager.preferences;
  late List<Product> products = [];

  Future<void> getProductsFromDB() async {
    var userId = prefs?.getString("userId");
    if (userId == null) {
      throw "Login First";
    }
    try {
      var resoponse = await http.get(
        Uri.parse(
            "http://${dotenv.env["BACKEND_BASE_API"]}/request/getRequest?userId=${userId}"),
        headers: {"Content-Type": "application/json"},
      );
      var responseData = jsonDecode(resoponse.body);
      List<Product> updatedProducts = [];
      for (var product in responseData) {
        updatedProducts.add(Product(
            title: product["title"],
            weight: product["weight"],
            status: product["status"]));
      }
      setState(() {
        products = updatedProducts;
      });
    } catch (err) {
      throw "Something went wrong";
    }
  }

  @override
  void initState() {
    super.initState();
    getProductsFromDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // backgroundColor: const Color(0xFFE0F0DE),
      appBar: AppBar(
        title: const Text("Recents"),
        backgroundColor: Colors.green.shade800,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: ((context, index) {
                final product = products[index];
                return Request(
                  title: product.title,
                  weight: product.weight,
                  status: product.status,
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
