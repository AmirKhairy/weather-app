import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/utils/constants/constants.dart';
import 'package:weather_app/main/presentation/manager/cubit/weather_cubit.dart';
import 'package:weather_app/main/presentation/manager/cubit/weather_states.dart';
import 'package:weather_app/main/presentation/views/home_screen.dart';

class BuildGetWeatherButtonWidget extends StatelessWidget {
  final TextEditingController controller;
  const BuildGetWeatherButtonWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherStates>(
      listener: (context, state) {
        if (state is WeatherSuccess) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
            (route) => false,
          );
        }
      },
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () {
            location = controller.text;
            WeatherCubit.get(context).getWeather(location: location);
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            backgroundColor: Colors.blueAccent,
          ),
          child: state is WeatherLoading
              ? CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(
                  "Get Started",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
        );
      },
    );
  }
}
