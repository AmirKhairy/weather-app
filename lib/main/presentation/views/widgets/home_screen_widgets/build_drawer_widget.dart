import 'package:flutter/material.dart';
import 'package:weather_app/main/presentation/manager/cubit/weather_cubit.dart';
import 'package:weather_app/main/presentation/views/welcom_screen.dart';
import 'package:weather_app/main/presentation/views/widgets/home_screen_widgets/build_drawer_menu_item_widget.dart';

class BuildDrawerWidget extends StatelessWidget {
  const BuildDrawerWidget({super.key, required this.cubit});
  final WeatherCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          // Drawer Header with Gradient
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.lightBlueAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on, size: 50, color: Colors.white),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cubit.weatherModel?.location!.name ??
                            "", // Dynamic location
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        cubit.weatherModel?.location!.country ??
                            "", // Dynamic country
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 20),

          // Buttons with Modern Design
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                BuildDrawerMenuItemWidget(
                  icon: Icons.edit_location,
                  text: "Change Location",
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => WelcomeScreen(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 10),
                BuildDrawerMenuItemWidget(
                  icon: Icons.search,
                  text: "Search for a City",
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

