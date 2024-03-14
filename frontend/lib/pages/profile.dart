import 'package:e_waste/pages/login.dart';
import 'package:e_waste/utlis/shared_preferences_manager.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key});

  @override
  Widget build(BuildContext context) {
    SharedPreferences? prefs = SharedPreferencesManager.preferences;
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            // Stack with rounded image
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.13),
                  height: MediaQuery.of(context).size.height * 0.2,
                  color: Colors.green.shade800,
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.10,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Color.fromARGB(
                            255, 209, 255, 238), // Set the color of the border
                        width: 5.0, // Set the width of the border
                      ),
                    ),
                    child: CircleAvatar(
                      radius: MediaQuery.of(context).size.height * 0.10,
                      backgroundColor: Colors.grey,
                      backgroundImage:
                          const AssetImage('assets/images/profile.jpg'),
                    ),
                  ),
                )
              ],
            ),
            const Text(
              "Bucket Fighter",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
            const SizedBox(
              height: 12,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Phone",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  Text("+91 9789086071", style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Email",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  Text("test@gmail.com", style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Location",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  Text("kjff afdd", style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Phone",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  Text("+91 9789086071", style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Email",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  Text("test@gmail.com", style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Location",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  Text("kjff afdd", style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
            const Spacer(),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade800,
                    foregroundColor: Colors.yellow,
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 60)),
                onPressed: () async {
                  await prefs?.clear();
                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
                child: Text(
                  "Logout",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                )),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
