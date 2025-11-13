import 'package:flutter/material.dart';
import 'package:hydroponics_app/theme/app_colors.dart';

class NotificationScreen extends StatelessWidget{
  const NotificationScreen({super.key});
  
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
          'Notifikasi',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        titleSpacing: 10,
        foregroundColor: Colors.white,
        backgroundColor: AppColors.primary,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            _notificationItems('Penambahan Nutrisi', '25 Juni 2024', '08:00 AM'),
            _notificationItems('Penggantian Air', '26 Juni 2024', '10:00 AM'),
            _notificationItems('Pemeriksaan pH', '27 Juni 2024', '10:00 AM')
          ],
        ),
      ),
    );
  }

  Widget _notificationItems(
    String title,
    String date,
    String time
  ){
    return Card(
      color: Color.fromARGB(255, 236, 236, 236),
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 10),
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
              Icon(
                Icons.circle, 
                size: 10, 
                color: AppColors.primary,
              )
            ],
          ),
          subtitle: Padding(
            padding: EdgeInsetsGeometry.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(date),
                Text(time),
              ],
            ),
          )
        ),
      )
    );
  }
}