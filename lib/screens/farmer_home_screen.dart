import 'package:flutter/material.dart';
import 'package:hydroponics_app/widgets/farmer_plant_card.dart';
import 'package:hydroponics_app/widgets/maintenance_schedule_card.dart';
import 'package:hydroponics_app/widgets/styled_elevated_button.dart';

class FarmerHomeScreen extends StatefulWidget {
  const FarmerHomeScreen({super.key});

  @override
  State<FarmerHomeScreen> createState() => _FarmerHomeScreenState();
}

class _FarmerHomeScreenState extends State<FarmerHomeScreen> {
  int _selectedIndex = 0;

  // Fungsi untuk mengubah index saat item diklik
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: const Color.fromARGB(255, 1, 68, 33),
        foregroundColor: Colors.white,
        titleSpacing: 20,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Username',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text('Role', style: TextStyle(fontSize: 14)),
          ],
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: GestureDetector(
            onTap: () {
              // Navigator.pushNamed(context, '/farmer_profile');
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(7),
              ),
              child: const Icon(
                Icons.account_circle,
                color: Colors.white,
                size: 35,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: InkWell(
              onTap: () {
                // Navigator.pushNamed(context, '/login');
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: const Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 160,
            child: ColoredBox(
              color: Color.fromARGB(255, 1, 68, 33),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      FarmerPlantCard(plantName: 'Selada', plantCount: 67),
                      SizedBox(width: 10),
                      FarmerPlantCard(plantName: 'Seledri', plantCount: 35),
                      SizedBox(width: 10),
                      FarmerPlantCard(plantName: 'Pakcoy', plantCount: 50),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StyledElevatedButton(
                  text: 'Tambah Data Tanaman ',
                  onPressed: () {
                    // Handle add plant action
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
                      installation: 'Instalasi 1',
                      dateTime: '25 Juni 2024, 08:00 AM',
                    ),
                    MaintenanceScheduleCard(
                      taskName: 'Pemeriksaan pH Air',
                      installation: 'Instalasi 2',
                      dateTime: '26 Juni 2024, 10:00 AM',
                    ),
                    MaintenanceScheduleCard(
                      taskName: 'Penggantian Air',
                      installation: 'Instalasi 3',
                      dateTime: '27 Juni 2024, 09:00 AM',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Riwayat'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Tugas Panen'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],

        type: BottomNavigationBarType.fixed, // Memaksa agar tetap tipe fixed

        selectedItemColor: Color.fromARGB(255, 1, 68, 33), // Warna item aktif
        unselectedItemColor: Colors.grey, // Warna item tidak aktif
        backgroundColor: const Color.fromARGB(255, 231, 255, 237),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
