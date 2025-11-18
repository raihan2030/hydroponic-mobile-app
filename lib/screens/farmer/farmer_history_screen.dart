import 'package:flutter/material.dart';
import 'package:hydroponics_app/models/plant_history_model.dart';
import 'package:hydroponics_app/widgets/farmer_history_expansion_item.dart';

class FarmerHistoryScreen extends StatefulWidget {
  const FarmerHistoryScreen({super.key});

  @override
  State<FarmerHistoryScreen> createState() => _FarmerHistoryScreenState();
}

class _FarmerHistoryScreenState extends State<FarmerHistoryScreen> {
  final List<PlantHistoryModel> _data = List.generate(5, (int index) =>
    PlantHistoryModel(
      date: '0${index + 1} November 2025', 
      plantQty: 40 + index, 
      harvestQty: 30 + index, 
      onPlantEdit: () {}, 
      onPlantDelete: () {}, 
      onHarvestEdit: () {}, 
      onHarvestDelete: () {}, 
      onDeleteAll: () {},
    )
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Riwayat Tanam', style: TextStyle(fontWeight: FontWeight.bold),),
        titleSpacing: 25,
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 1, 68, 33),
        automaticallyImplyLeading: false,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            padding: EdgeInsets.all(15),
            child: ListView.builder(
              itemCount: _data.length,
              itemBuilder: (BuildContext context, int index) {
                return FarmerHistoryExpansionItem(
                  history: _data[index],
                  screenWidth: constraints.maxWidth,
                );
              }
            ),
          );
        }
      )
      
    );
  }
}

