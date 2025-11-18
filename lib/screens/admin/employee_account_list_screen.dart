import 'package:flutter/material.dart';
import 'package:hydroponics_app/models/user_model.dart';
import 'package:hydroponics_app/theme/app_colors.dart';
import 'package:hydroponics_app/widgets/employee_list_card.dart';
import 'package:hydroponics_app/widgets/styled_elevated_button.dart';

class EmployeeAccountListScreen extends StatefulWidget{
  const EmployeeAccountListScreen({super.key});

  @override
  State<EmployeeAccountListScreen> createState() => _EmployeeAccountListScreenState();
}

class _EmployeeAccountListScreenState extends State<EmployeeAccountListScreen> {
  final List<UserModel> _farmerData = List<UserModel>.generate(3, (int index) =>
    UserModel(
      username: 'User Petani ${index + 1}', 
      role: 'Petani', 
      onNotificationTap: () {}
    ),
  );
  final List<UserModel> _courierData = List<UserModel>.generate(3, (int index) =>
    UserModel(
      username: 'User Kurir ${index + 1}', 
      role: 'Kurir', 
      onNotificationTap: () {}
    ),
  );
  final List<UserModel> _logisticStaffData = List<UserModel>.generate(3, (int index) =>
    UserModel(
      username: 'User Staf Logistik ${index + 1}', 
      role: 'Staf Logistik', 
      onNotificationTap: () {}
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Daftar Akun Karyawan', style: TextStyle(fontWeight: FontWeight.bold),),
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
      body: Column(
        children: [
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
          Expanded(child: 
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  spacing: 7,
                  children: [
                    EmployeeListCard(
                      role: 'Petani', 
                      userData: _farmerData
                    ),
                    EmployeeListCard(
                      role: 'Kurir', 
                      userData: _courierData
                    ),
                    EmployeeListCard(
                      role: 'Staf Logistik', 
                      userData: _logisticStaffData
                    ),
                    
                  ],
                ),
              ),
            )
          ),
        ],
      ),
    );
  }

}