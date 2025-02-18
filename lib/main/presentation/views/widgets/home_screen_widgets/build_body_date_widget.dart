import 'package:flutter/material.dart';
import 'package:weather_app/main/data/models/weather_model/weather_model.dart';

class BuildBodyDateWidget extends StatelessWidget {
  const BuildBodyDateWidget({super.key, required this.cubit});
  final WeatherModel cubit;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${cubit.location!.localtime}',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
        Image.network(
          "https:${cubit.current!.condition!.icon}",
          width: 60,
          height: 60,
          errorBuilder: (context, error, stackTrace) {
            return Icon(Icons.error);
          },
        ),
      ],
    );
  }
}
