import 'package:flutter/material.dart';

class FarmerHarvestScreen extends StatelessWidget {
  const FarmerHarvestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tugas Panen'),
      ),
      body: const Center(
        child: Text('Halaman Tugas Panen Petani'),
      ),
    );
  }
}