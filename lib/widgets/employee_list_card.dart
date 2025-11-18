import 'package:flutter/material.dart';
import 'package:hydroponics_app/models/user_model.dart';
import 'package:hydroponics_app/theme/app_colors.dart';

class EmployeeListCard extends StatelessWidget{
  final String role;
  final List<UserModel> userData;

  const EmployeeListCard({
    super.key, 
    required this.role, 
    required this.userData}
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5)
      ),
      child: Container(
        width: double.infinity,
        padding: EdgeInsetsGeometry.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              role,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            Divider(),
            Column(
              children: userData.map((user) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      user.username,
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            
                          }, 
                          icon: Icon(Icons.edit, color: Colors.white,)
                        ),
                        IconButton(
                          onPressed: () {
                            
                          }, 
                          icon: Icon(Icons.delete, color: Colors.white,)
                        )
                      ],
                    )
                  ],
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}