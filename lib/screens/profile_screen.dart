import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Profil', style: TextStyle(fontWeight: FontWeight.bold),),
        titleSpacing: 25,
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 1, 68, 33),
        automaticallyImplyLeading: false,
      ),
      body: 
      SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            children: [
              Center(
                heightFactor: 1.5,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Icon(Icons.account_circle, 
                          size: 150,
                          color: Color.fromARGB(255, 1, 68, 33),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: BoxBorder.all(
                                color: Color.fromARGB(255, 1, 68, 33),
                                width: 2
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            child: IconButton(
                              onPressed: () {
                                // actions
                              }, 
                              icon: Icon(Icons.edit, color: Color.fromARGB(255, 1, 68, 33),),
                              iconSize: 21,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Username',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    Text('Role'),
                  ],
                )
              ),
              ListTile(
                leading: Icon(Icons.settings, size: 25,),
                title: Text('Pengaturan'),
                onTap: () {
                  // actions
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.headset_mic, size: 25,),
                title: Text('Bantuan & dukungan'),
                onTap: () {
                  // actions
                },
              ),
              Divider(),
              ListTile(
                textColor: Colors.red,
                iconColor: Colors.red,
                leading: Icon(Icons.logout, size: 25,),
                title: Text('Keluar'),
                onTap: () {
                  Navigator.pushNamed(context, '/select_role');
                },
              ),
              Divider()
            ]
          ),
        ),
      ),
    );
  }
}