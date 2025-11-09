import 'package:flutter/material.dart';

class FarmerHarvestScreen extends StatelessWidget {
  const FarmerHarvestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Tugas Panen', style: TextStyle(fontWeight: FontWeight.bold),),
        titleSpacing: 25,
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 1, 68, 33),
      ),
      body: const Center(
        child: Text('Halaman Tugas Panen Petani'),
      ),
    );
  }
}