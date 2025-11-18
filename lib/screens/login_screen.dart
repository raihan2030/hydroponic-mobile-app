import 'package:flutter/material.dart';
import 'package:hydroponics_app/theme/app_colors.dart';
import 'package:hydroponics_app/widgets/styled_elevated_button.dart';
import 'package:hydroponics_app/widgets/styled_text_form_field.dart';
import 'package:hydroponics_app/widgets/log_reg_header.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
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
                      LogRegHeader(title: "MASUK", subtitle: "Selamat Datang"),
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
                          // if (value.length < 6) {
                          //   return 'Kata sandi harus terdiri dari minimal 6 karakter';
                          // }
                          // Ini nanti dulu
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

                      _buildForgotPasswordButton(),
                      _gap(),

                      // Login Button
                      StyledElevatedButton(
                        text: 'Masuk',
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            Navigator.pushNamed(context, '/farmer_navigation');
                          }
                        },
                        foregroundColor: Colors.white,
                        backgroundColor: AppColors.primary,
                      ),
                      SizedBox(height: 100)             
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Specific Widget Builders

  Widget _buildForgotPasswordButton() {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: TextButton(
          onPressed: () {
            /// do something
          },
          style: ButtonStyle(
            overlayColor: WidgetStateProperty.resolveWith(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.pressed)) {
                  // ignore: deprecated_member_use
                  return Color.fromARGB(255, 189, 189, 189).withOpacity(0.2);
                }                
                return null; 
              },
            ),
          ),
          child: const Text(
            'Lupa Kata Sandi?',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontFamily: 'Roboto',
              color: Color.fromARGB(255, 59, 59, 59),
            ),
          ),
        ),
      ),
    );
  }

    Widget _gap() => const SizedBox(height: 16);
}
