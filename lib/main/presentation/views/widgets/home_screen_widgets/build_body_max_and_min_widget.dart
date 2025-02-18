import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/main/data/models/weather_model/weather_model.dart';

class BuildMaxAndMinWidget extends StatelessWidget {
  const BuildMaxAndMinWidget({super.key, required this.cubit});
  final WeatherModel cubit;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              FaIcon(
                FontAwesomeIcons.temperatureHigh,
                color: Colors.red,
                size: 16,
              ),
              SizedBox(width: 4),
              Text(
                '${cubit.forecast!.forecastday![0].day!.maxtempC}°',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(width: 16),
          Row(
            children: [
              FaIcon(
                FontAwesomeIcons.temperatureLow,
                color: Colors.blue,
                size: 16,
              ),
              SizedBox(width: 4),
              Text(
                '${cubit.forecast!.forecastday![0].day!.mintempC}°',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
