import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/utils/constants/bloc_observer.dart';
import 'package:weather_app/core/utils/shared_preferences/cache_helper.dart';
import 'package:weather_app/main/presentation/manager/cubit/weather_cubit.dart';
import 'package:weather_app/main/presentation/views/home_screen.dart';
import 'package:weather_app/main/presentation/views/welcom_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  String? savedLocation = CacheHelper.getString(key: 'location');

  runApp(MyApp(
    openScreen: savedLocation == null ? WelcomeScreen() : HomeScreen(),
    savedLocation: savedLocation,
  ));
}

class MyApp extends StatelessWidget {
  final Widget openScreen;
  final String? savedLocation;

  const MyApp({super.key, required this.openScreen, this.savedLocation});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        var cubit = WeatherCubit();
        if (savedLocation != null) {
          cubit.getWeather(location: savedLocation!);
        }
        return cubit;
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: openScreen,
      ),
    );
  }
}
