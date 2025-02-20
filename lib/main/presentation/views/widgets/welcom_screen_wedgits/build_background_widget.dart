import 'package:flutter/material.dart';

class BuildBackgroundWidget extends StatelessWidget {
  const BuildBackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background_3.jpeg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
