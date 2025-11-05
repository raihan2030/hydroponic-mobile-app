// lib/screens/login_screen.dart

import 'package:flutter/material.dart';
import 'package:hydroponics_app/widgets/styled_elevated_button.dart';
import 'package:hydroponics_app/widgets/styled_text_form_field.dart';

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
                    _buildHeader(),
                    _gap(),

                    // Username Field
                    StyledTextFormField(
                      labelText: 'Username',
                      hintText: 'Enter your username',
                      prefixIcon: Icons.person,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    _gap(),

                    // Password Field
                    StyledTextFormField(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      prefixIcon: Icons.lock_outline_rounded,
                      obscureText: !_isPasswordVisible,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
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

                    _buildForgotPasswordButton(),
                    _gap(),

                    // Login Button
                    StyledElevatedButton(
                      text: 'Login',
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          /// do something
                        }
                      },
                      foregroundColor: Color.fromARGB(255, 59, 59, 59),
                      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
                    ),
                    SizedBox(height: 100),

                    // Footer
                    _buildFooter(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Specific Widget Builders

  Widget _buildHeader() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "LOGIN",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w900,
              fontFamily: 'Roboto',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 35.0, bottom: 13.0),
          child: Text(
            "Welcome",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontFamily: 'Roboto',
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordButton() {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: TextButton(
          onPressed: () {
            /// do something
          },
          child: const Text(
            'Forgot Password?',
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

  Widget _buildFooter() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: Text(
            "Don't have an account?",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontFamily: 'Roboto',
            ),
          ),
        ),
        // Menggunakan Widget Tombol Baru Kita
        StyledElevatedButton(
          text: 'Register',
          onPressed: () {
            Navigator.pushNamed(context, '/register');
          },
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 116, 116, 116),
        ),
      ],
    );
  }

  Widget _gap() => const SizedBox(height: 16);
}
