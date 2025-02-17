import 'package:flutter/material.dart';

class BuildDarkOverlayWidget extends StatelessWidget {
  const BuildDarkOverlayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.3),
    );
  }
}
