import 'package:flutter/material.dart';
import 'package:hydroponics_app/screens/admin/add_edit_transaction_screen.dart';
import 'package:hydroponics_app/screens/admin/admin_navigation.dart';
import 'package:hydroponics_app/screens/admin/employee_account_list_screen.dart';
import 'package:hydroponics_app/screens/admin/plant_status_screen.dart';
import 'package:hydroponics_app/screens/admin/transaction_status_screen.dart';
import 'package:hydroponics_app/screens/courier/courier_delivery_detail_screen.dart';
import 'package:hydroponics_app/screens/courier/courier_navigation.dart';
import 'package:hydroponics_app/screens/farmer/add_plant_data_screen.dart';
import 'package:hydroponics_app/screens/farmer/maintenance_detail_screen.dart';
import 'package:hydroponics_app/screens/farmer/farmer_navigation.dart';
import 'package:hydroponics_app/screens/login_screen.dart';
import 'package:hydroponics_app/screens/notification_screen.dart';
import 'package:hydroponics_app/screens/register_screen.dart';
import 'package:hydroponics_app/screens/select_role_screen.dart';

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
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/select_role': (context) => const SelectRoleScreen(),
        '/farmer_navigation': (context) => const FarmerNavigation(),
        '/add_plant_data': (context) => const AddPlantDataScreen(),
        '/maintenance_detail': (context) => const MaintenanceDetailScreen(),
        '/notification': (context) => const NotificationScreen(),
        '/courier_navigation': (context) => const CourierNavigation(),
        '/courier_delivery_detail': (context) => const CourierDeliveryDetailScreen(),
        '/admin_navigation': (context) => const AdminNavigation(),
        '/add_edit_transaction': (context) => const AddEditTransactionScreen(),
        '/employee_account_list': (context) => const EmployeeAccountListScreen(),
        '/transaction_status': (context) => const TransactionStatusScreen(),
        '/plant_status': (context) => const PlantStatusScreen()
      },
    );
  }
}