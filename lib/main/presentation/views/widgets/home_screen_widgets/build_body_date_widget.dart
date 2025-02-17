import 'package:flutter/material.dart';
import 'package:weather_app/main/presentation/manager/cubit/weather_cubit.dart';

class BuildBodyDateWidget extends StatelessWidget {
  const BuildBodyDateWidget({super.key, required this.cubit});
  final WeatherCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Today, ${TimeOfDay.now().format(context)}',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
        Image.network(
          "https:${cubit.weatherModel?.current!.condition!.icon}",
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
