import 'package:flutter/material.dart';
import 'package:hydroponics_app/screens/courier/courier_delivery_detail.dart';
import 'package:hydroponics_app/screens/courier_navigation.dart';
import 'package:hydroponics_app/screens/farmer/add_plant_data.dart';
import 'package:hydroponics_app/screens/farmer/maintenance_detail.dart';
import 'package:hydroponics_app/screens/farmer_navigation.dart';
import 'package:hydroponics_app/screens/login_screen.dart';
import 'package:hydroponics_app/screens/notification_screen.dart';
import 'package:hydroponics_app/screens/register_screen.dart';

void main() {
  runApp(const HydroponicApp());
}

class HydroponicApp extends StatelessWidget {
  const HydroponicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Ponic',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/courier_navigation',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/farmer_navigation': (context) => const FarmerNavigation(),
        '/add_plant_data': (context) => const AddPlantData(),
        '/maintenance_detail': (context) => const MaintenanceDetail(),
        '/notification': (context) => const NotificationScreen(),
        '/courier_navigation': (context) => const CourierNavigation(),
        '/courier_delivery_detail': (context) => const CourierDeliveryDetail()
      },
    );
  }
}