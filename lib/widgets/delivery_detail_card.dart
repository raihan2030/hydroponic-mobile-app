import 'package:flutter/material.dart';
import 'package:hydroponics_app/models/delivery_assigntment_model.dart';
import 'package:hydroponics_app/theme/app_colors.dart';

class DeliveryDetailCard extends StatelessWidget{
  final DeliveryAssigntmentModel assignment;

  const DeliveryDetailCard({
    super.key, 
    required this.assignment
  });
  
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 0.0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: ListTile(
          textColor: Colors.white,
          title: Text(
            assignment.transaction.customerName,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          subtitle: Column(children: [
            Divider(),
            SizedBox(height: 25,),
            
            Column(
              children: assignment.transaction.plantQuantity.map((transaction) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(transaction.plant.plantName),
                    Text('${transaction.quantity} pcs'),
                  ],
                );
              }).toList(),
            ),
            SizedBox(height: 25,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(assignment.transaction.date),
                Text(assignment.transaction.time),
              ],
            ),
            SizedBox(height: 20,),

            Text(assignment.transaction.address, textAlign: TextAlign.justify,),
            SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    // actions
                  }, 
                  icon: Icon(Icons.camera_enhance, color: Colors.white,)
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    foregroundColor: AppColors.primary,
                    backgroundColor: Colors.white
                  ), 
                  child: Text('Tandai Selesai', style: TextStyle(fontWeight: FontWeight.bold),),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}