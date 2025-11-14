import 'package:flutter/material.dart';
import 'package:hydroponics_app/widgets/farmer_plant_card.dart';
import 'package:hydroponics_app/widgets/home_app_bar.dart';
import 'package:hydroponics_app/widgets/maintenance_schedule_card.dart';
import 'package:hydroponics_app/widgets/styled_elevated_button.dart';

class FarmerHomeScreen extends StatefulWidget {
  const FarmerHomeScreen({super.key});

  @override
  State<FarmerHomeScreen> createState() => _FarmerHomeScreenState();
}

class _FarmerHomeScreenState extends State<FarmerHomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: HomeAppBar(
          username: 'Muhammad Raihan', 
          role: 'Petani Selada', 
          onNotificationTap: () {
            Navigator.pushNamed(context, '/notification');
          },
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(15),
            color: Color.fromARGB(255, 1, 68, 33),
            child: 
              FarmerPlantCard(header: 'Total Bibit Ditanam', plantCount: 67),
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
                ListView(
                  shrinkWrap: true,
                  children: [
                    MaintenanceScheduleCard(
                      taskName: 'Penambahan Nutrisi',
                      date: '08:00 AM',
                      time: '25 Juni 2024',
                      onTap: () {
                        Navigator.pushNamed(context, '/maintenance_detail');
                      },
                    ),
                    MaintenanceScheduleCard(
                      taskName: 'Pemeriksaan pH Air',
                      date: '10:00 AM',
                      time: '26 Juni 2024',
                      onTap: () {
                        Navigator.pushNamed(context, '/maintenance_detail');
                      },
                    ),
                    MaintenanceScheduleCard(
                      taskName: 'Penggantian Air',
                      date: '09:00 AM',
                      time: '27 Juni 2024',
                      onTap: () {
                        Navigator.pushNamed(context, '/maintenance_detail');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
