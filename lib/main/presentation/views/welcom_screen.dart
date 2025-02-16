import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/utils/constants/constants.dart';
import 'package:weather_app/main/presentation/manager/cubit/weather_cubit.dart';
import 'package:weather_app/main/presentation/manager/cubit/weather_states.dart';
import 'package:weather_app/main/presentation/views/home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  final TextEditingController _controller =
      TextEditingController(text: 'cairo');

  WelcomeScreen({super.key});

  Widget _buildBackgroundImage() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/home_bg.jpeg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildDarkOverlay() {
    return Container(
      color: Colors.black.withOpacity(0.3),
    );
  }

  Widget _buildTitle() {
    return Text(
      "Welcome to Weather App",
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildSubtitle() {
    return Text(
      "Enter your main city name to get started",
      style: TextStyle(
        fontSize: 18,
        color: Colors.white70,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildCityInputField() {
    return TextField(
      controller: _controller,
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

  Widget _buildGetWeatherButton(BuildContext context) {
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
            location = _controller.text;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackgroundImage(),
          _buildDarkOverlay(),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildTitle(),
                  SizedBox(height: 20),
                  _buildSubtitle(),
                  SizedBox(height: 30),
                  _buildCityInputField(),
                  SizedBox(height: 20),
                  _buildGetWeatherButton(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
