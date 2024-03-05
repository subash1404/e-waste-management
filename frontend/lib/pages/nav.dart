import 'package:e_waste/pages/home.dart';
import 'package:e_waste/pages/info.dart';
import 'package:e_waste/pages/map.dart';
import 'package:e_waste/pages/pickup.dart';
import 'package:e_waste/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:e_waste/pages/login.dart';
import 'package:e_waste/pages/signup.dart';
import 'package:e_waste/pages/splash.dart';

class NavPage extends StatefulWidget {
  const NavPage({Key? key}) : super(key: key);

  @override
  _NavPageState createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.green.shade900,
      body: _getBody(),
      bottomNavigationBar: Container(
        color: Colors.green.shade800,
        padding: EdgeInsets.only(right: 4, left: 4, top: 4, bottom: 0),
        child: BottomNavigationBar(
          // backgroundColor: Color.fromARGB(255, 246, 255, 227),
          backgroundColor: Colors.green.shade800,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12,
          currentIndex: _tabIndex,
          onTap: _changeTabIndex,
          selectedItemColor: Colors.yellow, // Set selected item color to white
          unselectedItemColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: [
            _buildBottomNavItem(Icons.home, "Home"),
            _buildBottomNavItem(Icons.add_location, "Location"),
            _buildBottomNavItem(Icons.add_circle_outline_rounded, "Add"),
            _buildBottomNavItem(Icons.info, "Information"),
            _buildBottomNavItem(Icons.person_sharp, "Profile"),
          ],
        ),
      ),

      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.only(bottom: 0.0),
      //   child: FloatingActionButton(
      //     backgroundColor: Colors.green.shade800,
      //     shape: CircleBorder(),
      //     onPressed: () => Navigator.of(context)
      //         .push(MaterialPageRoute(builder: (context) => SignupPage())),
      //     child: const Icon(Icons.add, color: Colors.white),
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void _changeTabIndex(int index) {
    setState(() {
      _tabIndex = index;
    });
  }

  BottomNavigationBarItem _buildBottomNavItem(
    IconData icon,
    String label,
  ) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
      ), // Set the color of the icon to the active color
      label: label,
    );
  }

  List<Map<String, String>> infoItems = [
    {'image': 'assets/images/fridge.png', 'title': 'Title 1'},
    {'image': 'assets/images/tv.png', 'title': 'Title 2'},
    {'image': 'assets/images/camera.png', 'title': 'Title 3'},
    {'image': 'assets/images/pc.png', 'title': 'Title 4'},
    {'image': 'assets/images/fridge.png', 'title': 'Title 1'},
    {'image': 'assets/images/tv.png', 'title': 'Title 2'},
    {'image': 'assets/images/camera.png', 'title': 'Title 3'},
    {'image': 'assets/images/pc.png', 'title': 'Title 4'},
    {'image': 'assets/images/fridge.png', 'title': 'Title 1'},
    {'image': 'assets/images/tv.png', 'title': 'Title 2'},
    {'image': 'assets/images/camera.png', 'title': 'Title 3'},
    {'image': 'assets/images/pc.png', 'title': 'Title 4'},
    // Add more items as needed
  ];

  Widget _getBody() {
    switch (_tabIndex) {
      case 0:
        return const HomePage();
      case 1:
        return MapPage();
      case 2:
        return PickupPage();
      case 3:
        return InfoItemList(
          items: infoItems,
        );
      case 4:
        return ProfilePage();
      default:
        return LoginPage();
    }
  }
}
