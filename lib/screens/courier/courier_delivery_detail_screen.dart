import 'package:flutter/material.dart';
import 'package:hydroponics_app/models/delivery_assigntment_model.dart';
import 'package:hydroponics_app/models/transaction_model.dart';
import 'package:hydroponics_app/theme/app_colors.dart';
import 'package:hydroponics_app/widgets/delivery_detail_card.dart';

class CourierDeliveryDetailScreen extends StatefulWidget{
  const CourierDeliveryDetailScreen({super.key});

  @override
  State<CourierDeliveryDetailScreen> createState() => _StateCourierDeliveryDetailScreen();
}

class _StateCourierDeliveryDetailScreen extends State<CourierDeliveryDetailScreen> {
  final DeliveryAssigntmentModel assignment = DeliveryAssigntmentModel(
    customerName: 'Muhammad Fulan', 
    address: 'Jl. Beringin, Blok. M, No. 77', 
    date: '25 Juni 2025', 
    time: '08:00 AM', 
    transaction: [
      TransactionModel(
        plantName: 'Selada', 
        quantity: 20
      ),
      TransactionModel(
        plantName: 'Pakcoy', 
        quantity: 30
      ),
    ]
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
          'Detail Pengiriman',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        titleSpacing: 10,
        foregroundColor: Colors.white,
        backgroundColor: AppColors.primary,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: DeliveryDetailCard(assignment: assignment),
        ),
      )
    );
  }
  
}