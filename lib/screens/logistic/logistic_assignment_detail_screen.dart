import 'package:flutter/material.dart';
import 'package:hydroponics_app/models/delivery_assigntment_model.dart';
import 'package:hydroponics_app/models/plant_model.dart';
import 'package:hydroponics_app/models/plant_quantity_model.dart';
import 'package:hydroponics_app/models/transaction_model.dart';
import 'package:hydroponics_app/models/user_model.dart';
import 'package:hydroponics_app/theme/app_colors.dart';
import 'package:hydroponics_app/widgets/logistic_delivery_detail_card.dart';

class LogisticAssignmentDetailScreen extends StatefulWidget {
  const LogisticAssignmentDetailScreen({super.key});

  @override
  State<LogisticAssignmentDetailScreen> createState() => _LogisticAssignmentDetailScreenState();
}

class _LogisticAssignmentDetailScreenState extends State<LogisticAssignmentDetailScreen> {
  final List<PlantModel> plant = [
    PlantModel(plantName: 'Selada', price: 5000),
    PlantModel(plantName: 'Pakcoy', price: 6000),
    PlantModel(plantName: 'Kangkung', price: 7000),
  ];

  List<PlantQuantityModel> get plantQuantity => [
    PlantQuantityModel(
      plant: plant[0], 
      quantity: 20
    ),
    PlantQuantityModel(
      plant: plant[1], 
      quantity: 30
    ),
    PlantQuantityModel(
      plant: plant[2], 
      quantity: 34
    ),
  ];
  
  DeliveryAssigntmentModel get assignment => DeliveryAssigntmentModel(
    transaction: TransactionModel(
      customerName: 'Muhammad Fulan', 
      plantQuantity: plantQuantity, 
      address: 'Jl. Beringin, Blok. M, No. 77', 
      date: '25 Juni 2025', 
      time: '08:00 AM'
    ), 
    courier: UserModel(
      username: 'username', 
      role: 'role', 
      onNotificationTap: () {},
    )
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
          'Detail Penugasan',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        titleSpacing: 10,
        foregroundColor: Colors.white,
        backgroundColor: AppColors.primary,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: LogisticDeliveryDetailCard(assignment: assignment),
        ),
      )
    );
  }
  
}