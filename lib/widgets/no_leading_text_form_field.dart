import 'package:flutter/material.dart';
import 'package:hydroponics_app/theme/app_colors.dart';

class NoLeadingTextFormField extends StatelessWidget{
  final String hintText;
  final TextInputType inputType;
  final String? Function(String?)? validator;


  const NoLeadingTextFormField({
    super.key, 
    required this.hintText, 
    required this.inputType, 
    this.validator
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.primary,
      keyboardType: inputType,
      validator: validator,
      obscureText: false,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Color.fromARGB(255, 236, 236, 236),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(style: BorderStyle.none),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(
            color: AppColors.primary,
            width: 2.0
          )
        )
      ),
    );
  }
}