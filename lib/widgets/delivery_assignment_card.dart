import 'package:flutter/material.dart';
import 'package:hydroponics_app/models/delivery_assigntment_model.dart';
import 'package:hydroponics_app/theme/app_colors.dart';

class DeliveryAssignmentCard extends StatelessWidget{
  final DeliveryAssigntmentModel assignment;

  const DeliveryAssignmentCard({
    super.key, 
    required this.assignment
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.primary,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/courier_delivery_detail');
        },
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(assignment.transaction.customerName, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                  Text(assignment.transaction.customerName, style: TextStyle(color: Colors.white),)
                ],
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(assignment.transaction.address, style: TextStyle(color: Colors.white),),
                  Text(assignment.transaction.time, style: TextStyle(color: Colors.white),)
                ],
              ),
            ],
          ),
        ),
      )                     
    );
  }
}