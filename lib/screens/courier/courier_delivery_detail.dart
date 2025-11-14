import 'package:flutter/material.dart';
import 'package:hydroponics_app/theme/app_colors.dart';

class CourierDeliveryDetail extends StatefulWidget{
  const CourierDeliveryDetail({super.key});

  @override
  State<CourierDeliveryDetail> createState() => _StateCourierDeliveryDetail();
}

class _StateCourierDeliveryDetail extends State<CourierDeliveryDetail> {
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
          'Detail Pengiriman',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        titleSpacing: 10,
        foregroundColor: Colors.white,
        backgroundColor: AppColors.primary,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Card(
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
                  'Muhammad Fulan',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                subtitle: Column(children: [
                  Divider(),
                  SizedBox(height: 25,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Selada'),
                      Text('20 pcs')
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Pakcoy'),
                      Text('30 pcs')
                    ],
                  ),
                  SizedBox(height: 25,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('25 Juni 2024'),
                      Text('08:00 AM'),
                    ],
                  ),
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
          ),
        ),
      )
    );
  }
  
}