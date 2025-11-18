import 'package:flutter/material.dart';
import 'package:hydroponics_app/theme/app_colors.dart';
import 'package:hydroponics_app/widgets/no_leading_text_form_field.dart';
import 'package:hydroponics_app/widgets/styled_date_picker_field.dart';
import 'package:hydroponics_app/widgets/styled_dropdown_button_form_field.dart';
import 'package:hydroponics_app/widgets/styled_elevated_button.dart';

class AddEditTransactionScreen extends StatefulWidget{
  const AddEditTransactionScreen({super.key});

  @override
  State<AddEditTransactionScreen> createState() => _AddEditTransactionScreenState();
}

class _AddEditTransactionScreenState extends State<AddEditTransactionScreen> {
  bool isSeladaChecked = false;
  bool isPakcoyChecked = false;
  bool isKangkungChecked = false;

  // Controller untuk setiap text field
  late TextEditingController _seladaController;
  late TextEditingController _pakcoyController;
  late TextEditingController _kangkungController;

  @override
  void initState() {
    super.initState();
    // Inisialisasi controller
    _seladaController = TextEditingController();
    _pakcoyController = TextEditingController();
    _kangkungController = TextEditingController();
  }

  @override
  void dispose() {
    // WAJIB: Hapus controller saat widget tidak dipakai
    // untuk menghindari memory leaks
    _seladaController.dispose();
    _pakcoyController.dispose();
    _kangkungController.dispose();
    super.dispose();
  }

  String? _selectedPaymentStatus;
  final List<String> _paymentStatuses = [
    'Lunas',
    'Belum Lunas',
  ];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Tambah Transaksi', style: TextStyle(fontWeight: FontWeight.bold),),
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsetsGeometry.all(15),
          child: Form(
            key: _formKey,
            child: Card(
              color: AppColors.primary,
              child: Container(
                width: double.infinity,
                padding: EdgeInsetsGeometry.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsGeometry.only(bottom: 7),
                      child: Text('Nama Pembeli:', style: TextStyle(color: Colors.white, fontSize: 18),),
                    ),
                    NoLeadingTextFormField(
                      hintText: 'Masukkan nama pembeli', 
                      inputType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Silakan masukkan nama pembeli';
                        }
                        return null;
                      },
                    ),

