import 'package:flutter/material.dart';
import 'package:hydroponics_app/theme/app_colors.dart';
import 'package:hydroponics_app/widgets/log_reg_header.dart';
import 'package:hydroponics_app/widgets/styled_elevated_button.dart';
import 'package:hydroponics_app/widgets/styled_text_form_field.dart';
import 'package:hydroponics_app/widgets/styled_dropdown_button_form_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  String? _selectedCategory;
  final List<String> _categories = [
    'Petani',
    'Kurir',
    'Staf Logistik',
    'Admin',
  ];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Center(
          child: Card(
            color: Colors.white,
            elevation: 0.0,
            child: Container(
              padding: const EdgeInsets.all(10.0),
              constraints: const BoxConstraints(maxWidth: 350),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Header
                    LogRegHeader(title: "BUAT AKUN", subtitle: "Buat akun karyawan"),
                    _gap(),

                    // Username Field
                    StyledTextFormField(
                      labelText: 'Nama Pengguna',
                      hintText: 'Masukkan nama pengguna',
                      prefixIcon: Icons.person,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Silakan masukkan nama pengguna';
                        }
                        return null;
                      },
                    ),
                    _gap(),

                    // Role Dropdown Field
                    StyledDropdownButtonFormField<String>(
                      hintText: 'Pilih Posisi',
                      prefixIcon: Icons.card_travel,
                      value: _selectedCategory,
                      items: _categories.map((String category) {
                        return DropdownMenuItem<String>(
                          value: category,
                          child: Text(category),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedCategory = newValue;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Silakan pilih posisi karyawan';
                        }
                        return null;
                      },
                    ),
                    _gap(),

                    // Password Field
                    StyledTextFormField(
                      labelText: 'Kata Sandi',
                      hintText: 'Masukkan kata sandi',
                      prefixIcon: Icons.lock_outline_rounded,
                      obscureText: !_isPasswordVisible,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Silakan masukkan kata sandi';
                        }
                        return null;
                      },
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                    _gap(),

                    // Confirm Password Field
                    StyledTextFormField(
                      labelText: 'Konfirmasi Kata Sandi',
                      hintText: 'Masukkan kembali kata sandi',
                      prefixIcon: Icons.lock_outline_rounded,
                      obscureText: !_isConfirmPasswordVisible,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Silakan konfirmasi kata sandi';
                        }
                        return null;
                      },
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isConfirmPasswordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                          });
                        },
                      ),
                    ),
                    _gap(),
                    _gap(),

                    // Register Button
                    StyledElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          Navigator.pushNamed(context, '/login');
                        }
                      },
                      text: 'Tambah Akun',
                      foregroundColor: Colors.white,
                      backgroundColor: AppColors.primary,
                    ),
                    SizedBox(height: 10,),

                    // Back Button
                    StyledElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);                        
                      },
                      text: 'Kembali',
                      foregroundColor: AppColors.primary,
                      backgroundColor: const Color.fromARGB(255, 233, 233, 233),
                    ),
                    SizedBox(height: 80,)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  
  Widget _gap() => const SizedBox(height: 16);
}