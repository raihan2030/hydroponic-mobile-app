import 'package:flutter/material.dart';
import 'package:hydroponics_app/models/delivery_assigntment_model.dart';
import 'package:hydroponics_app/models/user_model.dart';
import 'package:hydroponics_app/theme/app_colors.dart';
import 'package:hydroponics_app/widgets/styled_dropdown_button_form_field.dart';
import 'package:hydroponics_app/widgets/styled_elevated_button.dart';

class LogisticDeliveryDetailCard extends StatefulWidget{
  final DeliveryAssigntmentModel assignment;

  const LogisticDeliveryDetailCard({
    super.key, 
    required this.assignment
  });
  
  @override
  State<LogisticDeliveryDetailCard> createState() => _LogisticDeliveryDetailCardState();
}

class _LogisticDeliveryDetailCardState extends State<LogisticDeliveryDetailCard> {
  String? _selectedCourier;
  final List<UserModel> _couriers = [
    UserModel(
      username: 'Taufik', 
      role: 'Kurir', 
      onNotificationTap: () {}
    ),
    UserModel(
      username: 'Dayat', 
      role: 'Kurir', 
      onNotificationTap: () {}
    ),
    UserModel(
      username: 'Syarif', 
      role: 'Kurir', 
      onNotificationTap: () {}
    ),
    UserModel(
      username: 'Opik', 
      role: 'Kurir', 
      onNotificationTap: () {}
    ),
  ];
  
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
            widget.assignment.transaction.customerName,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          subtitle: Column(children: [
            Divider(),
            SizedBox(height: 25,),
            
            Column(
              children: widget.assignment.transaction.plantQuantity.map((transaction) {
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
                Text(widget.assignment.transaction.date),
                Text(widget.assignment.transaction.time),
              ],
            ),
            SizedBox(height: 20,),

            Text(widget.assignment.transaction.address, textAlign: TextAlign.justify,),
            SizedBox(height: 20,),

            Column(
              children: [
                StyledDropdownButtonFormField(
                  hintText: 'Pilih Kurir', 
                  prefixIcon: Icons.people,
                  value: _selectedCourier, 
                  items: _couriers.map((UserModel courier) {
                    return DropdownMenuItem<String>(
                      value: courier.username,
                      child: Text(courier.username),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedCourier = newValue;
                    });
                  },
                ),
                SizedBox(height: 20,),
                StyledElevatedButton(
                  text: 'Tugaskan Pengiriman ',
                  icon: Icons.assignment_add,
                  onPressed: () {},
                  foregroundColor: AppColors.primary,
                  backgroundColor: Colors.white,
                ),
                StyledElevatedButton(
                  text: 'Lihat Bukti ',
                  icon: Icons.camera_alt,
                  onPressed: () {},
                  foregroundColor: Colors.white,
                  backgroundColor: AppColors.primary,
                  borderWidth: 2,
                  borderColor: Colors.white54,
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}