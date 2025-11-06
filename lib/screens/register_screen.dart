import 'package:flutter/material.dart';
import 'package:hydroponics_app/widgets/log_reg_footer.dart';
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
                    SizedBox(height: 50),
                    // Header
                    LogRegHeader(title: "DAFTAR", subtitle: "Buat akun Anda"),
                    _gap(),

                    // Username Field
                    StyledTextFormField(
                      labelText: 'Nama Pengguna',
                      hintText: 'Masukkan nama pengguna Anda',
                      prefixIcon: Icons.person,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Silakan masukkan nama pengguna Anda';
                        }
                        return null;
                      },
                    ),
                    _gap(),

                    // Role Dropdown Field
                    StyledDropdownButtonFormField<String>(
                      hintText: 'Pilih Posisi Anda',
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
                          return 'Silakan pilih posisi Anda';
                        }
                        return null;
                      },
                    ),
                    _gap(),

                    // Password Field
                    StyledTextFormField(
                      labelText: 'Kata Sandi',
                      hintText: 'Masukkan kata sandi Anda',
                      prefixIcon: Icons.lock_outline_rounded,
                      obscureText: !_isPasswordVisible,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Silakan masukkan kata sandi Anda';
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
                      hintText: 'Masukkan kembali kata sandi Anda',
                      prefixIcon: Icons.lock_outline_rounded,
                      obscureText: !_isConfirmPasswordVisible,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Silakan konfirmasi kata sandi Anda';
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
                          /// do something
                        }
                      },
                      text: 'Daftar',
                      foregroundColor: Colors.white,
                      backgroundColor: const Color.fromARGB(255, 116, 116, 116),
                    ),
                    SizedBox(height: 80),

                    LogRegFooter(
                      label: "Sudah punya akun?", 
                      buttonText: "Masuk", 
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                    ),
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