import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StyledDatePickerField extends StatefulWidget {
  const StyledDatePickerField({super.key});

  @override
  State<StyledDatePickerField> createState() => _StyledDatePickerFieldState();
}

class _StyledDatePickerFieldState extends State<StyledDatePickerField> {
  // Controller untuk mengelola teks di dalam TextFormField
  final TextEditingController _dateController = TextEditingController();

  // Fungsi untuk menampilkan date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Tanggal awal yang dipilih
      firstDate: DateTime(2000),   // Tanggal paling awal yang bisa dipilih
      lastDate: DateTime(2101),    // Tanggal paling akhir yang bisa dipilih
    );

    if (picked != null) {
      // Jika pengguna memilih tanggal
      setState(() {
        // Format tanggal menggunakan package intl
        String formattedDate = DateFormat('dd-MM-yyyy').format(picked);
        _dateController.text = formattedDate; // Set teks di controller
      });
    }
  }

  @override
  void dispose() {
    _dateController.dispose(); // Selalu dispose controller!
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return 
      TextFormField(
        controller: _dateController, // 1. Gunakan controller
        readOnly: true,              // 2. Buat read-only
        onTap: () {
          _selectDate(context);      // 3. Panggil date picker saat di-tap
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            // Ubah pesan validasi agar sesuai
            return 'Silakan pilih tanggal';
          }
          return null;
        },
        // 4. DEKORASI ANDA (dicopy-paste, hanya ubah hintText)
        decoration: InputDecoration(
          hintText: 'Pilih tanggal', // Ubah hint text
          filled: true,
          fillColor: Color.fromARGB(255, 236, 236, 236),
          // Tambahkan icon agar lebih jelas
          suffixIcon: Icon(Icons.calendar_today_outlined),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(style: BorderStyle.none),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
        ),
      );
  }
}