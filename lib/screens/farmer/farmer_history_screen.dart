import 'package:flutter/material.dart';

class FarmerHistoryScreen extends StatefulWidget {
  const FarmerHistoryScreen({super.key});

  @override
  State<FarmerHistoryScreen> createState() => _FarmerHistoryScreenState();
}

class _FarmerHistoryScreenState extends State<FarmerHistoryScreen> {
  final List<Item> _data = List.generate(6, (int index) => 
    Item(
      id: index,
      headerValue: '0${index + 1} November 2024',
      expandedValue: 'Ini adalah konten detail untuk Panel ${index + 1}',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Riwayat Tanam', style: TextStyle(fontWeight: FontWeight.bold),),
        titleSpacing: 25,
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 1, 68, 33),
      ),
      body: Container(
        padding: EdgeInsets.only(right: 15, left: 15, top: 15),
        child: ListView.builder(
          itemCount: _data.length,
          itemBuilder: (context, index) {
            final item = _data[index];

            // Gunakan Card untuk membungkus
            return Card(
              // 'margin' adalah jarak fisik antar elemen
              margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
              // 'clipBehavior' agar rapi
              clipBehavior: Clip.antiAlias,
              color: const Color.fromARGB(255, 226, 226, 226),
              
              child: ExpansionTile(
                backgroundColor: Color.fromARGB(255, 1, 68, 33),
                textColor: Colors.white,
                iconColor: Colors.white,
                title: Text(item.headerValue, style: TextStyle(fontWeight: FontWeight.bold),),
                children: <Widget>[
                  ListTile(
                    textColor: Colors.white,
                    subtitle: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        border: TableBorder.all(
                          color: Colors.white,
                          style: BorderStyle.solid
                        ),
                        columns: [
                          DataColumn(label: Text('Jenis Tanaman', style: TextStyle(color: Colors.white),)),
                          DataColumn(label: Text('Instalasi', style: TextStyle(color: Colors.white),)),
                          DataColumn(label: Text('Jumlah bibit', style: TextStyle(color: Colors.white),)),
                          DataColumn(label: Text('Siap Panen', style: TextStyle(color: Colors.white),)),
                          DataColumn(label: Text('Menu', style: TextStyle(color: Colors.white),)),
                        ],
                        rows: [
                          DataRow(cells: [
                            DataCell(Text('Selada', style: TextStyle(color: Colors.white),)),
                            DataCell(Text('1', style: TextStyle(color: Colors.white),)),
                            DataCell(Text('44', style: TextStyle(color: Colors.white),)),
                            DataCell(Text('True', style: TextStyle(color: Colors.white),)),
                            DataCell(Row(children: [
                              Icon(Icons.edit, color: Colors.white,),
                              SizedBox(width: 10,),
                              Icon(Icons.delete, color: Colors.white,)
                            ],)),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Seledri', style: TextStyle(color: Colors.white),)),
                            DataCell(Text('2', style: TextStyle(color: Colors.white),)),
                            DataCell(Text('30', style: TextStyle(color: Colors.white),)),
                            DataCell(Text('False', style: TextStyle(color: Colors.white),)),
                            DataCell(Row(children: [
                              Icon(Icons.edit, color: Colors.white,),
                              SizedBox(width: 10,),
                              Icon(Icons.delete, color: Colors.white,)
                            ],)),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Pakcoy', style: TextStyle(color: Colors.white),)),
                            DataCell(Text('3', style: TextStyle(color: Colors.white),)),
                            DataCell(Text('25', style: TextStyle(color: Colors.white),)),
                            DataCell(Text('True', style: TextStyle(color: Colors.white),)),
                            DataCell(Row(children: [
                              Icon(Icons.edit, color: Colors.white,),
                              SizedBox(width: 10,),
                              Icon(Icons.delete, color: Colors.white,)
                            ],)),
                          ]),
                        ],
                      )
                    )
                  ),
                  SizedBox(height: 10)
                ],
              ),
            );
          },
        ),
      )
      
    );
  }
}

class Item {
  Item({
    required this.id,
    required this.headerValue,
    required this.expandedValue,
    this.isExpanded = false,
  });

  int id;
  String headerValue;
  String expandedValue;
  bool isExpanded;
}