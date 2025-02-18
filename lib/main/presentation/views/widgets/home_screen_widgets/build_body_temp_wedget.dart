import 'package:flutter/material.dart';
import 'package:weather_app/main/data/models/weather_model/weather_model.dart';

class BuildBodyTempWidget extends StatelessWidget {
  const BuildBodyTempWidget({super.key, required this.cubit});
  final WeatherModel cubit;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Text(
              "${cubit.current!.tempC}",
              style: TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Positioned(
              top: 0,
              right: -40,
              child: Text(
                "°C",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        Spacer(),
        RotatedBox(
          quarterTurns: 3,
          child: Row(
            children: [
              Image.network(
                "https:${cubit.forecast!.forecastday![0].day!.condition?.icon}",
                width: 40,
                height: 40,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.error);
                },
              ),
              Text(
                "${cubit.current!.condition!.text}",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
