import 'dart:async';
import 'package:e_waste/pages/login.dart';
import 'package:e_waste/pages/signup.dart';
import 'package:e_waste/utlis/shared_preferences_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'nav.dart';
import 'package:flutter/material.dart'; // Import for Timer

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  @override
  State<SplashPage> createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  SharedPreferences? prefs = SharedPreferencesManager.preferences;

  void initPreferences() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs != null) {
      checkToken();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Unable to load Shared preferences")));
    }
  }

  void checkToken() {
    String? token = prefs?.getString("token");

    if (token == null) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginPage()));
      return;
    }
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => NavPage()));
  }

  @override
  void initState() {
    super.initState();
    initPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/splash.png',
              ),
              const SizedBox(height: 16),
              const Text(
                "Let's Learn",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Color.fromARGB(255, 0, 69, 187),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
