import 'package:flutter/material.dart';

class BuildTitleWidget extends StatelessWidget {
  const BuildTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Welcome to Weather App",
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      textAlign: TextAlign.center,
    );
  }
}
