import 'package:e_waste/models/info_item.dart';
import 'package:e_waste/pages/home.dart';
import 'package:e_waste/pages/info.dart';
import 'package:e_waste/pages/map.dart';
import 'package:e_waste/pages/nav.dart';
import 'package:e_waste/pages/login.dart';
import 'package:e_waste/pages/pickup.dart';
import 'package:e_waste/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:e_waste/pages/splash.dart';

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 156, 27, 255),
  ),
  textTheme: GoogleFonts.ptSansTextTheme(),
);

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await SharedPreferencesManager.init();
  // await dotenv.load();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: NavPage(),
    );
  }
}
