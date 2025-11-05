import 'package:flutter/material.dart';

class LogRegHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const LogRegHeader({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            title,
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
            subtitle,
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
}

