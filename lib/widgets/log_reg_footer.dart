import 'package:flutter/material.dart';
import 'package:hydroponics_app/widgets/styled_elevated_button.dart';

class LogRegFooter extends StatelessWidget {
  final String label;
  final String buttonText;
  final VoidCallback onPressed;

  const LogRegFooter({
    Key? key,
    required this.label,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontFamily: 'Roboto',
            ),
          ),
        ),
        StyledElevatedButton(
          text: buttonText,
          onPressed: onPressed,
          foregroundColor: const Color.fromARGB(255, 87, 87, 87),
          backgroundColor: const Color.fromARGB(255, 233, 233, 233),
        ),
        const SizedBox(height: 100),
      ],
    );
  }
}