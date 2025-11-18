import 'package:flutter/material.dart';
import 'package:hydroponics_app/theme/app_colors.dart';
import 'package:hydroponics_app/widgets/plant_harvest_card.dart';
import 'package:hydroponics_app/widgets/plant_harvest_history_expansion.dart';
import 'package:hydroponics_app/widgets/styled_elevated_button.dart';

class PlantStatusScreen extends StatefulWidget{
  const PlantStatusScreen({super.key});

  @override
  State<PlantStatusScreen> createState() => _PlantStatusScreenState();
}

class _PlantStatusScreenState extends State<PlantStatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Status Tanaman', style: TextStyle(fontWeight: FontWeight.bold),),
        titleSpacing: 10,
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 1, 68, 33),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Container tombol ekspor
                Container(
                  color: AppColors.primary,
                  width: double.infinity,
                  padding: EdgeInsets.all(15),
                  child: StyledElevatedButton(
                    text: 'Ekspor Data', 
                    onPressed: () {
                      
                    },
                    foregroundColor: AppColors.primary,
                    backgroundColor: Colors.white,
                  ),
                ),
                // Container Tanaman Siap Panen
                Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tanaman Siap Panen:',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 7,),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            PlantHarvestCard(
                              plantName: 'Selada', 
                              plantHarvestQty: 70, 
                              plantTotalQty: 100
                            ),
                            SizedBox(width: 10,),
                            PlantHarvestCard(
                              plantName: 'Pakcoy', 
                              plantHarvestQty: 89, 
                              plantTotalQty: 130
                            ),
                            SizedBox(width: 10,),
                            PlantHarvestCard(
                              plantName: 'Kangkung', 
                              plantHarvestQty: 58, 
                              plantTotalQty: 120
                            ),
                          ],
                        )
                      )
                    ],
                  ),
                ),
                // Container Riwayat Tanam
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 5, bottom: 15, left: 15, right: 15),
                  child: Card(
                    color: AppColors.primary,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Riwayat Tanam',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )
                          ),
                          SizedBox(height: 7,),
                          ListView(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: [
                              PlantHarvestHistoryExpansion(
                                date: '15 Oktober 2025', 
                                seladaPlantQty: 57, 
                                seladaHarvestQty: 28, 
                                pakcoyPlantQty: 83, 
                                pakcoyHarvestQty: 44, 
                                kangkungPlantQty: 94, 
                                kangkungHarvestQty: 67, 
                                screenWidth: constraints.maxWidth
                              ),
                              PlantHarvestHistoryExpansion(
                                date: '16 Oktober 2025', 
                                seladaPlantQty: 57, 
                                seladaHarvestQty: 28, 
                                pakcoyPlantQty: 83, 
                                pakcoyHarvestQty: 44, 
                                kangkungPlantQty: 94, 
                                kangkungHarvestQty: 67, 
                                screenWidth: constraints.maxWidth
                              ),
                              PlantHarvestHistoryExpansion(
                                date: '17 Oktober 2025', 
                                seladaPlantQty: 57, 
                                seladaHarvestQty: 28, 
                                pakcoyPlantQty: 83, 
                                pakcoyHarvestQty: 44, 
                                kangkungPlantQty: 94, 
                                kangkungHarvestQty: 67, 
                                screenWidth: constraints.maxWidth
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }
      ),
    );
  }
}

