import 'package:flutter/material.dart';
import 'package:hydroponics_app/widgets/styled_elevated_button.dart';

class FarmerHarvestScreen extends StatelessWidget {
  const FarmerHarvestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Tugas Panen', style: TextStyle(fontWeight: FontWeight.bold),),
        titleSpacing: 25,
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 1, 68, 33),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 15, right: 20, left: 20),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 0.0),
              color: const Color.fromARGB(255, 1, 68, 33),
              
              child: Padding(padding: EdgeInsetsGeometry.only(top: 10, bottom: 10),
                child: 
                  ListTile(
                    textColor: Colors.white,
                    title: Text('Nama Pelanggan', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    subtitle: Column(
                      spacing: 15,
                      children: [
                        SizedBox(height: 7,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Selada', style: TextStyle(fontSize: 18),),
                            Text('20 pcs', style: TextStyle(fontSize: 18),)
                          ],
                        ),
                        Text('Jl. Martapura Lama, Komplek Putra Gemilang Raya', 
                          style: TextStyle(fontSize: 16), 
                          textAlign: TextAlign.justify,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('2 November 2024', style: TextStyle(fontSize: 16),),
                            Text('08:00 AM', style: TextStyle(fontSize: 16),)
                          ],
                        ),
                        StyledElevatedButton(
                          text: 'Sudah di panen', 
                          foregroundColor: Color.fromARGB(255, 1, 68, 33),
                          onPressed: () {
                            // actions
                          }
                        )
                      ],
                    )
                  ),
              ),
              
            );
          },
        ),
      ),
    );
  }
}