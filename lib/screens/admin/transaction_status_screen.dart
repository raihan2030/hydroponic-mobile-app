import 'package:flutter/material.dart';
import 'package:hydroponics_app/models/plant_model.dart';
import 'package:hydroponics_app/models/plant_quantity_model.dart';
import 'package:hydroponics_app/models/transaction_model.dart';
import 'package:hydroponics_app/theme/app_colors.dart';
import 'package:hydroponics_app/widgets/styled_elevated_button.dart';
import 'package:hydroponics_app/widgets/transaction_status_card.dart';

class TransactionStatusScreen extends StatefulWidget{
  const TransactionStatusScreen({super.key});

  @override
  State<TransactionStatusScreen> createState() => _TransactionStatusScreenState();
}

class _TransactionStatusScreenState extends State<TransactionStatusScreen> {
  List<PlantModel> plants = [
    PlantModel(plantName: 'Selada', price: 5000),
    PlantModel(plantName: 'Pakcoy', price: 6000),
    PlantModel(plantName: 'Kangkung', price: 7000),
  ];

  List<TransactionModel> get _transactionData => [
    TransactionModel(
      customerName: 'Ahmad Sobri', 
      plantQuantity: [
        PlantQuantityModel(plant: plants[0], quantity: 23),
        PlantQuantityModel(plant: plants[1], quantity: 25),
        PlantQuantityModel(plant: plants[2], quantity: 27),
      ], 
      address: 'Jl. Ahmad Yani, km. 7', 
      date: '19 Oktober 2025', 
      time: '10:00 AM',
      isHarvest: true,
      isDeliver: true,
      isPaid: true
    ),
    TransactionModel(
      customerName: 'Ahmad Sanip', 
      plantQuantity: [
        PlantQuantityModel(plant: plants[0], quantity: 33),
        PlantQuantityModel(plant: plants[2], quantity: 19),
      ], 
      address: 'Jl. Gatot Subroto, km. 6,3', 
      date: '15 Oktober 2025', 
      time: '10:00 AM',
      isHarvest: true,
    ),
    TransactionModel(
      customerName: 'Syarifuddin', 
      plantQuantity: [
        PlantQuantityModel(plant: plants[1], quantity: 26),
        PlantQuantityModel(plant: plants[2], quantity: 50),
      ], 
      address: 'Jl. Pekapuran Raya, km. 4', 
      date: '08 Oktober 2025', 
      time: '10:00 AM',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Status Transaksi', style: TextStyle(fontWeight: FontWeight.bold),),
        titleSpacing: 10,
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 1, 68, 33),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: AppColors.primary,
            width: double.infinity,
            padding: EdgeInsets.all(15),
            child: StyledElevatedButton(
              text: 'Ekspor Data', 
              onPressed: () {
                
              },
              foregroundColor: AppColors.primary,
              backgroundColor: Colors.white,
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: _transactionData.length,
                itemBuilder: (BuildContext context, int index) {
                  return TransactionStatusCard(
                    transaction: _transactionData[index],
                  );
                }, 
                separatorBuilder: (BuildContext context, int index) { 
                  return SizedBox(height: 10,);
                }, 
              ),
            ),
          ),
        ],
      )
    );
  }
}

