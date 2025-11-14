import 'package:flutter/material.dart';
import 'package:hydroponics_app/theme/app_colors.dart';
import 'package:hydroponics_app/widgets/styled_elevated_button.dart';

class SelectRoleScreen extends StatelessWidget{
  const SelectRoleScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pilih Posisi',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        foregroundColor: Colors.white,
        backgroundColor: AppColors.primary,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            spacing: 7,
            children: [
              StyledElevatedButton(
                text: 'Halaman Petani', 
                onPressed: () {
                  Navigator.pushNamed(context, '/farmer_navigation');
                }
              ),
              StyledElevatedButton(
                text: 'Halaman Kurir', 
                onPressed: () {
                  Navigator.pushNamed(context, '/courier_navigation');
                }
              ),
              StyledElevatedButton(
                text: 'Halaman Staf Logistik', 
                onPressed: () {

                }
              ),
              StyledElevatedButton(
                text: 'Halaman Admin', 
                onPressed: () {

                }
              ),
            ],
          ),
        ),
      ),
    );
  }

  
}