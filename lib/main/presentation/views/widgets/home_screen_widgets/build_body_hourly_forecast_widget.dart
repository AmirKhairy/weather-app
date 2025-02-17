import 'package:flutter/material.dart';
import 'package:weather_app/main/presentation/manager/cubit/weather_cubit.dart';

class BuildBodyHourlyForecastWidget extends StatelessWidget {
  const BuildBodyHourlyForecastWidget({super.key, required this.cubit});
  final WeatherCubit cubit;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount:
            cubit.weatherModel?.forecast?.forecastday?[0].hour?.length ?? 0,
        itemBuilder: (context, index) {
          var hourlyData =
              cubit.weatherModel?.forecast?.forecastday?[0].hour?[index];

          if (hourlyData == null) return SizedBox();

          // Extract the time string (e.g., "2024-02-16 13:00")
          String fullTime = hourlyData.time ?? "--:--";

          // Convert "2024-02-16 13:00" → "13:00"
          String timeOnly = fullTime.split(" ")[1];

          // Extract hours and minutes
          int hour = int.parse(timeOnly.split(":")[0]);
          String minutes = timeOnly.split(":")[1];

          // Determine AM or PM
          String period = hour >= 12 ? "PM" : "AM";

          // Convert 24-hour to 12-hour format
          int hour12 = (hour == 0 || hour == 12) ? 12 : hour % 12;

          // Final formatted time
          String formattedTime = "$hour12:$minutes $period";

          return Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.white.withOpacity(0.3)),
            ),
            child: Column(
              children: [
                // Formatted Time with AM/PM
                Text(
                  formattedTime, // Example: "1:00 PM"
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 14,
                  ),
                ),

                // Temperature
                Text(
                  '${hourlyData.tempC ?? "--"}°C',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                // Weather Icon
                Image.network(
                  "https:${cubit.weatherModel?.forecast!.forecastday![0].day!.condition?.icon ?? ""}",
                  width: 40,
                  height: 40,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.error, color: Colors.white);
                  },
                ),

                // Weather Condition Text
                Text(
                  hourlyData.condition?.text ?? "Unknown",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
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
