import 'package:flutter/material.dart';

class MaintenanceScheduleCard extends StatelessWidget {
  final String taskName;
  final String date;
  final String time;
  final VoidCallback onTap;

  const MaintenanceScheduleCard({
    super.key,
    required this.taskName,
    required this.date,
    required this.time,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        child: ListTile(
          leading: Icon(Icons.calendar_today),
          title: Text(
            taskName,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(time),
              Text(date),
            ],
          ),
        ),
      ),
    );
  }
}