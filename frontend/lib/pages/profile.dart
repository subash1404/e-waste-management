import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage();

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

var size, height, width;

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF2EBD1),
        title: Text(
          "Profile",
          style: TextStyle(
            color: Colors.black, // Text color
            fontWeight: FontWeight.bold, // Bold text
            fontSize: 20.0, // Font size
          ),
        ),
        centerTitle: true, // Center the title
      ),
      backgroundColor: Color(0xFFF2EBD1),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.01,
            ),
            CircleAvatar(
              radius: 80,
              backgroundColor: Color(0xFFF2EBD1),
              backgroundImage: AssetImage('lib/image/hub.png'),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Text(
              "NAME",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo.shade900),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 230, 5),
              child: Text(
                "Video preferences",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              height: height * 0.05,
              width: width * 0.86,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFF8F8144), // Border color
                  width: 2.0, // Border width
                ),
                borderRadius: BorderRadius.circular(12.0), // Border radius
                color: Colors.transparent, // Container background color
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 200, 5),
                child: Text(
                  "NAME",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Container(
              height: height * 0.05,
              width: width * 0.86,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFF8F8144), // Border color
                  width: 2.0, // Border width
                ),
                borderRadius: BorderRadius.circular(12.0), // Border radius
                color: Colors.transparent, // Container background color
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 200, 5),
                child: Text(
                  "NAME",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 230, 5),
              child: Text(
                "Account Settings",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              height: height * 0.05,
              width: width * 0.86,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFF8F8144), // Border color
                  width: 2.0, // Border width
                ),
                borderRadius: BorderRadius.circular(12.0), // Border radius
                color: Colors.transparent, // Container background color
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 200, 5),
                child: Text(
                  "NAME",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Container(
              height: height * 0.05,
              width: width * 0.86,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFF8F8144), // Border color
                  width: 2.0, // Border width
                ),
                borderRadius: BorderRadius.circular(12.0), // Border radius
                color: Colors.transparent, // Container background color
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 200, 5),
                child: Text(
                  "NAME",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Container(
              height: height * 0.05,
              width: width * 0.86,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFF8F8144), // Border color
                  width: 2.0, // Border width
                ),
                borderRadius: BorderRadius.circular(12.0), // Border radius
                color: Colors.transparent, // Container background color
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 200, 5),
                child: Text(
                  "NAME",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Container(
              height: height * 0.05,
              width: width * 0.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0), // Border radius
                color: Color(0xFF8F8144), // Container background color
              ),
              child: Center(
                child: Text(
                  "Sign Out",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
