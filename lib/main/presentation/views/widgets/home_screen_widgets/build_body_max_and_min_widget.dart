import 'package:flutter/material.dart';
import 'package:weather_app/main/presentation/manager/cubit/weather_cubit.dart';

class BuildMaxAndMinWidget extends StatelessWidget {
  const BuildMaxAndMinWidget({super.key, required this.cubit});
  final WeatherCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Container(
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
                      );
  }
}