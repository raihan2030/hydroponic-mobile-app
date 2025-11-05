import 'package:flutter/material.dart';
import 'package:hydroponics_app/widgets/log_reg_footer.dart';
import 'package:hydroponics_app/widgets/log_reg_header.dart';
import 'package:hydroponics_app/widgets/styled_elevated_button.dart';
import 'package:hydroponics_app/widgets/styled_text_form_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
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
                    LogRegHeader(title: "REGISTER", subtitle: "Create your account"),
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

                    // Role Field
                    StyledTextFormField(
                      labelText: 'Role',
                      hintText: 'Enter your role',
                      prefixIcon: Icons.card_travel,
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
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    _gap(),

                    // Confirm Password Field
                    StyledTextFormField(
                      labelText: 'Confirm Password',
                      hintText: 'Re-enter your password',
                      prefixIcon: Icons.lock_outline_rounded,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        return null;
                      },
                    ),
                    _gap(),
                    _gap(),

                    // Register Button
                    StyledElevatedButton(
                      onPressed: () {
                        // Handle registration logic here
                      },
                      text: 'Register',
                      foregroundColor: Colors.white,
                      backgroundColor: const Color.fromARGB(255, 116, 116, 116),
                    ),
                    SizedBox(height: 80),

                    LogRegFooter(
                      label: "Already have an account?", 
                      buttonText: "Login", 
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