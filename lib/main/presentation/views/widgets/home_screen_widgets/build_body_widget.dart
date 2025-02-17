import 'package:flutter/material.dart';
import 'package:weather_app/main/presentation/manager/cubit/weather_cubit.dart';
import 'package:weather_app/main/presentation/views/widgets/home_screen_widgets/build_body_daily_forecast_widget.dart';
import 'package:weather_app/main/presentation/views/widgets/home_screen_widgets/build_body_date_widget.dart';
import 'package:weather_app/main/presentation/views/widgets/home_screen_widgets/build_body_details_widget.dart';
import 'package:weather_app/main/presentation/views/widgets/home_screen_widgets/build_body_header_widget.dart';
import 'package:weather_app/main/presentation/views/widgets/home_screen_widgets/build_body_hourly_forecast_widget.dart';
import 'package:weather_app/main/presentation/views/widgets/home_screen_widgets/build_body_max_and_min_widget.dart';
import 'package:weather_app/main/presentation/views/widgets/home_screen_widgets/build_body_temp_wedget.dart';

class BuildBodyWidget extends StatelessWidget {
  const BuildBodyWidget(
      {super.key, required this.scaffoldKey, required this.cubit});
  final GlobalKey<ScaffoldState> scaffoldKey;
  final WeatherCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // background image
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/home_bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // body
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                BuildBodyHeaderWidget(
                  scaffoldKey: scaffoldKey,
                  cubit: cubit,
                ),
                SizedBox(height: 8),
                // Date
                BuildBodyDateWidget(cubit: cubit),
                SizedBox(height: 10),
                // Temp
                BuildBodyTempWidget(
                  cubit: cubit,
                ),
                // Max and Min
                BuildMaxAndMinWidget(cubit: cubit),
                SizedBox(height: 20),
                // Details
                BuildBodyDetailsWidget(cubit: cubit),
                SizedBox(height: 10),
                // Hourly forecast
                BuildBodyHourlyForecastWidget(
                  cubit: cubit,
                ),
                SizedBox(height: 10),
                // Daily forecast
                BuildBodyDailyForecastWidget(
                  cubit: cubit,
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
