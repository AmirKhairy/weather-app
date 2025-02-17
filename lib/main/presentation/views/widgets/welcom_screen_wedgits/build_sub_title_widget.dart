import 'package:flutter/material.dart';

class BuildSubTitleWidget extends StatelessWidget {
  const BuildSubTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Enter your main city name to get started",
      style: TextStyle(
        fontSize: 18,
        color: Colors.white70,
      ),
      textAlign: TextAlign.center,
    );
  }
}
