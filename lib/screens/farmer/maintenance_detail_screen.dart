import 'package:flutter/material.dart';
import 'package:hydroponics_app/models/plant_maintenance_model.dart';
import 'package:hydroponics_app/theme/app_colors.dart';
import 'package:hydroponics_app/widgets/maintenance_detail_card.dart';

class MaintenanceDetailScreen extends StatefulWidget {
  const MaintenanceDetailScreen({super.key});
  
  @override
  State<MaintenanceDetailScreen> createState() => _MaintenanceDetailScreenState();
}

class _MaintenanceDetailScreenState extends State<MaintenanceDetailScreen> {
  PlantMaintenanceModel maintenance = PlantMaintenanceModel(
    maintenanceName: 'Penambahan Nutrisi', 
    description: 'Petani menambahkan dan mengecek nutrisi di penampungan air hidroponik', 
    date: '25 Juni 2025', 
    time: '08:00 AM', 
    onTap: () {}
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: const Text(
          'Detail Perawatan',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        titleSpacing: 10,
        foregroundColor: Colors.white,
        backgroundColor: AppColors.primary,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: MaintenanceDetailCard(maintenance: maintenance),
        ),
      )
    );
  }
}