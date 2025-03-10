import 'package:flutter/material.dart';
import 'package:weather_app/main/data/models/weather_model/weather_model.dart';
import 'package:weather_app/main/presentation/views/search_screen.dart';
import 'package:weather_app/main/presentation/views/welcom_screen.dart';
import 'package:weather_app/main/presentation/views/widgets/home_screen_widgets/build_drawer_menu_item_widget.dart';

class BuildDrawerWidget extends StatelessWidget {
  const BuildDrawerWidget({super.key, required this.cubit});
  final WeatherModel cubit;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromRGBO(127, 152, 104, 226),
      child: Column(
        children: [
          // Drawer Header with Gradient
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 76, 1, 182),
                  const Color.fromARGB(255, 152, 104, 226)
                ],
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
                        cubit.location!.name ?? "", // Dynamic location
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        cubit.location!.country ?? "", // Dynamic country
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
                  icon: Icons.search,
                  text: "Search for a City",
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SearchScreen(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 10),
                BuildDrawerMenuItemWidget(
                  icon: Icons.edit_location_alt,
                  text: "Change Location",
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => WelcomeScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
