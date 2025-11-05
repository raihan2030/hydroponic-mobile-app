// lib/widgets/styled_elevated_button.dart

import 'package:flutter/material.dart';

class StyledElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? foregroundColor;
  final Color? backgroundColor;

  const StyledElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.foregroundColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          foregroundColor: foregroundColor,
          backgroundColor: backgroundColor,
          elevation: 3.0
        ),
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}