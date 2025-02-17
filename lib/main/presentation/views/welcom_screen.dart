import 'package:flutter/material.dart';
import 'package:weather_app/main/presentation/views/widgets/welcom_screen_wedgits/build_background_widget.dart';
import 'package:weather_app/main/presentation/views/widgets/welcom_screen_wedgits/build_city_input_field.dart';
import 'package:weather_app/main/presentation/views/widgets/welcom_screen_wedgits/build_dark_overlay_widget.dart';
import 'package:weather_app/main/presentation/views/widgets/welcom_screen_wedgits/build_get_weather_button_widget.dart';
import 'package:weather_app/main/presentation/views/widgets/welcom_screen_wedgits/build_sub_title_widget.dart';
import 'package:weather_app/main/presentation/views/widgets/welcom_screen_wedgits/build_title_widget.dart';

class WelcomeScreen extends StatelessWidget {
  final TextEditingController _controller =
      TextEditingController(text: 'cairo');

  WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BuildBackgroundWidget(),
          BuildDarkOverlayWidget(),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BuildTitleWidget(),
                  SizedBox(height: 20),
                  BuildSubTitleWidget(),
                  SizedBox(height: 30),
                  BuildCityInputField(
                    controller: _controller,
                  ),
                  SizedBox(height: 20),
                  BuildGetWeatherButtonWidget(
                    controller: _controller,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
