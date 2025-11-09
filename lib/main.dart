import 'package:flutter/material.dart';
import 'package:hydroponics_app/screens/farmer_navigation.dart';
import 'package:hydroponics_app/screens/login_screen.dart';
import 'package:hydroponics_app/screens/register_screen.dart';

void main() {
  runApp(const HydroponicApp());
}

class HydroponicApp extends StatelessWidget {
  const HydroponicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hydroponic App',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/farmer_navigation',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/farmer_navigation': (context) => const FarmerNavigation(),
      },
    );
  }
}