import 'package:flutter/material.dart';
import 'package:hydroponics_app/models/delivery_assigntment_model.dart';
import 'package:hydroponics_app/models/transaction_model.dart';
import 'package:hydroponics_app/models/user_model.dart';
import 'package:hydroponics_app/widgets/delivery_assignment_card.dart';
import 'package:hydroponics_app/widgets/home_app_bar.dart';

class CourierHomeScreen extends StatefulWidget{
  const CourierHomeScreen({super.key});
  
  @override
  State<CourierHomeScreen> createState() => _CourierHomeScreenState();
}

class _CourierHomeScreenState extends State<CourierHomeScreen> {
  final List<DeliveryAssigntmentModel> _data = List<DeliveryAssigntmentModel>.generate(5, 
    (index) => 
    DeliveryAssigntmentModel(
      transaction: TransactionModel(
        customerName: 'Muhammad Fulan', 
        plantQuantity: [], 
        address: 'Jl. Sungai Lulut', 
        date: '0${index + 1} Juni 2025', 
        time: '1${index + 1}:00 AM'
      ), 
      courier: UserModel(
        username: 'Naufal Elyzar', 
        role: 'Kurir', 
        onNotificationTap: () {}
      )
    )
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: HomeAppBar(
          user: UserModel(
            username: 'Naufal Elyzar', 
            role: 'Kurir',
            onNotificationTap: () {
              Navigator.pushNamed(context, '/notification');
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
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
              // Expanded(child: 
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return DeliveryAssignmentCard(assignment: _data[index]);
                  }, 
                  separatorBuilder: (BuildContext context, int index) { 
                    return SizedBox(height: 7,);
                  },
                ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}