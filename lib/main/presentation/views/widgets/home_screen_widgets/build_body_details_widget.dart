import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/main/data/models/weather_model/weather_model.dart';

class BuildBodyDetailsWidget extends StatelessWidget {
  const BuildBodyDetailsWidget({super.key, required this.cubit});
  final WeatherModel cubit;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.droplet,
                    color: Colors.white,
                    size: 15,
                  ),
                  SizedBox(width: 5),
                  Text(
                    '${cubit.current!.humidity}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Text(
                'humidity',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white.withOpacity(0.8), fontSize: 12),
              ),
            ],
          ),
          Container(
            height: 40,
            width: 1,
            color: Colors.white.withOpacity(0.3),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.wind,
                    color: Colors.white,
                    size: 15,
                  ),
                  SizedBox(width: 5),
                  Text(
                    '${cubit.current!.windKph} km/h',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Text(
                'Wind Speed',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white.withOpacity(0.8), fontSize: 12),
              ),
            ],
          ),
          Container(
            height: 40,
            width: 1,
            color: Colors.white.withOpacity(0.3),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.tachometerAlt,
                    color: Colors.white,
                    size: 15,
                  ),
                  SizedBox(width: 5),
                  Text(
                    '${cubit.current!.pressureIn}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Text(
                'Pressure (in)',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white.withOpacity(0.8), fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
