import 'package:flutter/material.dart';
import 'package:hydroponics_app/models/plant_maintenance_model.dart';

class MaintenanceScheduleCard extends StatelessWidget {
  final PlantMaintenanceModel maintenance;

  const MaintenanceScheduleCard({
    super.key,
    required this.maintenance
  });

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      color: Colors.white,
      child: InkWell(
        onTap: maintenance.onTap,
        child: ListTile(
          leading: Icon(Icons.calendar_today),
          title: Text(
            maintenance.maintenanceName,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(maintenance.date),
              Text(maintenance.time),
            ],
          ),
        ),
      ),
    );
  }
}