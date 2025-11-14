import 'package:flutter/material.dart';
import 'package:hydroponics_app/theme/app_colors.dart';
import 'package:hydroponics_app/widgets/home_app_bar.dart';

class CourierHomeScreen extends StatefulWidget{
  const CourierHomeScreen({super.key});
  
  @override
  State<CourierHomeScreen> createState() => _CourierHomeScreenState();
}

class _CourierHomeScreenState extends State<CourierHomeScreen> {
  final List<DeliveryTaskField> _data = List<DeliveryTaskField>.generate(5, 
    (index) => DeliveryTaskField(
      customerName: 'Muhammad Fulan', 
      address: 'Jl. Sungai Lulut', 
      date: '0${index + 1} Juni 2025', 
      time: '1${index + 1}:00 AM'
      )
    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: HomeAppBar(
          username: 'Naufal Elyzar', 
          role: 'Kurir', 
          onNotificationTap: () {
            Navigator.pushNamed(context, '/notification');
          },
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Daftar Pengiriman',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 25,),
            Expanded(child: 
              ListView.separated(
                itemCount: _data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: AppColors.primary,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/courier_delivery_detail');
                      },
                      child: Padding(
                        padding: EdgeInsetsGeometry.symmetric(vertical: 15, horizontal: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(_data[index].customerName, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                                Text(_data[index].date, style: TextStyle(color: Colors.white),)
                              ],
                            ),
                            SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(_data[index].address, style: TextStyle(color: Colors.white),),
                                Text(_data[index].time, style: TextStyle(color: Colors.white),)
                              ],
                            ),
                          ],
                        ),
                      ),
                    )                     
                  );
                }, 
                separatorBuilder: (BuildContext context, int index) { 
                  return SizedBox(height: 10,);
                },
              ),
            )            
          ],
        ),
      ),
    );
  }
}

class DeliveryTaskField {
  final String customerName;
  final String address;
  final String date;
  final String time;
  
  const DeliveryTaskField({
    required this.customerName, 
    required this.address, 
    required this.date, 
    required this.time
  });
}