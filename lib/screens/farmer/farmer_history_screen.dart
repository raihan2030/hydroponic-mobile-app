import 'package:flutter/material.dart';

class FarmerHistoryScreen extends StatefulWidget {
  const FarmerHistoryScreen({super.key});

  @override
  State<FarmerHistoryScreen> createState() => _FarmerHistoryScreenState();
}

class _FarmerHistoryScreenState extends State<FarmerHistoryScreen> {
  final List<Item> _data = List.generate(
    15, // Buat 8 item
    (int index) => Item(
      id: index,
      headerValue: 'Panel ${index + 1}',
      expandedValue: 'Ini adalah konten detail untuk Panel ${index + 1}',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                // Balik status 'isExpanded' dari item yang diklik
                _data[index].isExpanded = !_data[index].isExpanded;
              });
            },
            children: _data.map<ExpansionPanel>((Item item) {
              return ExpansionPanel(
                // headerBuilder: Tampilan saat panel tertutup (header)
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    title: Text(item.headerValue),
                  );
                },
                // body: Konten yang tampil saat panel terbuka
                body: ListTile(
                  title: Text(item.expandedValue),
                  subtitle:
                      const Text('Tambahkan widget lain di sini jika perlu'),
                  trailing: const Icon(Icons.delete),
                  onTap: () {
                    // Aksi saat konten di-klik
                  },
                ),
                // isExpanded: Status panel (terbuka/tertutup)
                // Ini mengambil data dari state kita
                isExpanded: item.isExpanded,
              );
            }).toList(), // Ubah hasil .map() menjadi List
          ),
      )
      )
        // child: const Center(
        //   child: Text('Riwayat Kosong')
        // ),
      
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