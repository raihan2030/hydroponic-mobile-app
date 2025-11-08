import 'package:flutter/material.dart';

class FarmerPlantCard extends StatelessWidget {
  final String plantName;
  final int plantCount;
  final IconData? plantIcon;

  const FarmerPlantCard({
    super.key,
    required this.plantName,
    required this.plantCount,
    this.plantIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      child: Container(
        alignment: Alignment.topLeft,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),  
        ),
        child: Padding(padding: const EdgeInsets.all(15.0),
          child: 
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(plantName, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 13),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text('$plantCount', style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                      SizedBox(width: 5),
                      const Text('bibit'),
                    ],
                  ),
                ],
              ),
              Icon(plantIcon ?? Icons.grass, size: 35, color: Color.fromARGB(255, 1, 68, 33)),
            ],
          ),
        ),
      ),
    );
  }
}