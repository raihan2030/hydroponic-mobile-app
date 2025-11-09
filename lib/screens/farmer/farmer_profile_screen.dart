import 'package:flutter/material.dart';

class FarmerProfileScreen extends StatelessWidget {
  const FarmerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Petani'),
      ),
      body: const Center(
        child: Text('Halaman Profil Petani'),
      ),
    );
  }
}