                    Padding(
                      padding: EdgeInsetsGeometry.only(top: 15, bottom: 7),
                      child: Text('Alamat Pembeli:', style: TextStyle(color: Colors.white, fontSize: 18),),
                    ),
                    NoLeadingTextFormField(
                      hintText: 'Masukkan alamat pembeli', 
                      inputType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Silakan masukkan alamat pembeli';
                        }
                        return null;
                      },
                    ),

                    Padding(
                      padding: EdgeInsetsGeometry.only(top: 15, bottom: 7),
                      child: Text('Tanggal Tanam:', style: TextStyle(color: Colors.white, fontSize: 18),),
                    ),
                    StyledDatePickerField(),

                    Padding(
                      padding: EdgeInsetsGeometry.only(top: 15, bottom: 7),
                      child: Text('Jenis & Jumlah Sayur:', style: TextStyle(color: Colors.white, fontSize: 18),),
                    ),
                    Card(
                      color: Color.fromARGB(255, 236, 236, 236),
                      child: Padding(
                        padding: EdgeInsetsGeometry.all(15),
                        child: Column(
                          children: [
                            // --- Baris untuk SELADA ---
                            Row(
                              children: [
                                // 1. Checkbox
                                Checkbox(
                                  value: isSeladaChecked,
                                  activeColor: AppColors.primary,
                                  onChanged: (bool? newValue) {
                                    setState(() {
                                      isSeladaChecked = newValue!;
                                    });
                                  },
                                ),
                                
                                // 2. Label
                                Text('Selada', style: TextStyle(fontSize: 16)),
                                
                                // 3. Spacer
                                // Ini akan mendorong TextField ke paling kanan
                                Expanded(child: Container()), 
                                
                                // 4. TextField Kuantitas
                                SizedBox(
                                  width: 80,
                                  height: 40,
                                  child: TextField(
                                    controller: _seladaController,
                                    // Kunci Logika: TextField hanya aktif jika di-centang
                                    enabled: isSeladaChecked, 
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      hintText: 'Qty',
                                      filled: true,
                                      // Ganti warna jika non-aktif
                                      fillColor: isSeladaChecked ? Colors.white : Colors.grey[300],
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide.none,
                                      ),
                                      contentPadding: EdgeInsets.zero,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            // --- Baris untuk PAKCOY ---
                            Row(
                              children: [
                                Checkbox(
                                  value: isPakcoyChecked,
                                  activeColor: AppColors.primary,
                                  onChanged: (bool? newValue) {
                                    setState(() {
                                      isPakcoyChecked = newValue!;
                                    });
                                  },
                                ),
                                Text('Pakcoy', style: TextStyle(fontSize: 16)),
                                Expanded(child: Container()), 
                                SizedBox(
                                  width: 80,
                                  height: 40,
                                  child: TextField(
                                    controller: _pakcoyController,
                                    enabled: isPakcoyChecked, // Logic
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      hintText: 'Qty',
                                      filled: true,
                                      fillColor: isPakcoyChecked ? Colors.white : Colors.grey[300],
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide.none,
                                      ),
                                      contentPadding: EdgeInsets.zero,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            // --- Baris untuk KANGKUNG ---
                            Row(
                              children: [
                                Checkbox(
                                  value: isKangkungChecked,
                                  activeColor: AppColors.primary,
                                  onChanged: (bool? newValue) {
                                    setState(() {
                                      isKangkungChecked = newValue!;
                                    });
                                  },
                                ),
                                Text('Kangkung', style: TextStyle(fontSize: 16)),
                                Expanded(child: Container()), 
                                SizedBox(
                                  width: 80,
                                  height: 40,
                                  child: TextField(
                                    controller: _kangkungController,
                                    enabled: isKangkungChecked, // Logic
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      hintText: 'Qty',
                                      filled: true,
                                      fillColor: isKangkungChecked ? Colors.white : Colors.grey[300],
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide.none,
                                      ),
                                      contentPadding: EdgeInsets.zero,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsetsGeometry.only(top: 15, bottom: 7),
                      child: Text('Jenis & Jumlah Sayur:', style: TextStyle(color: Colors.white, fontSize: 18),),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Card(
                        color: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1.0,
                            color: Colors.grey
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsGeometry.all(10),
                          child: Text('Rp ${0}', style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsetsGeometry.only(top: 15, bottom: 7),
                      child: Text('Status Pembayaran:', style: TextStyle(color: Colors.white, fontSize: 18),),
                    ),
                    StyledDropdownButtonFormField(
                      hintText: 'Pilih Status Pembayaran', 
                      prefixIcon: Icons.payment,
                      value: _selectedPaymentStatus,
                      items: _paymentStatuses.map((String status) {
                        return DropdownMenuItem<String>(
                          value: status,
                          child: Text(status),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                          setState(() {
                            _selectedPaymentStatus = newValue;
                          });
                        },
                        validator: (value) {
                          if (value == null) {
                            return 'Silakan pilih status pembayaran';
                          }
                          return null;
                        },
                    ),

                    SizedBox(height: 20,),
                    StyledElevatedButton(
                      text: 'Tambah Transaksi', 
                      onPressed: () {
                        // 1. Validasi field yang MUDAH (Nama, Alamat, Status)
                        bool isFormValid = _formKey.currentState?.validate() ?? false;
                        
                        // 2. Validasi field yang KOMPLEKS (Logika Sayur)
                        bool isSeladaValid = !isSeladaChecked || (isSeladaChecked && _seladaController.text.isNotEmpty && _seladaController.text != '0');
                        bool isPakcoyValid = !isPakcoyChecked || (isPakcoyChecked && _pakcoyController.text.isNotEmpty && _pakcoyController.text != '0');
                        bool isKangkungValid = !isKangkungChecked || (isKangkungChecked && _kangkungController.text.isNotEmpty && _kangkungController.text != '0');
                        
                        // 3. Cek apakah setidaknya satu sayur dipilih
                        bool isAtLeastOneChecked = isSeladaChecked || isPakcoyChecked || isKangkungChecked;

                        // 4. Cek apakah semua validasi lolos
                        if (isFormValid && isSeladaValid && isPakcoyValid && isKangkungValid && isAtLeastOneChecked) {
                          String seladaQty = isSeladaChecked ? _seladaController.text : '0';
                          String pakcoyQty = isPakcoyChecked ? _pakcoyController.text : '0';
                          String kangkungQty = isKangkungChecked ? _kangkungController.text : '0';

                          // ignore: avoid_print
                          print('Sukses: Selada=$seladaQty, Pakcoy=$pakcoyQty, Kangkung=$kangkungQty');

                          // actions
                          
                        } else {
                          // Tampilkan pesan error
                          String errorMessage = 'Mohon periksa kembali data Anda:';
                          
                          if (!isFormValid) {
                            // Biarkan 'validate()' yang menampilkan error di field-nya
                          }
                          
                          if (!isAtLeastOneChecked) {
                            errorMessage += '\n- Pilih minimal satu jenis sayur.';
                          }

                          if (!isSeladaValid) {
                            errorMessage += '\n- Kuantitas Selada harus diisi.';
                          }
                          if (!isPakcoyValid) {
                            errorMessage += '\n- Kuantitas Pakcoy harus diisi.';
                          }
                          if (!isKangkungValid) {
                            errorMessage += '\n- Kuantitas Kangkung harus diisi.';
                          }

                          // Tampilkan dialog error
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: Text('Data Tidak Lengkap'),
                              content: Text(errorMessage),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(ctx),
                                  child: Text('OK'),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                      foregroundColor: AppColors.primary,
                      backgroundColor: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}