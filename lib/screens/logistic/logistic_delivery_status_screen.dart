import 'package:flutter/material.dart';
import 'package:hydroponics_app/models/delivery_assigntment_model.dart';
import 'package:hydroponics_app/models/plant_model.dart';
import 'package:hydroponics_app/models/plant_quantity_model.dart';
import 'package:hydroponics_app/models/transaction_model.dart';
import 'package:hydroponics_app/models/user_model.dart';
import 'package:hydroponics_app/widgets/logistic_delivery_status_card.dart';

class LogisticDeliveryStatusScreen extends StatefulWidget {
  const LogisticDeliveryStatusScreen({super.key});

  @override
  State<LogisticDeliveryStatusScreen> createState() => _LogisticDeliveryStatusScreenState();
}

class _LogisticDeliveryStatusScreenState extends State<LogisticDeliveryStatusScreen> {
  final List<PlantModel> plant = [
    PlantModel(plantName: 'Selada', price: 5000),
    PlantModel(plantName: 'Pakcoy', price: 6000),
    PlantModel(plantName: 'Kangkung', price: 7000),
  ];

  List<DeliveryAssigntmentModel> get _assigntmentData => List<DeliveryAssigntmentModel>.generate(5, (int index) =>
    DeliveryAssigntmentModel(
      transaction: TransactionModel(
        customerName: 'Ahmad Sobri', 
        plantQuantity: [
          PlantQuantityModel(plant: plant[0], quantity: 53 + index),
          PlantQuantityModel(plant: plant[1], quantity: 74 + index),
          PlantQuantityModel(plant: plant[2], quantity: 35 + index),
        ], 
        address: 'Jl. Beringin, No. 137', 
        date: '15 Oktober 2025', 
        time: '10:00 AM'
      ), 
      courier: UserModel(username: 'username', role: 'role', onNotificationTap: () {}),
      isDone: (index < 2) ? true : false
    ),
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
        child: ListView.separated(
          itemCount: 5,
          itemBuilder: (context, index) {
            return LogisticDeliveryStatusCard(assignment: _assigntmentData[index]);
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 10,);
          },
        ),
      ),
    );
  }
}