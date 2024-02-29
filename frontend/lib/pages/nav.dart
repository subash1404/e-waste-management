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
      backgroundColor: Colors.green.shade900,
      body: _getBody(),
      bottomNavigationBar: Container(
        color: Colors.green.shade800,
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12,
          currentIndex: _tabIndex,
          onTap: _changeTabIndex,
          selectedItemColor: Colors.white, // Set selected item color to white
          unselectedItemColor: Colors.grey.shade300,
          items: [
            _buildBottomNavItem(Icons.home, "Home"),
            _buildBottomNavItem(Icons.add_location, "Location"),
            _buildBottomNavItem(Icons.shop, "Shop"),
            _buildBottomNavItem(Icons.settings, "Setting"),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 0.0),
        child: FloatingActionButton(
          backgroundColor: Colors.green.shade800,
          shape: CircleBorder(),
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => SignupPage())),
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void _changeTabIndex(int index) {
    setState(() {
      _tabIndex = index;
    });
  }

  BottomNavigationBarItem _buildBottomNavItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }

  Widget _getBody() {
    switch (_tabIndex) {
      case 0:
        return LoginPage();
      case 1:
        return SignupPage();
      case 2:
        return SplashPage();
      case 3:
        return LoginPage();
      case 4:
        return SignupPage();
      default:
        return LoginPage();
    }
  }
}
