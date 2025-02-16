import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/main/presentation/manager/cubit/weather_cubit.dart';
import 'package:weather_app/main/presentation/manager/cubit/weather_states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = WeatherCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.blue[100],
          body: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/home_bg.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 20,
                            color: Colors.white,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "${cubit.weatherModel?.location!.name},",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            cubit.weatherModel?.location!.country ?? "",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.menu,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
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
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Text(
                                "${cubit.weatherModel?.current!.tempC}",
                                style: TextStyle(
                                  fontSize: 80,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Positioned(
                                top: 0,
                                right: -40,
                                child: Text(
                                  "°C",
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          RotatedBox(
                            quarterTurns: 3,
                            child: Row(
                              children: [
                                Image.network(
                                  "https:${cubit.weatherModel?.forecast!.forecastday![0].day!.condition?.icon}",
                                  width: 40,
                                  height: 40,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Icon(Icons.error);
                                  },
                                ),
                                Text(
                                  "${cubit.weatherModel?.current!.condition!.text}",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(30),
                          border:
                              Border.all(color: Colors.white.withOpacity(0.3)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.arrow_upward,
                                    color: Colors.white, size: 16),
                                SizedBox(width: 4),
                                Text(
                                  '${cubit.weatherModel?.forecast!.forecastday![0].day!.maxtempC}°',
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
                                Icon(Icons.arrow_downward,
                                    color: Colors.white, size: 16),
                                SizedBox(width: 4),
                                Text(
                                  '${cubit.weatherModel?.forecast!.forecastday![0].day!.mintempC}°',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(30),
                          border:
                              Border.all(color: Colors.white.withOpacity(0.3)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.water_drop,
                                        color: Colors.white, size: 15),
                                    SizedBox(width: 5),
                                    Text(
                                      '${cubit.weatherModel?.current!.humidity}',
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
                                      color: Colors.white.withOpacity(0.8),
                                      fontSize: 12),
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
                                    Icon(Icons.wind_power,
                                        color: Colors.white, size: 15),
                                    SizedBox(width: 5),
                                    Text(
                                      '${cubit.weatherModel?.current!.windKph} km/h',
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
                                      color: Colors.white.withOpacity(0.8),
                                      fontSize: 12),
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
                                    Icon(Icons.thermostat,
                                        color: Colors.white, size: 15),
                                    SizedBox(width: 5),
                                    Text(
                                      '${cubit.weatherModel?.current!.pressureIn}',
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
                                      color: Colors.white.withOpacity(0.8),
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        height: 150,
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: cubit.weatherModel?.forecast
                                  ?.forecastday?[0].hour?.length ??
                              0,
                          itemBuilder: (context, index) {
                            var hourlyData = cubit.weatherModel?.forecast
                                ?.forecastday?[0].hour?[index];

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
                            int hour12 =
                                (hour == 0 || hour == 12) ? 12 : hour % 12;

                            // Final formatted time
                            String formattedTime = "$hour12:$minutes $period";

                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                    color: Colors.white.withOpacity(0.3)),
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
                                      return Icon(Icons.error,
                                          color: Colors.white);
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
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        height: 150,
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: cubit.weatherModel?.forecast?.forecastday
                                  ?.length ??
                              0,
                          itemBuilder: (context, index) {
                            var dailyData = cubit
                                .weatherModel?.forecast?.forecastday?[index];

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
                                border: Border.all(
                                    color: Colors.white.withOpacity(0.3)),
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
                                      return Icon(Icons.error,
                                          color: Colors.white);
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
                      ),
                      SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
