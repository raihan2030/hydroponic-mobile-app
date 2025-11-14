import 'package:flutter/material.dart';
import 'package:hydroponics_app/models/harvest_assignment_model.dart';
import 'package:hydroponics_app/widgets/harvest_assignment_card.dart';

class FarmerHarvestScreen extends StatefulWidget {
  const FarmerHarvestScreen({super.key});

  @override
  State<FarmerHarvestScreen> createState() => _FarmerHarvestScreenState();
}

class _FarmerHarvestScreenState extends State<FarmerHarvestScreen> {
  final List<HarvestAssignmentModel> _data = List<HarvestAssignmentModel>.generate(5, (int index) =>
    HarvestAssignmentModel(
      customerName: 'Nama Pelanggan', 
      plantName: 'Selada', 
      plantQty: 20 + index, 
      address: 'Jl. Martapura Lama, Komplek Putra Gemilang Raya', 
      date: '0${index + 1} November 2025', 
      time: '08:00 AM'
    )
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Tugas Panen', style: TextStyle(fontWeight: FontWeight.bold),),
        titleSpacing: 25,
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 1, 68, 33),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 15, right: 20, left: 20),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return HarvestAssignmentCard(assignment: _data[index]);
          },
        ),
      ),
    );
  }
}