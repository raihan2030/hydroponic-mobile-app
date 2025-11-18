import 'package:flutter/material.dart';
import 'package:hydroponics_app/models/user_model.dart';
import 'package:hydroponics_app/theme/app_colors.dart';
import 'package:hydroponics_app/widgets/home_app_bar.dart';
import 'package:hydroponics_app/widgets/trailing_icon_button.dart';

class AdminHomeScreen extends StatefulWidget{
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: HomeAppBar(
          user: UserModel(
            username: 'Muhammad Rizky Ramadhan', 
            role: 'Admin',
            onNotificationTap: () {
              Navigator.pushNamed(context, '/notification');
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            spacing: 15,
            children: [
              TrailingIconButton(
                text: 'Tambah Transaksi', 
                trailingIcon: Icons.add_shopping_cart,
                onPressed: () {
                  Navigator.pushNamed(context, '/add_edit_transaction');
                },
                foregroundColor: Colors.white,
                backgroundColor: AppColors.primary,
              ),
              TrailingIconButton(
                text: 'Tambah Akun', 
                trailingIcon: Icons.person_add,
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                foregroundColor: Colors.white,
                backgroundColor: AppColors.primary,
              ),
              TrailingIconButton(
                text: 'Daftar Akun Karyawan', 
                trailingIcon: Icons.people,
                onPressed: () {
                  Navigator.pushNamed(context, '/employee_account_list');
                },
                foregroundColor: Colors.white,
                backgroundColor: AppColors.primary,
              ),
            ],
          ),
        ),
      )
    );
  }
}