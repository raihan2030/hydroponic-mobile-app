import 'package:flutter/material.dart';

class MaintenanceScheduleCard extends StatelessWidget {
  final String taskName;
  final String installation;
  final String dateTime;

  const MaintenanceScheduleCard({
    super.key,
    required this.taskName,
    required this.installation,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          // Navigator.pushNamed(context, '/farmer_schedule_detail');
        },
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
              Text(installation),
              Text(dateTime),
            ],
          ),
        ),
      ),
    );
  }
}