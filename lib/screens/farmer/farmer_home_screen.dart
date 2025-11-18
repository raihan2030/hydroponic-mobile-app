import 'package:flutter/material.dart';
import 'package:hydroponics_app/models/plant_maintenance_model.dart';
import 'package:hydroponics_app/models/user_model.dart';
import 'package:hydroponics_app/widgets/farmer_total_plant_card.dart';
import 'package:hydroponics_app/widgets/home_app_bar.dart';
import 'package:hydroponics_app/widgets/maintenance_schedule_card.dart';
import 'package:hydroponics_app/widgets/styled_elevated_button.dart';

class FarmerHomeScreen extends StatefulWidget {
  const FarmerHomeScreen({super.key});

  @override
  State<FarmerHomeScreen> createState() => _FarmerHomeScreenState();
}

class _FarmerHomeScreenState extends State<FarmerHomeScreen> {
  List<PlantMaintenanceModel> get _data => [
    PlantMaintenanceModel(
      maintenanceName: 'Penambahan Nutrisi', 
      description: 'Petani menambahkan dan mengecek nutrisi di penampungan air hidroponik', 
      date: '25 Juni 2025', 
      time: '08:00 AM', 
      onTap: () {
        Navigator.pushNamed(context, '/maintenance_detail');
      }
    ),
    PlantMaintenanceModel(
      maintenanceName: 'Pemeriksaan pH Air', 
      description: 'hjbadhabdhasbdhbdhadbahdbhadbhabdahdbasdbahbdhab', 
      date: '26 Juni 2025', 
      time: '10:00 AM', 
      onTap: () {
        Navigator.pushNamed(context, '/maintenance_detail');
      }
    ),
    PlantMaintenanceModel(
      maintenanceName: 'Penggantian Air', 
      description: 'hjbadhabdhasbdhbdhadbahdbhadbhabdahdbasdbahbdhab', 
      date: '27 Juni 2025', 
      time: '09:00 AM', 
      onTap: () {
        Navigator.pushNamed(context, '/maintenance_detail');
      }
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: HomeAppBar(
          user: UserModel(
            username: 'Muhammad Raihan', 
            role: 'Petani Selada',
            onNotificationTap: () {
              Navigator.pushNamed(context, '/notification');
            },
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(15),
              color: Color.fromARGB(255, 1, 68, 33),
              child: 
                FarmerTotalPlantCard(header: 'Total Bibit Ditanam', plantCount: 67),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StyledElevatedButton(
                    text: 'Tambah Data Tanaman ',
                    onPressed: () {
                      Navigator.pushNamed(context, '/add_plant_data');
                    },
                    foregroundColor: Colors.white,
                    backgroundColor: Color.fromARGB(255, 1, 68, 33),
                    icon: Icons.add,
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Daftar Jadwal',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: _data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return MaintenanceScheduleCard(
                        maintenance: _data[index],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}
