import 'package:flutter/material.dart';
import 'package:hydroponics_app/models/delivery_assigntment_model.dart';
import 'package:hydroponics_app/models/transaction_model.dart';
import 'package:hydroponics_app/models/user_model.dart';
import 'package:hydroponics_app/widgets/delivery_assignment_card.dart';
import 'package:hydroponics_app/widgets/home_app_bar.dart';

class LogisticHomeScreen extends StatefulWidget {
  const LogisticHomeScreen({super.key});

  @override
  State<LogisticHomeScreen> createState() => _LogisticHomeScreenState();
}

class _LogisticHomeScreenState extends State<LogisticHomeScreen> {
  final List<DeliveryAssigntmentModel> _assigntmentData = List<DeliveryAssigntmentModel>.generate(5, (int index) =>
    DeliveryAssigntmentModel(
      transaction: TransactionModel(
        customerName: 'Ahmad Sobri', 
        plantQuantity: [], 
        address: 'Jl. Beringin, No. 137', 
        date: '15 Oktober 2025', 
        time: '10:00 AM'
      ), 
      courier: UserModel(username: 'username', role: 'role', onNotificationTap: () {}))
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: HomeAppBar(
          user: UserModel(
            username: 'Muhammad Aufa Fitrianda', 
            role: 'Staf Logistik',
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
                'Daftar Penugasan',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 25,),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _assigntmentData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return DeliveryAssignmentCard(
                      assignment: _assigntmentData[index], 
                      onTap: () {
                        Navigator.pushNamed(context, '/logistic_assignment_detail');
                      },
                    );
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