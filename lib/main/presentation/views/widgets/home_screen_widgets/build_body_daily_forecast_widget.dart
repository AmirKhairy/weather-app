import 'package:flutter/material.dart';
import 'package:weather_app/main/presentation/manager/cubit/weather_cubit.dart';

class BuildBodyDailyForecastWidget extends StatelessWidget {
  const BuildBodyDailyForecastWidget({super.key, required this.cubit});
  final WeatherCubit cubit;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: cubit.weatherModel?.forecast?.forecastday?.length ?? 0,
        itemBuilder: (context, index) {
          var dailyData = cubit.weatherModel?.forecast?.forecastday?[index];

          if (dailyData == null) return SizedBox();

          // Extract Date (e.g., "2024-02-17")
          String fullDate = dailyData.date ?? "--";
          DateTime parsedDate = DateTime.parse(fullDate);

          // Get weekday name (e.g., "Saturday")
          String dayName = [
            "Sunday",
            "Monday",
            "Tuesday",
            "Wednesday",
            "Thursday",
            "Friday",
            "Saturday"
          ][parsedDate.weekday % 7];

          return Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.white.withOpacity(0.3)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Day Name (e.g., "Saturday")
                Text(
                  dayName,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 14,
                  ),
                ),

                // Temperature (Average)
                Text(
                  'avg: ${dailyData.day?.avgtempC ?? "--"}°C',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                // Weather Icon
                Image.network(
                  "https:${dailyData.day?.condition?.icon ?? ""}",
                  width: 40,
                  height: 40,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.error, color: Colors.white);
                  },
                ),

                // Weather Condition Text (e.g., "Partly Cloudy")
                Text(
                  dailyData.day?.condition?.text ?? "Unknown",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
