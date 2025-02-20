import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weather_app/main/presentation/manager/cubit/weather_cubit.dart';
import 'package:weather_app/main/presentation/manager/cubit/weather_states.dart';
import 'package:weather_app/main/presentation/views/widgets/home_screen_widgets/build_body_daily_forecast_widget.dart';
import 'package:weather_app/main/presentation/views/widgets/home_screen_widgets/build_body_date_widget.dart';
import 'package:weather_app/main/presentation/views/widgets/home_screen_widgets/build_body_details_widget.dart';
import 'package:weather_app/main/presentation/views/widgets/home_screen_widgets/build_body_hourly_forecast_widget.dart';
import 'package:weather_app/main/presentation/views/widgets/home_screen_widgets/build_body_max_and_min_widget.dart';
import 'package:weather_app/main/presentation/views/widgets/home_screen_widgets/build_body_temp_wedget.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherStates>(
      listener: (context, state) {
        if (state is SearchError) {
          Fluttertoast.showToast(
            msg: 'Location not found',
            backgroundColor: Colors.red,
            textColor: Colors.white,
          );
        }
      },
      builder: (context, state) {
        var cubit = WeatherCubit.get(context).searchModel;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 76, 1, 182),
            title: Text(
              'Search',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/background_4.jpeg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: controller,
                        style: TextStyle(color: Colors.white),
                        cursorColor: Colors.blue,
                        decoration: InputDecoration(
                          suffixIcon: ElevatedButton(
                            onPressed: () {
                              WeatherCubit.get(context)
                                  .getSearch(location: controller.text);
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  vertical: 19, horizontal: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              backgroundColor:
                                  const Color.fromARGB(255, 76, 1, 182),
                            ),
                            child: state is SearchLoading
                                ? CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  )
                                : Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ),
                          ),
                          hintText: "Enter city name",
                          hintStyle: TextStyle(color: Colors.white70),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 152, 104, 226),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon:
                              Icon(Icons.location_city, color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      if (state is SearchSuccess)
                        Column(
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
                                  "${cubit?.location!.name},",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  cubit?.location!.country ?? "",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            // Date
                            BuildBodyDateWidget(cubit: cubit!),
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
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
