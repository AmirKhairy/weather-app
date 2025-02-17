import 'package:flutter/material.dart';

class BuildCityInputField extends StatelessWidget {
  final TextEditingController controller;
  const BuildCityInputField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.blue,
      decoration: InputDecoration(
        hintText: "Enter city name",
        hintStyle: TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.white.withOpacity(0.2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        prefixIcon: Icon(Icons.location_city, color: Colors.white),
      ),
      onChanged: (value) {},
    );
  }
}
