import 'package:flutter/material.dart';
import 'package:hydroponics_app/widgets/styled_elevated_button.dart';

class FarmerHistoryScreen extends StatefulWidget {
  const FarmerHistoryScreen({super.key});

  @override
  State<FarmerHistoryScreen> createState() => _FarmerHistoryScreenState();
}

class _FarmerHistoryScreenState extends State<FarmerHistoryScreen> {
  // final List<Item> _data = List.generate(6, (int index) => 
  //   Item(
  //     id: index,
  //     headerValue: '0${index + 1} November 2024',
  //     expandedValue: 'Ini adalah konten detail untuk Panel ${index + 1}',
  //   ),
  // );

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
        child: ListView(
          children: [
            FarmerHistoryList(
              date: '01 November 2025', 
              plantQty: 44, 
              harvestQty: 33, 
              onPlantEdit: () {}, 
              onPlantDelete: () {}, 
              onHarvestEdit: () {}, 
              onHarvestDelete: () {}, 
              onDeleteAll: () {},
            ),
            FarmerHistoryList(
              date: '02 November 2025', 
              plantQty: 45, 
              harvestQty: 28, 
              onPlantEdit: () {}, 
              onPlantDelete: () {}, 
              onHarvestEdit: () {}, 
              onHarvestDelete: () {},
              onDeleteAll: () {},
            ),
            FarmerHistoryList(
              date: '03 November 2025', 
              plantQty: 18, 
              harvestQty: 45, 
              onPlantEdit: () {}, 
              onPlantDelete: () {}, 
              onHarvestEdit: () {}, 
              onHarvestDelete: () {},
              onDeleteAll: () {},
            ),
          ]
        ),
      )
    );
  }
}

class FarmerHistoryList extends StatelessWidget {
  final String date;
  final int plantQty;
  final int harvestQty;
  final VoidCallback onPlantEdit;
  final VoidCallback onPlantDelete;
  final VoidCallback onHarvestEdit;
  final VoidCallback onHarvestDelete;
  final VoidCallback onDeleteAll;

  const FarmerHistoryList({
    super.key, 
    required this.date, 
    required this.plantQty, 
    required this.harvestQty, 
    required this.onPlantEdit, 
    required this.onPlantDelete, 
    required this.onHarvestEdit, 
    required this.onHarvestDelete,
    required this.onDeleteAll
  });
  
  @override
  Widget build(BuildContext context) {
    return Card(
        // 'margin' adalah jarak fisik antar elemen
        margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
        // 'clipBehavior' agar rapi
        clipBehavior: Clip.antiAlias,
        color: const Color.fromARGB(255, 226, 226, 226),
        
        child: ExpansionTile(
          initiallyExpanded: false, // true berarti expand duluan
          backgroundColor: Color.fromARGB(255, 1, 68, 33),
          childrenPadding: EdgeInsets.only(bottom: 15, right: 15, left: 15),
          textColor: Colors.white,
          iconColor: Colors.white,
          title: Text(date, style: TextStyle(fontWeight: FontWeight.bold),),
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                border: TableBorder.all(color: Colors.transparent),
                headingTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),
                dataTextStyle: TextStyle(color: Colors.white),
                columns: [
                  DataColumn(label: Text('Informasi')),
                  DataColumn(label: Text('Jumlah')),
                  DataColumn(label: Text('Menu')),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('Bibit yang ditanam')),
                    DataCell(Text('$plantQty')),
                    DataCell(Row(children: [
                      IconButton(
                        onPressed: onPlantEdit, 
                        icon: Icon(Icons.edit, color: Colors.white,)
                      ),
                      SizedBox(width: 10,),
                      IconButton(
                        onPressed: onPlantDelete, 
                        icon: Icon(Icons.delete, color: Colors.white,)
                      ),
                    ],)),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Tanaman yang dipanen')),
                    DataCell(Text('$harvestQty')),
                    DataCell(Row(children: [
                      IconButton(
                        onPressed: onHarvestEdit, 
                        icon: Icon(Icons.edit, color: Colors.white,)
                      ),
                      SizedBox(width: 10,),
                      IconButton(
                        onPressed: onHarvestDelete, 
                        icon: Icon(Icons.delete, color: Colors.white,)
                      ),
                    ],)),
                  ]),
                ],
              )
            ),
            SizedBox(height: 15,),
            StyledElevatedButton(
              text: 'Hapus Data', 
              onPressed: () {},
              foregroundColor: Colors.white,
              backgroundColor: Colors.red[700],
            ),
          ],
        ),
      );
  }}